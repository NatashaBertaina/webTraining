from django.shortcuts import render, redirect
from django.views import View
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth import login, logout, authenticate
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.views import PasswordChangeView, PasswordResetDoneView

from django.db import transaction
from django.urls import reverse_lazy

from .forms import SignupForm, UserUpdateForm, TraineeUpdateForm
from .models import Trainee


def home(request):
    return render(request, 'trainingApp/home.html')


#Lógica de registro

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

            return redirect('trainingApp:home')
        
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
            return redirect('home')


#Vista para modificar datos
class ProfileView(LoginRequiredMixin, View):
    #Con esto se especifica a donde se redigirá el usuario no autenticado
    login_url = 'signup'
    template_name = 'userApp/profile.html'

    def get(self, request, username):
        user = User.objects.get(username=username)
        trainee = Trainee.objects.get(user_id=user.id)

        userForm = UserUpdateForm(instance=user)
        traineeForm = TraineeUpdateForm(instance=trainee)

        return render(request, self.template_name, {"userForm": userForm, "traineeForm": traineeForm})
    
    def post(self, request, username):
        user = User.objects.get(username=username)
        trainee = Trainee.objects.get(user_id=user.id)

        userForm = UserUpdateForm(request.POST, instance=user)
        traineeForm = TraineeUpdateForm(request.POST, instance=trainee)

        if userForm.is_valid() and traineeForm.is_valid():
            userForm.save()
            traineeForm.save()
            messages.success(request, "Your profile has been updated")
            return redirect('userApp:profile', user.username)
        
        else:
            messages.error(request, "error")
            return redirect('userApp:profile', user.username)


#Vista de recuperación de password
class MyPasswordChangeView(PasswordChangeView):
    template_name = "userApp/passwordChange.html"
    success_url = reverse_lazy('userApp:passwordResetDone')

class MyPasswordResetDoneView(PasswordResetDoneView):
    template_name = "userApp/passwordResetDone.html"