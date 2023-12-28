from django import forms
from .models import Deploy_a, Deploy_b


#primer tipo de formulario
class FormA(forms.ModelForm):

    class Meta:
        model = Deploy_a
        fields = []

    def __init__(self, *args, **kwargs):
        super(FormA, self).__init__(*args, **kwargs)
        #Para obtener las opciones de la base de datos
        options = [
            ('ch_d1', self.instance.ch_d1),
            ('ch_d2', self.instance.ch_d2),
            ('ch_d3', self.instance.ch_d3),
            ('ch_d4', self.instance.ch_d4),
        ]
        self.fields['user_response'] = forms.ChoiceField(
            choices=options,
            widget=forms.RadioSelect(),
        )


#Segundo tipo de formulario
class FormB(forms.ModelForm):

    class Meta:
        model = Deploy_b
        fields = []

    def __init__(self, *args, **kwargs):
        super(FormA, self).__init__(*args, **kwargs)
        #Para obtener las opciones de la base de datos
        options = [
            ('ch_d1', self.instance.ch_d1),
            ('ch_d2', self.instance.ch_d2),
            ('ch_d3', self.instance.ch_d3),
        ]
        self.fields['user_response'] = forms.ChoiceField(
            choices=options,
            widget=forms.RadioSelect(),
        )