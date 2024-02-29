from django.contrib import admin

from .models import Training, Deploy,Choice, DeployType, TraineeTraining, DeployAnswer,Comment

admin.site.register(Training)
admin.site.register(Deploy)
admin.site.register(Choice)
admin.site.register(DeployType)
admin.site.register(TraineeTraining)
admin.site.register(DeployAnswer)
admin.site.register(Comment)
