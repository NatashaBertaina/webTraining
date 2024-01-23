from typing import Any
from datetime import datetime, timedelta
from operator import attrgetter
from django.db.models.query import QuerySet
from django.shortcuts import render, redirect, get_object_or_404
from django.views.generic import ListView
from django.views import View
from django.utils import timezone
from django.contrib import messages
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User

from .forms import QuestionForm
from .models import Training, Trainee, Deploy, DeployType, Ans, TraineeTraining, Choice



class IndexView(ListView):
    model = Training
    template_name = 'trainingApp/training_List.html'
    context_object_name = 'training_available'

    #Esto debe ir cambiando según nivel del usuario.
    queryset = Training.objects.all()
    

    paginate_by = 10

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        user = self.request.user
        trainee = Trainee.objects.get(user_id=user.id)

        #Diccionario que cuenta la cantidad de veces realizado el training
        context['num_trainee_trainings'] = {training.id: training.get_num_trainee_trainings(trainee.id) for training in context['training_available']}
        return context
    
class DeployDetailView(View):
    template_name = 'trainingApp/forms.html'

    def get(self, request, training_id):
        deploys = Deploy.objects.filter(training_id=training_id).order_by('deploy_type_id')
        current_deploy_index = request.session.get('current_deploy_index', 0)
        current_deploy = deploys[current_deploy_index]

        #Verifica si es la primera vez que se ingresa al entrenamiento
        self.initialize_trainee_training(request, training_id)

        form = QuestionForm(instance=current_deploy)
        deployType = DeployType.objects.get(id=current_deploy.deploy_type.id)

        return render(request, self.template_name, {'deploy':current_deploy, 'form': form, 'deployType':deployType})
    
    def post(self, request, training_id):
        deploys = Deploy.objects.filter(training_id=training_id)

        current_deploy_index = request.session.get('current_deploy_index', 0)
        current_deploy = deploys[current_deploy_index]

        form = QuestionForm(request.POST, instance=current_deploy)

        if form.is_valid():
            #Lógica para guardar las respuestas de los usuarios
            deploy_answer = Ans(
                trainee_Training_id=request.session.get('current_trainee_training_id'),
                deploy=current_deploy,
                user_response=form.cleaned_data['user_response']
            )
            deploy_answer.save()

            #Lógica para avanzar al siguiente deploy y redirigir al inicio en caso de terminar con los deploys
            current_deploy_index += 1
            if current_deploy_index >= deploys.count():
                request.session['current_deploy_index'] = 0
                #Se obtiene el id del intento y se cambia el estado a completo
                current_trainee_training_id = request.session.get('current_trainee_training_id')
                trainee_training = TraineeTraining.objects.get(pk=current_trainee_training_id)
                trainee_training.state = "Completed"
                trainee_training.save()

                #Lógica para el tiempo empleado para completar un bloque de un entrenamiento
                start_time_str = request.session.get('start_time')
                start_time = datetime.fromisoformat(start_time_str)
                time_passed = datetime.now() - start_time

                total_time = time_passed.total_seconds()
                duration_timedelta = timedelta(seconds=total_time)

                trainee_training.time_spent = duration_timedelta
                trainee_training.save()

                #Borrar de la sesion los datos temporales
                del request.session['current_trainee_training_id']
                del request.session['start_time']

                training = Training.objects.get(pk=training_id)
                messages.success(request, f"Great! You have completes: {training.name_training}")

                return redirect('home')
            request.session['current_deploy_index'] = current_deploy_index

            return redirect('trainingApp:form', training_id=training_id)
        
        else:
            #Cuando el formulario no sea válido, se renderiza nuevamente resaltando lo que falta
            return render(request, self.template_name, {'deploy':current_deploy, 'form':form})
    
    #Verificando si es la primera vez que se ingresa al training
    def initialize_trainee_training(self, request, training_id):
        if 'current_trainee_training_id' not in request.session:
            user = request.user
            trainee = Trainee.objects.get(user_id=user.id)

            #Se genera una nueva fila en la base de trainee
            trainee_training = TraineeTraining.objects.create(
                trainee = trainee,
                training = get_object_or_404(Training, pk=training_id),
                pub_date = timezone.now(),
                state = "in_Progress"
            )
            request.session['current_trainee_training_id'] = trainee_training.id
            request.session['start_time'] = datetime.now().isoformat()
        #FALTA un return


#Vista para revisar los intentos realizados por un usuario
class ReviewList(ListView):
    model = TraineeTraining
    template_name = 'trainingApp/review_list.html'
    context_objects_name = 'trainee_training_list'
    paginate_by = 10

    def get_queryset(self):
        training_id = self.kwargs['training_id']

        #filtra los objetos por training_id y user_id (ambas base de datos se relacionan)
        queryset = TraineeTraining.objects.filter(
            training_id = training_id,
            trainee_id = self.request.user.trainee.id,
            state = "completed"
        )
        #Ordenando la forma en que se verán las revisiones (desde la más nueva a la mas vieja)
        #Agregar un campo item_number a cada objeto
        for i, trainee_training in enumerate(queryset, start=1):
            trainee_training.item_number = i
        
        queryset = sorted(queryset, key=attrgetter('item_number'), reverse=True)

        return queryset
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context

#Vista de una revisión individual
class Review(View):
    template_name = 'trainingApp/review.html'

    def get(self, request, trainee_training_id):
        trainee_training = TraineeTraining.objects.get(id=trainee_training_id)
        deploys_answer = Ans.objects.filter(trainee_Training_id=trainee_training_id)
        deploys = Deploy.objects.filter(training_id=trainee_training.training_id)

        #Indice del deploy
        current_deploy_index = request.session.get('current_deploy_index', 0)
        current_deploy = deploys[current_deploy_index]
        #Rta asociada al deploy actual
        current_deploy_answer = deploys_answer[current_deploy_index]
        choices = Choice.objects.filter(deploy_id=current_deploy.id)

        return render(request, self.template_name, {'deploy':current_deploy, 'choices':choices, 'deploy_answer':current_deploy_answer})
    
    def post(self, request, trainee_training_id):
        trainee_training = TraineeTraining.objects.get(id=trainee_training_id)
        deploys = Deploy.objects.filter(trainig_id=trainee_training.training_id)

        current_deploy_index = request.session.get('current_deploy_index', 0)
        current_deploy_index += 1
        #Al llegar al final de los deploy, se redirecciona a la lista de entrenamientos
        if current_deploy_index >= deploys.count():
            request.session['current_deploy_index'] = 0
            return redirect('trainingApp:training_List')
        
        request.session['current_deploy_index'] = current_deploy_index
        return redirect('trainingApp:review', trainee_training_id=trainee_training_id)