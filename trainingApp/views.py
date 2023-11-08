import random

from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse, HttpResponseRedirect
from django.views import generic, View
from django.views.generic.edit import FormView
from random import shuffle, choice
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

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
        request.session['rnd_deploy'] = list(Deploy.objects.values_list('pk', flat=True))
        #Guardo el índice de la lista
        request.session['index'] = request.session.get('index', 0)


        return render(request, self.template_name, {'deploy': deploy, 'form': form})
    
    def post(self, request, deploy_id): 
        deploy = get_object_or_404(Deploy, pk=deploy_id)
        form = QuestionForm(request.POST, instance=deploy)
        if form.is_valid():
            form.save()
            return redirect('next_deploy_view')
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
    rnd_deploy = request.session.get('rnd_deploy')
    index = request.session.get('index', 0)

    if rnd_deploy and index < len(rnd_deploy) - 1:
        request.session['index'] += 1
        next_deploy_id = rnd_deploy[request.session['index']]
        return redirect('forms', deploy_id=next_deploy_id)
    else: 
        return redirect('results')

def prev_deploy(request):
    index = request.session.get('index', 0)
    rnd_deploy = request.session.get('rnd_deploy')
    
    if rnd_deploy and index > 0:
        request.session['index'] -= 1
        prev_deploy_id = rnd_deploy[request.session['index']]
        return redirect('forms', deploy_id=prev_deploy_id)
    else:
        return redirect('forms', deploy_id=request.session['rnd_deploy'][index])



def results(request):
    rnd_deploy = request.session.get('rnd_deploy')
    if rnd_deploy:
        paginator = Paginator(rnd_deploy, 1)
        page = request.GET.get('page')
        try:
            deploy_list = paginator.page(page)
        except PageNotAnInteger:
            deploy_list = paginator.page(1)
        except EmptyPage:
            deploy_list = paginator.page(paginator.num_pages)

        return render(request, 'result.html', {'deploy_list':deploy_list})
    
    else:
        return render


class ResultsView(generic.DetailView):
    model = Training
    template_name = "trainingApp/results.html"

