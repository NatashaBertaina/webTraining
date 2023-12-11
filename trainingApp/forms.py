from django import forms
from .models import DeployAnswer

class QuestionForm(forms.ModelForm):

    class Meta:
        model = DeployAnswer
        fields = ['user_response']

    def __init__(self, *args, **kwargs):
        super(QuestionForm, self).__init__(*args, **kwargs)
        #Con esto obtengo las opciones de la base de datos
        options = [
            ('ch_d1', self.instance.ch_d1),
            ('ch_d2', self.instance.ch_d2),
            ('ch_d3', self.instance.ch_d3),
            ('ch_d4', self.instance.ch_d4),
        ]
        #Configuración del campo user_response con las distintas opciones
        self.fields['user_response'] = forms.ChoiceField(
            choices=options,
            widget=forms.RadioSelect(),
        )