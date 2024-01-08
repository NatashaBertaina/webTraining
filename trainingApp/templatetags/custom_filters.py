# trainingApp/templatetags/custom_filters.py
from django import template

register = template.Library()

#Metodo para obtener la clave de un diccionario
@register.filter
def get_value(dictionary, key):
    return dictionary.get(key, 0)
