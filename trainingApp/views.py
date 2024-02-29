from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponseRedirect
from django.views import View
from django.views.generic import ListView
from .forms import QuestionForm,CommentForm
from .models import Training, Deploy, DeployAnswer, TraineeTraining,Trainee,TraineeTraining,DeployType,Choice,DeployType,Comment
from django.utils import timezone
from django.utils.translation import gettext as _

from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from operator import attrgetter
from datetime import datetime
from datetime import datetime, timedelta
from django.contrib.auth.mixins import LoginRequiredMixin  #LoginRequiredMixin se utiliza como un mixin para requerir que un usuario esté autenticado antes de acceder a una vista específica.
from django.urls import reverse

#Vista para ver la lista de trainings
class TrainingList(ListView):
    model = Training 
    template_name = "trainingApp/training_List.html"
    context_object_name = "training_list"
    queryset = Training.objects.filter(state_training = 'Active').order_by('id')
    paginate_by = 5  # Especifica la cantidad de objetos por página
    
    
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
        deploys = Deploy.objects.filter(training_id=training_id).order_by('deploy_type_id')
        
        current_deploy_index = request.session.get(f'current_deploy_index_{training_id}', 0)
        current_deploy = deploys[current_deploy_index]
        
        # Verifica si es la primera vez que el trainee ingresa al entrenamiento
        self.initialize_trainee_training(request, training_id)

        self.form = QuestionForm(instance=current_deploy)
        deployType = DeployType.objects.get(id = current_deploy.deploy_type.id)

        return render(request, self.template_name, {'deploy': current_deploy, 'form':self.form, 'deployType':deployType, 'current_deploy_index':current_deploy_index})
    
    def post(self, request, training_id):
        deploys = Deploy.objects.filter(training_id=training_id)
        
        current_deploy_index = request.session.get(f'current_deploy_index_{training_id}', 0)
        current_deploy = deploys[current_deploy_index]
        
        form = QuestionForm(request.POST, instance=current_deploy)

        if form.is_valid():
            # Guarda la respuesta del usuario en un nuevo objeto DeployAnswer
            deploy_answer = DeployAnswer(
                trainee_Training_id=request.session.get(f'current_trainee_training_id_{training_id}'),
                deploy=current_deploy,
                user_response=form.cleaned_data['user_response']
            )
            deploy_answer.save()

            # Avanzar al siguiente deploy
            current_deploy_index += 1
            #Si se llega al final del trainings entonces se lo redicciona al home y se resetea el current_deploy_index
            if current_deploy_index >= deploys.count():
                request.session[f'current_deploy_index_{training_id}'] = 0   
                #Se obtiene el traineetraining del intento y se cambia el estado a complated
                current_trainee_training_id = request.session.get(f'current_trainee_training_id_{training_id}')
                trainee_training = TraineeTraining.objects.get(pk=current_trainee_training_id)
                trainee_training.state = "Completed"
                trainee_training.save()
                
                # Logica para el tiempo empleado
                start_time_str = request.session.get(f'start_time_{training_id}')
                start_time = datetime.fromisoformat(start_time_str)
                tiempo_transcurrido = datetime.now() - start_time

                # Obtener la duración total en segundo
                duracion_total = tiempo_transcurrido.total_seconds()

                # Convertir la duración total a un objeto timedelta
                duracion_timedelta = timedelta(seconds=duracion_total)

                # Guardar la instancia en la base de datos
                trainee_training.time_spent = duracion_timedelta
                trainee_training.save()
                
                #Se borra de la session los datos temporales
                del request.session[f'current_deploy_index_{training_id}']
                del request.session[f'start_time_{training_id}']
                del request.session[f'current_trainee_training_id_{training_id}']
                
                training = Training.objects.get(pk=training_id) 
                messages.success(request,f" You have completed:  {training.name_training}")

                return HttpResponseRedirect(reverse('trainingApp:comment', args=[training_id]))


            # Guardar el índice actual en la sesión
            request.session[f'current_deploy_index_{training_id}'] = current_deploy_index

            return HttpResponseRedirect(reverse('trainingApp:forms', args=[training_id]))

        else:
            # Si el formulario no es válido, renderizar la plantilla con el formulario nuevamente,
            # resaltando lo que falta para poder enviarlo.
            return render(request, self.template_name, {'deploy': current_deploy, 'form': form})
        
        
    def initialize_trainee_training(self, request, training_id):
        # Verifica si es la primera vez que el trainee ingresa al entrenamiento
        if f'current_trainee_training_id_{training_id}' not in request.session:
            usuario = request.user
            trainee= Trainee.objects.get(user_id=usuario.id)

            # Se crea un nuevo objeto TraineeTraining y se guarda en la base de datos
            trainee_training = TraineeTraining.objects.create(
                trainee=trainee,
                training=get_object_or_404(Training, pk=training_id),
                pub_date=timezone.now(),
                state = "in_progress"
            )

            # Almacena el ID del TraineeTraining en la sesión
            request.session[f'current_trainee_training_id_{training_id}'] = trainee_training.id
            # Se guarda el tiempo de inicio del training
            request.session[f'start_time_{training_id}'] = datetime.now().isoformat()


#Vista de todos los intentos realizados por el trainee para un training
class ReviewList(ListView):
    model = TraineeTraining 
    template_name = "trainingApp/review_list.html"
    context_object_name = "trainee_training_list"
    paginate_by = 10  # Especifica la cantidad de objetos por página
    
    def get_queryset(self):
        # Obtén el training_id de la URL
        training_id = self.kwargs['training_id']
        
        # Filtra los objetos TraineeTraining por training_id y user_id
        queryset = TraineeTraining.objects.filter(
            training_id=training_id,
            trainee_id=self.request.user.trainee.id,
            state = "Completed"
        )
           # Agregar un campo 'item_number' a cada objeto TraineeTraining
        for i, trainee_training in enumerate(queryset, start=1):
            trainee_training.item_number = i
            
         # Ordenar el queryset por el campo 'item_number' de forma descendente
        queryset = sorted(queryset, key=attrgetter('item_number'), reverse=True)
        
        return queryset

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context

#Vista para ver un intento de un training
class Review(View):
    template_name = 'trainingApp/review.html'
    
    def get(self, request, trainee_training_id):
        trainee_training = TraineeTraining.objects.get(id= trainee_training_id)
        deploys_answer = DeployAnswer.objects.filter(trainee_Training_id=trainee_training_id)
        deploys = Deploy.objects.filter(training_id=trainee_training.training_id)
        
        #Indice del deploy actual
        current_deploy_index = request.session.get('current_deploy_index', 0)
        #Deploy actual
        current_deploy = deploys[current_deploy_index]
        #Respuesta asociada al deploy actual
        current_deploy_answer = deploys_answer[current_deploy_index]
        #Busco las choices asociadas al deploy actual
        choices = Choice.objects.filter(deploy_id = current_deploy.id)
        return render(request, self.template_name, {'deploy': current_deploy, 'choices':choices, 'deploy_answer':current_deploy_answer})
    
    def post(self, request, trainee_training_id): 
        trainee_training = TraineeTraining.objects.get(id= trainee_training_id)
        deploys = Deploy.objects.filter(training_id=trainee_training.training_id)
        
        #Obtengo el indice del deploy actual
        current_deploy_index = request.session.get('current_deploy_index', 0)
        # Avanzar al siguiente deploy
        current_deploy_index += 1
        #Si se llega al final del trainings entonces se lo redicciona al home y se resetea el current_deploy_index
        if current_deploy_index >= deploys.count():
            request.session['current_deploy_index'] = 0  
            return redirect('trainingApp:training_List')
        
        # Guardar el índice actual en la sesión
        request.session['current_deploy_index'] = current_deploy_index
        return redirect('trainingApp:review', trainee_training_id=trainee_training_id)
    
#Vista para realizar un comentario a un trainee
class CommentView(LoginRequiredMixin, View):
    login_url = 'signup' # Esta propiedad especifica la URL a la cual se redirigirá a los usuarios no autenticados
    template_name = "trainingApp/comment_form.html"

    def get(self, request, training_id):
        user = self.request.user
        trainee = Trainee.objects.get(user_id= user.id)
        
        commentform = CommentForm()

        return render(request, self.template_name, {"form": commentform})

    def post(self, request, training_id):
        user = self.request.user
        trainee = Trainee.objects.get(user_id= user.id)
        
        commentform = CommentForm(request.POST)
        
        if commentform.is_valid():
            comment = Comment.objects.create(
                trainee=trainee,
                training=get_object_or_404(Training, pk=training_id),
                pub_date=timezone.now(),
                more_liked = commentform.cleaned_data['more_liked'],
                least_liked = commentform.cleaned_data['least_liked'],
                stars = commentform.cleaned_data['stars'],
                comment_aditional= commentform.cleaned_data['comment_aditional'],
            )
            return HttpResponseRedirect(reverse('home'))

        else:
            messages.error(request," error")
            return HttpResponseRedirect(reverse('home'))
