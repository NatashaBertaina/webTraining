from django.shortcuts import render, redirect, get_object_or_404
from django.views.generic import ListView
from django.views import View
from django.utils import timezone
from django.contrib import messages
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from .forms import FormA
from .models import Training



class IndexView(ListView):
    model = Training
    template_name = 'training/list_training.html'
    context_object_name = 'training_available'

    #Esto debe ir cambiando según nivel del usuario.
    queryset = Training.objects.all()
    #queryset = Training.objects.filter(level__contains='E')
    #queryset = Training.objects.order_by('level')

    paginate_by = 10


