from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Trainee(models.Model):
    #Enumeracion para el nivel educativo del user
    class EducationalLevel(models.TextChoices):
        Primary_School = 'Primaria'
        High_School = 'Secundaria'
        Collage = 'Universidad'
        Graduate = 'Postgrado'  
  
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    age =  models.IntegerField(default=18)
    educationalLevel = models.CharField(
        max_length=20,
        choices=EducationalLevel.choices,
        default=EducationalLevel.High_School
    )
    occupation = models.CharField(max_length=50)