import random

from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse, HttpResponseRedirect
from django.views import generic, View
from django.views.generic.edit import FormView
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from .forms import QuestionForm
from .models import Training, Deploy

from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required

cont = 0

class IndexView(generic.ListView):
    template_name = "trainingApp/index.html"
    context_object_name = "list_training"

    def get_queryset(self):
        return Training.objects.order_by("pub_date")[:5]


class DeployDetailView(View):
    template_name = 'trainingApp/forms.html'


    def get(self, request, deploy_id):
        deploy = get_object_or_404(Deploy, pk=deploy_id)

        self.form = QuestionForm(instance=deploy)
        
        #crear una lista random con los despliegues
        request.session['rnd_deploy'] = list(Deploy.objects.values_list('pk', flat=True))
        #Guardo el índice de la lista
        #request.session['index'] = request.session.get('index', 0)
        request.session['index'] = 0

        return render(request, self.template_name, {'deploy': deploy, 'form':self.form})
    
    def post(self, request, deploy_id): 
        deploy = get_object_or_404(Deploy, pk=deploy_id)
        self.form = QuestionForm(request.POST, instance=deploy)
        if self.form.is_valid():
            self.form.save()
            return redirect('next_deploy_view')
            

        else:
            #Con lo siguiente, si el formulario no es válido, renderizaré la plantilla con el formulario una vez más, resaltando lo que falta para poder enviarlo.
            return render(request, self.template_name, {'deploy':deploy, 'form':self.form})
        
@login_required
def next_deploy(request):
    global cont
    rnd_deploy = request.session.get('rnd_deploy')
        #index = request.session.get('index', 0)
    print(rnd_deploy)
    print(cont)

    if cont < (len(rnd_deploy) - 1):
        cont += 1
        print(cont)
        return redirect('trainingApp:forms', deploy_id=request.session['rnd_deploy'][cont])
    else:
        return redirect('trainingApp:results')

@login_required
def prev_deploy(request):
    index = request.session.get('index', 0)
    rnd_deploy = request.session.get('rnd_deploy')
    
    if rnd_deploy and index > 0:
        request.session['index'] -= 1
        prev_deploy_id = rnd_deploy[request.session['index']]
        return redirect('trainingApp:forms', deploy_id=prev_deploy_id)
    else:
        return redirect('trainingApp:forms', deploy_id=request.session['rnd_deploy'][index])


class ResultsView(generic.ListView):
    template_name = "trainingApp/results.html"

