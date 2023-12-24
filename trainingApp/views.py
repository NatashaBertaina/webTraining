import random

from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse, HttpResponseRedirect
from django.views import generic, View
from django.views.generic.edit import FormView
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from .forms import Form_a, Form_b
from .models import Training, Deploy_a, Deploy_b, Ans_a, Ans_b

cont = 0

class IndexView(generic.ListView):
    template_name = "trainingApp/index.html"
    context_object_name = "list_training"

#Agregar vista de los distintos bloques existentes por entrenamiento.
    
#class BlockView(generic.ListView):

class DeployDetailView(View):
    template_name = 'trainingApp/forms.html'


    def get(self, request, deploy_id):
        deploy = get_object_or_404(Deploy_a, pk=deploy_id)

        self.form = Form_a(instance=deploy)

        return render(request, self.template_name, {'deploy': deploy, 'form':self.form})
    
    def post(self, request, deploy_id): 
        deploy = get_object_or_404(Deploy_a, pk=deploy_id)
        self.form = Form_a(request.POST, instance=deploy)

        if self.form.is_valid():
            self.form.save()

            form_data = self.form.cleaned_data
            resp = form_data.get('user_response')
            obj = Ans_a.objects.create(user_response=resp)
            
            #Cambiar la forma de paginación. Próximo a implementar

            return redirect('next_deploy_view')
            

        else:
            #Con lo siguiente, si el formulario no es válido, renderizaré la plantilla con el formulario una vez más, resaltando lo que falta para poder enviarlo.
            return render(request, self.template_name, {'deploy':deploy, 'form':self.form})

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

    def get(self, request):
        return render(request, self.template_name)
