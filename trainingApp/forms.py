from django import forms
from .models import Deploy_a, Deploy_b

class Form_a(forms.ModelForm):

    class Meta:
        model = Deploy_a
        fields = []

    def __init__(self, *args, **kwargs):
        super(Form_a, self).__init__(*args, **kwargs)
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


class Form_b(forms.ModelForm):

    class Meta:
        model = Deploy_b
        fields = []

    def __init__(self, *args, **kwargs):
        super(Form_b, self).__init__(*args, **kwargs)
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