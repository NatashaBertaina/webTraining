
from django import forms
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm, PasswordChangeForm, UserChangeForm
from django.contrib.auth.models import User
from .models import Trainee

class SignupForm(UserCreationForm):
    age = forms.IntegerField(initial=18)
    educationalLevel = forms.ChoiceField(choices=Trainee.EducationalLevel.choices, initial=Trainee.EducationalLevel.High_School)
    occupation = forms.CharField(max_length=50)

    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'email', 'password1', 'password2', 'age', 'educationalLevel', 'occupation']
