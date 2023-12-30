from django import forms
from .models import DeployAnswer,Choice

class QuestionForm(forms.ModelForm):

    class Meta:
        model = DeployAnswer
        fields = ['user_response']
        
    def __init__(self, *args, **kwargs):
        super(QuestionForm, self).__init__(*args, **kwargs)

        # Obtener las opciones del deploy
        choices = Choice.objects.filter(deploy_id=self.instance.id)

        # Configuración del campo user_response con las distintas opciones
        options = [(choice.choice, choice.choice) for choice in choices]

        self.fields['user_response'] = forms.ChoiceField(
            choices=options,
            widget=forms.RadioSelect(),
        )