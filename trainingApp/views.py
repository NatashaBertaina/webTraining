import random

from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse, HttpResponseRedirect
from django.views import generic, View
from django.views.generic.edit import FormView
from django.views.generic import ListView
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from .forms import QuestionForm
from .models import Training, Deploy, DeployAnswer, TraineeTraining,Trainee,TraineeTraining
from django.utils import timezone

from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.contrib import messages

cont = 0

#Vista para ver la lista de trainings
class TrainingList(ListView):
    model = Training 
    template_name = "trainingApp/training_List.html"
    context_object_name = "training_list"
    queryset = Training.objects.all().order_by('id')
    paginate_by = 1  # Especifica la cantidad de objetos por página
    
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        user = self.request.user
        trainee = Trainee.objects.get(user_id=user.id)
        
        # Añado un diccionario al context donde esta el id de cada training con la cantidad de veces realizado por el trainee
        context['num_trainee_trainings'] = {training.id: training.get_num_trainee_trainings(trainee.id) for training in context['training_list']}
        
        return context

#Vista para ver los deploys de un training y resolverlos
class DeployDetailView(View):
    template_name = 'trainingApp/forms.html'

    def get(self, request, training_id):
        deploys = Deploy.objects.filter(training_id=training_id)
        current_deploy_index = request.session.get('current_deploy_index', 0)
        current_deploy = deploys[current_deploy_index]
        
        # Verifica si es la primera vez que el trainee ingresa al entrenamiento
        self.initialize_trainee_training(request, training_id)

        self.form = QuestionForm(instance=current_deploy)

        return render(request, self.template_name, {'deploy': current_deploy, 'form':self.form})
    
    def post(self, request, training_id):
        deploys = Deploy.objects.filter(training_id=training_id)
        
        current_deploy_index = request.session.get('current_deploy_index', 0)
        current_deploy = deploys[current_deploy_index]
        
        form = QuestionForm(request.POST, instance=current_deploy)

        if form.is_valid():
            # Guarda la respuesta del usuario en un nuevo objeto DeployAnswer
            deploy_answer = DeployAnswer(
                trainee_Training_id=request.session.get('current_trainee_training_id'),
                deploy=current_deploy,
                user_response=form.cleaned_data['user_response']
            )
            deploy_answer.save()

            # Avanzar al siguiente deploy
            current_deploy_index += 1
            #Si se llega al final del trainings entonces se lo redicciona al home y se resetea el current_deploy_index
            if current_deploy_index >= deploys.count():
                request.session['current_deploy_index'] = 0   
                del request.session['current_trainee_training_id']
                
                training = Training.objects.get(pk=training_id) 
                messages.success(request,f" You have completed {training.name_training}")

                return redirect('home')


            # Guardar el índice actual en la sesión
            request.session['current_deploy_index'] = current_deploy_index

            return redirect('trainingApp:forms', training_id=training_id)

        else:
            # Si el formulario no es válido, renderizar la plantilla con el formulario nuevamente,
            # resaltando lo que falta para poder enviarlo.
            return render(request, self.template_name, {'deploy': current_deploy, 'form': form})
        
        
    def initialize_trainee_training(self, request, training_id):
        # Verifica si es la primera vez que el trainee ingresa al entrenamiento
        if 'current_trainee_training_id' not in request.session:
            usuario = request.user
            trainee= Trainee.objects.get(user_id=usuario.id)

            # Se crea un nuevo objeto TraineeTraining y se guarda en la base de datos
            trainee_training = TraineeTraining.objects.create(
                trainee=trainee,
                training=get_object_or_404(Training, pk=training_id),
                pub_date=timezone.now()
            )

            # Almacena el ID del TraineeTraining en la sesión
            request.session['current_trainee_training_id'] = trainee_training.id

