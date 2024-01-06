
from django import forms
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm, PasswordChangeForm, UserChangeForm
from django.contrib.auth.models import User
from .models import Trainee

class SignupForm(UserCreationForm):
    age = forms.IntegerField(initial=18)
    educationalLevel = forms.ChoiceField(choices=Trainee.EducationalLevel.choices,
                                         initial=Trainee.EducationalLevel.High_School,
                                         widget=forms.RadioSelect(),)
    occupation = forms.CharField(max_length=50)

    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'email', 'password1', 'password2', 'age', 'educationalLevel', 'occupation']
        
class UserUpdateForm(forms.ModelForm):

    class Meta:
        model = User
        fields = ['username','first_name', 'last_name', 'email']     
    
    def __init__(self, *args, **kwargs):
        super(UserUpdateForm, self).__init__(*args, **kwargs)
        if self.instance:
            self.fields['first_name'].initial = self.instance.first_name
            self.fields['last_name'].initial = self.instance.last_name
            self.fields['email'].initial = self.instance.email   

class TraineeUpdateForm(forms.ModelForm):
    class Meta:
        model = Trainee
        fields = ['age', 'educationalLevel', 'occupation']
    
    def __init__(self, *args, **kwargs):
        super(TraineeUpdateForm, self).__init__(*args, **kwargs)
        if self.instance:
            self.fields['age'].initial = self.instance.age
            self.fields['educationalLevel'].initial = self.instance.educationalLevel
            self.fields['occupation'].initial = self.instance.occupation
            