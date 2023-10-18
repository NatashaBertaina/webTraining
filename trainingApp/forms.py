from django import forms
from .models import Question, Deploy

#class DeployForm(forms.ModelForm):

    #class Meta:
        #model = Deploy
        #fields = ['deploy_image', 'deploy_sound']

class QuestionForm(forms.ModelForm):

    class Meta:
        model = Question
        fields = ['choice_text', 'is_correct']