from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse


from .models import Training


def index(request):
    list_training = Training.objects.order_by("-pub_date")[:5]
    context = {
        "list_training":list_training,
    }
    return render(request, "trainingApp/index.html", context)

def form(request, training_id):
    training = get_object_or_404(Training, pk=training_id)
    return render(request, "trainingApp/form.html", {"training":training})

def results(request, training_id):
    response = "Your result for the training %s."
    return HttpResponse(response % training_id)