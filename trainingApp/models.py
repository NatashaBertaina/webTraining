import datetime
from django.db import models
from userApp.models import Trainee
from django.contrib.auth.models import User
from django.utils import timezone
from django.utils.translation import gettext as _


class Training(models.Model):
    
    class TrainingType(models.TextChoices):
        Easy = _('Easy')
        Intermediate = _('Intermediate')
        Advance = _('Advance')
    
    #Ayuda en la habilitacion de entrenamientos 
    class StateTraining(models.TextChoices):
        Active = _('Active')
        Inactive = _('Inactive')
        in_Progress = _('in_Progress')

    name_training = models.CharField(max_length=200)
    pub_date = models.DateTimeField("upload date", auto_now_add=True)
    modificationDate = models.DateTimeField(auto_now=True)
    difficulty = models.CharField(
        max_length=20,
        choices=TrainingType.choices,
        default=TrainingType.Easy
    )
    estimatedDuration = models.IntegerField(default=0)
    state_training = models.CharField(
        max_length=20,
        choices=StateTraining.choices,
        default=StateTraining.in_Progress
    )

    def get_num_trainee_trainings(self, trainee_id):
        return TraineeTraining.objects.filter(training=self, trainee_id=trainee_id).count()
    
    def __str__(self):
        return self.name_training


#Lógica de Bloques en un entrenamiento:
class DeployType(models.Model):
    name_type = models.CharField(max_length=200)
    description = models.CharField(max_length=500)


#Tabla de despliegues:
class Deploy(models.Model):
    training = models.ForeignKey(Training, on_delete=models.CASCADE, default=1)
    deploy_type = models.ForeignKey(DeployType, on_delete=models.CASCADE, null=True)
    deploy_image = models.ImageField(upload_to='uploads/images', blank=True)
    deploy_sound = models.FileField(upload_to='uploads/sound', blank=True)

    #Respuesta correcta
    correct_answer = models.CharField(max_length=50, null=True)

    def __str__(self):
        return f"Deploy: {self.id}"

#Con esto podemos tener mas de 2 opciones (todo dependerá del entrenamiento)
class Choice(models.Model):
    deploy = models.ForeignKey(Deploy, on_delete=models.CASCADE)
    choice = models.CharField(max_length=50, null=True)
    
    def __str__(self):
        return f"id: {self.id}, fk: {self.deploy}"
    

#Tabla de Respuestas y fecha en la que se realizó:
class TraineeTraining(models.Model):
    #Foreign Key para training
    training = models.ForeignKey(Training, on_delete=models.CASCADE)
    #Foreign Key para trainee(viene de UserApp)
    trainee = models.ForeignKey(Trainee, on_delete=models.CASCADE)
    pub_date = models.DateTimeField("upload date")
    state = models.CharField(max_length=100, default='in_Progress')
    time_spent = models.DurationField(null=True, blank=True)

    def __str__(self):
        return f"User_Training: {self.id}"

class Ans(models.Model):
    trainee_Training = models.ForeignKey(TraineeTraining, on_delete=models.CASCADE, default=1)
    deploy = models.ForeignKey(Deploy, on_delete=models.CASCADE, default=1)
    user_response = models.CharField(max_length=50, null=True)

    def __str__(self):
        return f"UserAnswer: {self.id}"
