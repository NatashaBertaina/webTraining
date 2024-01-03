from typing import Any
from django.db.models.query import QuerySet
from django.shortcuts import render, redirect, get_object_or_404
from django.http import HttpResponse, HttpResponseRedirect
from django.views.generic import ListView
from django.views import View
from django.utils import timezone
from django.contrib import messages

from .forms import FormA, FormB
from .models import Training, Block, Deploy, Ans, Trainee, TraineeBlock




class IndexView(ListView):
    model = Training
    template_name = 'training/list_training.html'
    context_object_name = 'training_available'

    #Esto debe ir cambiando según nivel del usuario.
    queryset = Training.objects.filter(level__contains='E')
    #queryset = List_Training.objects.order_by('level')

    paginate_by = 10
    

class BlockView(ListView):
    model = Block
    template_name = 'training/list_block.html'
    context_object_name = 'block_available'

    queryset = Block.objects.all().order_by('id')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['message'] = 'Listado de bloques '
        return context


class DeployForm(View):
    template_name = 'training/forms.html'

    def get(self, request, block_id):
        deploys = Deploy.objects.filter(block_id=block_id)

        current_deploy_index = request.session.get('current_deploy_index', 0)
        current_deploy = deploys[current_deploy_index]

        #verificación si es la primera vez que el usuario ingresa al entrenamiento
        self.initialize_trainee_block(request, block_id)

        self.form = FormA(instance=current_deploy)

        return render(request, self.template_name, {'deploy': current_deploy, 'form': self.form})
    
    def post(self, request, block_id):
        deploys = Deploy.objects.filter(block_id=block_id)

        current_deploy_index = request.session.get('current_deploy_index', 0)
        current_deploy = deploys[current_deploy_index]

        form = FormA(request.POST, instance=current_deploy)

        if form.is_valid():
            deploy_answer = Ans(
                trainee_block_id = request.session.get('current_trainee_block_id'),
                question_id = current_deploy,
                user_response = form.cleaned_data['user_response']
            )
            deploy_answer.save()

            #Avanzar al siguiente deploy
            current_deploy_index += 1
            if current_deploy_index >= deploys.count():
                request.session['current_deploy_index'] = 0
                del request.session['current_trainee_block_id']

                block = Block.objects.get(pk=block_id)
                messages.success(request, f"You have completed {block.block}, now you can continue with your training")

                return redirect('home')

            #Guardamos el índice actual de la sesión
            request.session['current_deploy_index'] = current_deploy_index

            return redirect('training:form', block_id=block_id)
        
        else:
            #Si el formulario no es válido, se renderiza la plantilla con el formulario nuevamente, resaltando lo que falta para que pueda ser enviado
            return render(request, self.template_name, {'deploy': current_deploy, 'form': form})
        
    
    def initialize_trainee_block(self, request, block_id):
        #Verifica si es la primera vez que el usuario ingresa al entrenamiento
        if 'current_trainee_block_id' not in request.session:
            user = request.user
            trainee = Trainee.objects.get(user_id=user.id)

            # Se crea un nuevo objeto TraineeTraining y se guarda en la base de datos
            trainee_block = TraineeBlock.objects.create(
                trainee=trainee,
                block=get_object_or_404(Block, pk=block_id),
                pub_date=timezone.now()
            )

            # Almacena el ID del TraineeTraining en la sesión
            request.session['current_trainee_block_id'] = trainee_block.id