
import random
from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseRedirect
from django.views import generic, View
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth import login, logout, authenticate
from django.contrib.auth.models import User
from django.db import IntegrityError
from django.contrib.auth.decorators import login_required

##Logica de users

def home(request):
    return render(request, 'userApp/home.html')

def signup(request):
    if request.method == 'GET':
        return render(request, 'userApp/signup.html', {"form": UserCreationForm})
    else:

        if request.POST["password1"] == request.POST["password2"]:
            try:
                user = User.objects.create_user(
                    request.POST["username"], password=request.POST["password1"])
                user.save()
                login(request, user)
                return redirect('trainingApp:training')
            except IntegrityError:
                return render(request, 'userApp/signup.html', {"form": UserCreationForm, "error": "Username already exists."})
        else:
            return render(request, 'userApp/signup.html', {"form": UserCreationForm, "error": "Passwords did not match."})
        
@login_required
def signout(request):
    logout(request)
    return redirect('home')


def signin(request):
    if request.method == 'GET':
        return render(request, 'userApp/signin.html', {"form": AuthenticationForm})
    else:
        user = authenticate(
            request, username=request.POST['username'], password=request.POST['password'])
        if user is None:
            return render(request, 'userApp/signin.html', {"form": AuthenticationForm, "error": "Username or password is incorrect."})

        login(request, user)
        return redirect('trainingApp:training')
