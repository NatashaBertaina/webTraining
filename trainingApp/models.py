import datetime

from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User


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

class Training(models.Model):
    #Enumeracion para el tipo de entrenamiento
    class TrainingType(models.TextChoices):
        Basic = 'Basico'
        Intemediate = 'Intermedio'
        Advanced = 'Avanzado'
    
    name_training = models.CharField(max_length=200)
    pub_date = models.DateTimeField("upload date")
    modificationDate = models.DateTimeField(auto_now= True)
    Type = models.CharField(
        max_length=20,
        choices=TrainingType.choices,
        default=TrainingType.Basic
    )
    estimatedDuration = models.IntegerField(default=0)

    def was_published_recently(self):
        return self.pub_date >=timezone.now() - datetime.timedelta(days=1)
    def __str__(self):
        return self.name_training


class Deploy(models.Model):
    training = models.ForeignKey(Training, on_delete=models.CASCADE)
    question = models.CharField(max_length=50, null=True)
    deploy_image = models.ImageField(upload_to="trainingApp/images", blank=True)
    deploy_sound = models.FileField(upload_to="trainingApp/sound", blank=True)
    ch_d1 = models.CharField(max_length=50, null=True)
    ch_d2 = models.CharField(max_length=50, null=True)
    ch_d3 = models.CharField(max_length=50, null=True)
    ch_d4 = models.CharField(max_length=50, null=True)

     #Respuesta correcta
    user_response = models.CharField(max_length=50, null=True)

    def __str__(self):
        return f"Deploy: {self.id}"
  
"""""
class TraineeTraining(models.Model):
    #foreing Key de training
    training = models.ForeignKey(Training, on_delete=models.CASCADE)
    #foreing Key de trainee
    trainee = models.ForeignKey(Trainee, on_delete=models.CASCADE)
    
    def __str__(self):
        return f"User_Training: {self.id}"
    

#Clase para guardar la respuesta del usuario de cada deploy
class DeployAnswer(models.Model):
    #foreing Key de trainee_Training
    trainee_Training = models.ForeignKey(TraineeTraining, on_delete=models.CASCADE)
    #foreing Key de deploy
    deploy = models.ForeignKey(Deploy, on_delete=models.CASCADE)

    #Respuesta a deploy
    user_response = models.CharField(max_length=50, null=True)

    def __str__(self):
        return f"deploy_Answer: {self.id}"
"""