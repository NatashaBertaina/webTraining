from django.shortcuts import render, redirect

from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth import login, logout, authenticate
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.db import transaction

from .forms import SignupForm
from .models import Trainee

#Lógica de users

def home(request):
    return render(request, 'home.html')


@transaction.atomic
def signup(request):
    if request.method == 'GET':
        form = SignupForm()
        return render(request, 'userApp/signup.html', {"form": form})
    else:
        form = SignupForm(request.POST)
        if form.is_valid():
            user = form.save()

            #Creamos un objeto Trainee, relacionandolo con el usuario
            Trainee.objects.create(
                user = user,
                age = form.cleaned_data['age'],
                educationalLevel = form.cleaned_data['educationalLevel'],
                occupation = form.cleaned_data['occupation']
            )
            messages.success(request, "Your account is create successfully")
            login(request, user)

            return redirect('training:list_training')
        else:
            messages.error(request, "Error")
            return render(request, 'userApp/signup.html', {"form": form})

@login_required
def signout(request):
    logout(request)
    return redirect('home')

def signin(request):
    if request.method == 'GET':
        return render (request, 'userApp/signin.html', {"form": AuthenticationForm})
    else:
        user = authenticate(request, username=request.POST['username'], password=request.POST['password'])
        if user is None:
            messages.error(request, "Username or Password incorrect")
            return render(request, 'userApp/signin.html', {"form": AuthenticationForm})
        else:
            login(request, user)
            messages.success(request, f"Your are logged in as {request.POST['username']}")
            return redirect('training:list_training')