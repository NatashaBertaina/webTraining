from typing import Any
from django.db import models
from userApp.models import Trainee
from django.utils import timezone
from django.contrib.auth.models import User

class List_Training(models.Model):
    difficulty = {
        'E' : 'Easy',
        'M' : 'Medium',
        'A' : 'Advanced',
    }

    training_name = models.CharField(max_length=200)
    label = models.CharField(max_length=1, choices=difficulty)

    def __str__(self):
        return self.training_name

#Bloques destro de un entrenamniento

class Block(models.Model):
    list_training = models.ForeignKey(List_Training, on_delete=models.CASCADE)
    block = models.CharField(max_length=100)
    description = models.TextField(null=True)
    order = models.IntegerField(null=True)

    def __str__(self):
        return self.block

#Tablas de despliegues

class Deploy_a(models.Model):
    block = models.ForeignKey(Block, on_delete=models.CASCADE)
    deploy_image = models.ImageField(upload_to='training/images', blank=True)
    deploy_sound = models.FileField(upload_to='training/sound', blank=True)

    ch_d1 = models.CharField(max_length=100, null=True)
    ch_d2 = models.CharField(max_length=100, null=True)
    ch_d3 = models.CharField(max_length=100, null=True)
    ch_d4 = models.CharField(max_length=100, null=True)

    def __str__(self):
        return f"Deploy: {self.id}"
    

class Deploy_b(models.Model):
    list_training = models.ForeignKey(Block, on_delete=models.CASCADE)
    deploy_image = models.ImageField(upload_to='training/images', blank=True)
    deploy_sound = models.FileField(upload_to='training/sound', blank=True)

    ch_d1 = models.CharField(max_length=100, null=True)
    ch_d2 = models.CharField(max_length=100, null=True)
    ch_d3 = models.CharField(max_length=100, null=True)

    def __str__(self):
        return f"Deploy: {self.id}"


#Tablas de Respuestas y fecha en la que se realizó:

class TraineeBlock(models.Model):
    #Foreing Key para block
    block = models.ForeignKey(Block, on_delete=models.CASCADE)
    #Foreing Key para trainee(viene de UserApp)
    trainee = models.ForeignKey(Trainee, on_delete=models.CASCADE)
    pub_date = models.DateTimeField('upload date')

    def __str__(self):
        return f"User_Training: {self.id}"

class Ans_a(models.Model):
    question = models.ForeignKey(Deploy_a, on_delete=models.CASCADE)
    user_response = models.CharField(max_length=50, null=True)

    def __str__(self):
        return self.user_response

class Ans_b(models.Model):
    question = models.ForeignKey(Deploy_b, on_delete=models.CASCADE)
    user_response = models.CharField(max_length=50, null=True)

    def __str__(self):
        return self.user_response