from django import forms
from .models import Ans, Choice


#primer tipo de formulario
class FormA(forms.ModelForm):

    class Meta:
        model = Ans
        fields = ['user_response']

    def __init__(self, *args, **kwargs):
        super(FormA, self).__init__(*args, **kwargs)
        #Para obtener las opciones de la base de datos
        choices = Choice.objects.filter(deploy_id=self.instance.id)
        options = [(choice.choice, choice.choice) for choice in choices]

        self.fields['user_response'] = forms.ChoiceField(
            choices=options,
            widget=forms.RadioSelect(),
        )
