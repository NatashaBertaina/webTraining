from django.db import models
from django.contrib.auth.models import User
#from trainingApp.models import Group  # Importa Group desde trainingApp

class Trainee(models.Model):
    #Enumeracion para el nivel educativo del user
    class EducationalLevel(models.TextChoices):
        Primary_School = 'Primary'
        High_School = 'High School'
        Collage = 'Collage'
        Doctoral = 'Doctoral Student'
        Graduate = 'Ph.D'  

    user = models.OneToOneField(User, on_delete=models.CASCADE)
    age =  models.IntegerField(default=18)
    educationalLevel = models.CharField(
        max_length=20,
        choices=EducationalLevel.choices,
        default=EducationalLevel.High_School
    )
    occupation = models.CharField(max_length=50)
    group = models.OneToOneField('trainingApp.Group', on_delete=models.SET_NULL, null=True, blank=True)

    def __str__(self):
        return f"Trainee_Id: {self.id}, Name Trainee: {self.user.first_name} {self.user.last_name}"
