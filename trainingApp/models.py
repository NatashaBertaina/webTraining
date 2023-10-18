import datetime

from django.db import models
from django.utils import timezone
from django.contrib import admin
from django.core.files.storage import FileSystemStorage

class Training(models.Model):
    name_training = models.CharField(max_length=200)
    pub_date = models.DateTimeField("upload date")

    count = models.IntegerField(default=0)

    def was_published_recently(self):
        return self.pub_date >=timezone.now() - datetime.timedelta(days=1)
    def __str__(self):
        return self.name_training


class Deploy(models.Model):
    training = models.ForeignKey(Training, on_delete=models.CASCADE)
    deploy_image = models.ImageField(upload_to="trainingApp/images", blank=True)
    deploy_sound = models.FileField(upload_to="trainingApp/sound", blank=True)
    question_text = models.CharField(max_length=500)

    def __str__(self):
        return f"Deploy ID: {self.id}"

class Question(models.Model):
    deploy = models.ForeignKey(Deploy, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    is_correct = models.BooleanField(default=False)
    count_choice = models.IntegerField(default=0)

    def __str__(self):
        return self.choice_text
