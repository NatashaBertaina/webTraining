
import random
from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseRedirect
from django.views import generic, View
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth import login, logout, authenticate
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from .forms import SignupForm
from django.contrib import messages
from .models import Trainee

##Logica de users

def home(request):
    return render(request, 'userApp/home.html')

def signup(request):
    if request.method == 'GET':
        form = SignupForm()
        return render(request, 'userApp/signup.html', {"form": form})
    else:
        form = SignupForm(request.POST)
        if form.is_valid():
            user = form.save()
            # Crear el objeto Trainee y se relaciona con el usuario
            Trainee.objects.create(
                user=user,
                age=form.cleaned_data['age'],
                educationalLevel=form.cleaned_data['educationalLevel'],
                occupation=form.cleaned_data['occupation']
            )
            messages.success(request,"Your account is crated successfully")
            login(request, user)
            
            return redirect('trainingApp:training')
        else:
            messages.error(request, "Error")
            return render(request, 'userApp/signup.html', {"form": form})
        
@login_required
def signout(request):
    logout(request)
    return redirect('home')


def signin(request):
    if request.method == 'GET':
        return render(request, 'userApp/signin.html', {"form": AuthenticationForm})
    else:
        user = authenticate(request, username=request.POST['username'], password=request.POST['password'])
        if user is None:
            messages.error(request, "Username or Password incorrect")
            return render(request, 'userApp/signin.html', {"form": AuthenticationForm})
        else:
            login(request, user)
            messages.success(request,f"Your are logged in as {request.POST['username']}")
            return redirect('trainingApp:training')
