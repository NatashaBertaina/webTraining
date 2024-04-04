from django.contrib import admin

from .models import Training, Deploy,Choice, Block, TraineeTraining, DeployAnswer,Comment,BlockAnswer,Group

admin.site.register(Training)
admin.site.register(Deploy)
admin.site.register(Choice)
admin.site.register(Block)
admin.site.register(TraineeTraining)
admin.site.register(DeployAnswer)
admin.site.register(Comment)
admin.site.register(BlockAnswer)
admin.site.register(Group)