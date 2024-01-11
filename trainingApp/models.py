from typing import Any
from django.db import models
from userApp.models import Trainee
from django.contrib.auth.models import User

import datetime

class Training(models.Model):
    #hacer una clase esto, para evitar problemas
    difficulty = {
        'E' : 'Easy',
        'M' : 'Medium',
        'A' : 'Advanced',
    }

    training_name = models.CharField(max_length=200)
    modificationDate = models.DateTimeField(auto_now= True)
    estimateDuration = models.IntegerField(default=0)    

    def __str__(self):
        return self.training_name

#Bloques dentro de un entrenamniento:


#Tabla de despliegues:
class Deploy(models.Model):
    deploy_image = models.ImageField(upload_to='training/images', blank=True)
    deploy_sound = models.FileField(upload_to='training/sound', blank=True)
    #Respuesta correcta
    correct_answer = models.CharField(max_length=50, null=True)

    def __str__(self):
        return f"Deploy: {self.id}"
    
class Choice(models.Model):
    deploy = models.ForeignKey(Deploy, on_delete=models.CASCADE)
    choice = models.CharField(max_length=50, null=True)
    
    def __str__(self):
        return f"id: {self.id}, fk: {self.deploy}"
    

#Tabla de Respuestas y fecha en la que se realizó:
class TraineeBlock(models.Model):
    #Foreing Key para block
    #Foreing Key para trainee(viene de UserApp)
    trainee = models.ForeignKey(Trainee, on_delete=models.CASCADE)
    pub_date = models.DateTimeField('upload date')

    def __str__(self):
        return f"User_Training: {self.id}"

class Ans(models.Model):
    trainee_block = models.ForeignKey(TraineeBlock, on_delete=models.CASCADE)
    question = models.ForeignKey(Deploy, on_delete=models.CASCADE)
    #Respuesta del usuario al deploy mostrado
    user_response = models.CharField(max_length=50, null=True)

    def __str__(self):
        return self.user_response