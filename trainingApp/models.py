import datetime

from django.db import models
from django.utils import timezone
from django.contrib import admin

class Training(models.Model):
    difficulty = {
        'B' : 'Beginner',
        'M' : 'Medium',
        'A' : 'Advanced',
    }

    name_training = models.CharField(max_length=200)
    label = models.CharField(max_length=1, choices=difficulty)

    def __str__(self):
        return self.name_training


class Block(models.Model):
    Training = models.ForeignKey(Training, on_delete=models.CASCADE)
    name_block = models.CharField(max_length=100)
    description = models.TextField(blank=True)

class Deploy_a(models.Model):
    training = models.ForeignKey(Block, on_delete=models.CASCADE)
    deploy_image = models.ImageField(upload_to="trainingApp/images", blank=True)
    deploy_sound = models.FileField(upload_to="trainingApp/sound", blank=True)

    ch_d1 = models.CharField(max_length=50, null=True)
    ch_d2 = models.CharField(max_length=50, null=True)
    ch_d3 = models.CharField(max_length=50, null=True)
    ch_d4 = models.CharField(max_length=50, null=True)

    

    def __str__(self):
        return f"Deploy: {self.id}"


class Deploy_b(models.Model):
    training = models.ForeignKey(Block, on_delete=models.CASCADE)
    deploy_image = models.ImageField(upload_to="trainingApp/images", blank=True)
    deploy_sound = models.FileField(upload_to="trainingApp/sound", blank=True)

    ch_d1 = models.CharField(max_length=50, null=True)
    ch_d2 = models.CharField(max_length=50, null=True)
    ch_d3 = models.CharField(max_length=50, null=True)

    def __str__(self):
        return f"Deploy: {self.id}"
    


class DeployAnswerA(models.Model):
    question = models.ForeignKey(Deploy_a, on_delete=models.CASCADE)
    user_response = models.CharField(max_length=50, null=True)

    def __str__(self):
        return self.user_response

class DeployAnswerB(models.Model):
    question = models.ForeignKey(Deploy_b, on_delete=models.CASCADE)
    user_response = models.CharField(max_length=50, null=True)

    def __str__(self):
        return self.user_response