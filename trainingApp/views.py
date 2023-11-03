import random

from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse, HttpResponseRedirect
from django.views import generic, View
from django.views.generic.edit import FormView
from random import shuffle, choice

from .forms import QuestionForm
from .models import Training, Deploy


class IndexView(generic.ListView):
    template_name = "trainingApp/index.html"
    context_object_name = "list_training"

    def get_queryset(self):
        return Training.objects.order_by("pub_date")[:5]


class DeployDetailView(View):
    template_name = 'trainingApp/forms.html'

    def get(self, request, deploy_id):
        deploy = get_object_or_404(Deploy, pk=deploy_id)

        form = QuestionForm(instance=deploy)

        #crear una lista random con los despliegues
        rnd_deploy = list(Deploy.objects.values_list('pk', flat=True))
        request.session['rnd_deploy'] = random.shuffle(rnd_deploy)
        #Guardo el índice de la lista
        request.session['index'] = 0


        return render(request, self.template_name, {'deploy': deploy, 'form': form})
    
    def post(self, request, deploy_id): 
        deploy = get_object_or_404(Deploy, pk=deploy_id)
        form = QuestionForm(request.POST, instance=deploy)
        if form.is_valid():
            form.save()

            #Redirijimos al usuario al siguiente depliegue
            #next_deploy = self.get_next_deploy(deploy)
            #if next_deploy:
                #return redirect('forms', deploy_id=next_deploy.id)
            #else:
                #return redirect('results')

        else:
            #Con lo siguiente, si el formulario no es válido, renderizaré la plantilla con el formulario una vez más, resaltando lo que falta para poder enviarlo.
            return render(request, self.template_name, {'deploy':deploy, 'form':form})

    def next_deploy(request):
        if 'rnd_deploy' in request.session and 'index' in request.session:
            deploy_new = request.session['rnd_deploy']
            index = request.session['index']

            if index < len(deploy_new) - 1:
                request.session['index'] += 1
            
        return render(request, 'forms.html')
    
    def prev_deploy(request):
        if 'rnd_deploy' in request.session and 'index' in request.session:
            index = request.session['index']

            if index > 0:
                request.session['index'] -= 1
        
        return render(request, 'forms.html')


class ResultsView(generic.DetailView):
    model = Training
    template_name = "trainingApp/results.html"


