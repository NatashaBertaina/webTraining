from django.shortcuts import render, redirect
from django.views import View
from django.contrib.auth.forms import AuthenticationForm
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
from trainingApp.models import Group
from django.core.mail import send_mail
from django.contrib.sites.shortcuts import get_current_site
from django.template.loader import render_to_string
from django.utils.http import urlsafe_base64_encode
from django.utils.encoding import force_bytes, force_str
from django.contrib.auth.tokens import default_token_generator
from django.utils.http import urlsafe_base64_decode
from dotenv import load_dotenv
import os
# Cargar las variables de entorno desde el archivo .env
load_dotenv()

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
            user = form.save(commit=False)
            user.is_active = False  # Desactiva la cuenta hasta que se confirme el email
            # Crear el objeto Trainee y se relaciona con el usuario y al grupo por defecto
            group_defect, created = Group.objects.get_or_create(name_group='Group Defect')
            trainee = Trainee(
                    user=user,
                    age=form.cleaned_data['age'],
                    educationalLevel=form.cleaned_data['educationalLevel'],
                    occupation=form.cleaned_data['occupation'],
                    group=group_defect
                )
            user.save()
            trainee.save()
            # Enviar email de confirmación
            try:
                current_site = get_current_site(request)
                mail_subject = 'Activate your account.'
                mail_transmitter = os.getenv('EMAIL_HOST_USER')
                message = render_to_string('userApp/acc_active_email.html', {
                    'user': user,
                    'domain': current_site.domain,
                    'uid': urlsafe_base64_encode(force_bytes(user.pk)),  # uid se utiliza para identificar de manera única al usuario en el enlace de activación sin exponer directamente el ID del usuario en la URL.
                    'token': default_token_generator.make_token(user),  # Crea un token único basado en el usuario y otros factores
                })
                send_mail(mail_subject, message, mail_transmitter, [user.email]) 
            except Exception as e:
                messages.error(request, "There was an error sending the confirmation email. Please try again later.")
                return redirect('home')
            
            messages.success(request, "Please confirm your email address to complete the registration")
            return redirect('home')
        
        else:
            messages.error(request, "Error")
            return render(request, 'userApp/signup.html', {"form": form})
import traceback        
def activate(request, uidb64, token):
    try:
        #Decodifico la uid y verifico que el usuario exista
        uid = force_str(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except(TypeError, ValueError, OverflowError, User.DoesNotExist):
        print(traceback.format_exc())
        user = None
    if user is not None and default_token_generator.check_token(user, token):
        user.is_active = True
        user.save()
        login(request, user)
        messages.success(request, "Your account has been activated successfully.")
        return redirect('home')
    else:
        messages.error(request, "Error en la activacion de la cuenta")
        return redirect('home')
        
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
    success_url = reverse_lazy('userApp:passwordResetDone')  #la URL a la que se redirigirá al usuario después de cambiar exitosamente la contrasena.
    
#Vista una vez modificada la password exisitamente
class MyPasswordResetDoneView(PasswordResetDoneView):
    template_name= "userApp/passwordResetDone.html"
