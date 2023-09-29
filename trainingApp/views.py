from typing import Any
from django.db.models.query import QuerySet
from django.shortcuts import render, get_object_or_404, render
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.views import generic
from django.views.generic.edit import FormView


from .models import Training, Deploy, Question


class IndexView(generic.ListView):
    template_name = "trainingApp/index.html"
    context_object_name = "list_training"

    def get_queryset(self):
        return Training.objects.order_by("pub_date")[:5]


class FormView(FormView):
    #model = Training
    template_name = "trainingApp/form.html"


class ResultsView(generic.DetailView):
    model = Training
    template_name = "trainingApp/results.html"


def answer(request, training_id):
    training = get_object_or_404(Training, pk=training_id)
    try:
        selected_choice = training.question_set.get(pk=request.POST["choice"])
    except (KeyError, Question.DoesNotExist):
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