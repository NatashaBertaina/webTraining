from django.shortcuts import render, redirect
from django.views import generic, View
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth import login, logout, authenticate
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from .forms import SignupForm,UserUpdateForm,TraineeUpdateForm
from django.contrib import messages
from .models import Trainee
from django.db import transaction
from django.contrib.auth.mixins import LoginRequiredMixin  #LoginRequiredMixin se utiliza como un mixin para requerir que un usuario esté autenticado antes de acceder a una vista específica.
from django.contrib.auth.views import PasswordChangeView, PasswordResetDoneView
from django.urls import reverse_lazy
from django.contrib.auth.forms import PasswordChangeForm

##Logica de users 

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
            # Crear el objeto Trainee y se relaciona con el usuario
            Trainee.objects.create(
                user=user,
                age=form.cleaned_data['age'],
                educationalLevel=form.cleaned_data['educationalLevel'],
                occupation=form.cleaned_data['occupation']
            )
            messages.success(request,"Your account is crated successfully")
            login(request, user)
            
            return redirect('trainingApp:training_List')
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
            return redirect('trainingApp:training_List')

#Vista para modificar datos del user y trainee
class ProfileView(LoginRequiredMixin, View):
    login_url = 'signup' # Esta propiedad especifica la URL a la cual se redirigirá a los usuarios no autenticados cuando intenten acceder a la vista protegida por este mixin.
    template_name = "userApp/profile.html"

    def get(self, request, username):
        user = User.objects.get(username= username)
        trainee = Trainee.objects.get(user_id=user.id)
        
        # Crea una instancia del formulario combinado y pasa el objeto user y Trainee como instancia
        userform = UserUpdateForm(instance=user)
        traineeform = TraineeUpdateForm(instance=trainee)

        return render(request, self.template_name, {"userform": userform, "traineeform": traineeform})

    def post(self, request, username):
        user = User.objects.get(username= username)
        trainee = Trainee.objects.get(user_id=user.id)

        # Crea una instancia del formulario combinado y pasa el objeto Trainee como instancia
        userform = UserUpdateForm(request.POST, instance=user)
        traineeform = TraineeUpdateForm(request.POST,instance=trainee)
        
        if userform.is_valid() and traineeform.is_valid():
            userform.save()
            traineeform.save()
            messages.success(request,"Your profile has been updated")
            return redirect('userApp:profile', user.username)  # Redirige a la página de perfil después de guardar los cambios

        else:
            messages.error(request," error")
            return redirect('userApp:profile', user.username) 

#Vista para modificar password
class MyPasswordChangeView(PasswordChangeView):
    template_name= "userApp/passwordChange.html"
    success_url = reverse_lazy('userApp:passwordResetDone')  #la URL a la que se redirigirá al usuario después de cambiar exitosamente la contraseña.
    
#Vista una vez modificada la password exisitamente
class MyPasswordResetDoneView(PasswordResetDoneView):
    template_name= "userApp/passwordResetDone.html"
