from django.shortcuts import render, get_object_or_404, render
from django.http import HttpResponse, HttpResponseRedirect
from django.urls import reverse
from django.views import generic
from django.views.generic.edit import FormView
from random import shuffle, choice

from .forms import QuestionForm
from .models import Training, Deploy


class IndexView(generic.ListView):
    template_name = "trainingApp/index.html"
    context_object_name = "list_training"

    def get_queryset(self):
        return Training.objects.order_by("pub_date")[:5]


class QuestionFormView(FormView):
    form_class = QuestionForm
    template_name = 'trainingApp/form.html'

    def get_form(self):
        deploy =Deploy.objects.filter(deploy_image__isnull=False, deploy_sound__isnull=False).order_by('?').first()
        if deploy:
            return self.form_class(instance=deploy)
        return None
    
    def form_valid(self, form):
        deploy = form.instance
        options = ['ch_d1', 'ch_d2', 'ch_d3', 'ch_d4']
        selected_option = choice(options)
        deploy.user_response = selected_option
        deploy.save()

        return HttpResponseRedirect('trainingApp/results.html')


class ResultsView(generic.DetailView):
    model = Training
    template_name = "trainingApp/results.html"


def answer(request, training_id):
    training = get_object_or_404(Training, pk=training_id)
    try:
        selected_choice = training.question_set.get(pk=request.POST["choice"])
    except (KeyError, Deploy.DoesNotExist):
        return render(
            request,
            "trainingApp/form.html",
            {
                "training": training,
                "error_message": "You didn't select a choice.",
            },
        )
    else:
        selected_choice.count_choice += 1 
        selected_choice.save()
        return HttpResponseRedirect(reverse("trainingApp:results", args=(training.id,)))