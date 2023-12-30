import datetime

from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from userApp.models import Trainee


class Training(models.Model):
    #Enumeracion para el tipo de entrenamiento
    class TrainingType(models.TextChoices):
        Easy = 'Easy'
        Intemediate = 'Intemediate'
        Advanced = 'Advanced'
    
    name_training = models.CharField(max_length=200)
    pub_date = models.DateTimeField("upload date")
    modificationDate = models.DateTimeField(auto_now= True)
    difficulty = models.CharField(
        max_length=20,
        choices=TrainingType.choices,
        default=TrainingType.Easy
    )
    estimatedDuration = models.IntegerField(default=0)

    def was_published_recently(self):
        return self.pub_date >=timezone.now() - datetime.timedelta(days=1)
    def __str__(self):
        return self.name_training

class DeployType(models.Model):
    name_type = models.CharField(max_length=100)
    description = models.CharField(max_length=500)
    
    def __str__(self):
        return f"{self.name_type}"
    
class Deploy(models.Model):
    training = models.ForeignKey(Training, on_delete=models.CASCADE)
    deploy_type = models.ForeignKey(DeployType, on_delete=models.CASCADE, null=True)
    question = models.CharField(max_length=50, null=True)
    deploy_image = models.ImageField(upload_to="trainingApp/images", blank=True)
    deploy_sound = models.FileField(upload_to="trainingApp/sound", blank=True)
     #Respuesta correcta
    correct_answer = models.CharField(max_length=50, null=True)

    def __str__(self):
        return f"Deploy: {self.id}"

class Choice(models.Model):
    deploy = models.ForeignKey(Deploy, on_delete=models.CASCADE)
    choice = models.CharField(max_length=50, null=True)
    def __str__(self):
        return f"id: {self.id}, fk: {self.deploy}"
    
class TraineeTraining(models.Model):
    #foreing Key de training
    training = models.ForeignKey(Training, on_delete=models.CASCADE)
    #foreing Key de trainee
    trainee = models.ForeignKey(Trainee, on_delete=models.CASCADE)
    pub_date = models.DateTimeField("upload date")
    
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
    