import datetime

from django.db import models
from django.utils import timezone
from django.contrib import admin

class Training(models.Model):
    name_training = models.CharField(max_length=200)
    pub_date = models.DateTimeField("upload date")


    def was_published_recently(self):
        return self.pub_date >=timezone.now() - datetime.timedelta(days=1)
    def __str__(self):
        return self.name_training


class Deploy(models.Model):
    training = models.ForeignKey(Training, on_delete=models.CASCADE)
    deploy_image = models.ImageField(upload_to="trainingApp/images", blank=True)
    deploy_sound = models.FileField(upload_to="trainingApp/sound", blank=True)
    ch_d1 = models.CharField(max_length=50, null=True)
    ch_d2 = models.CharField(max_length=50, null=True)
    ch_d3 = models.CharField(max_length=50, null=True)
    ch_d4 = models.CharField(max_length=50, null=True)

    user_response = models.CharField(max_length=50, null=True)

    def __str__(self):
        return f"Deploy: {self.id}"
