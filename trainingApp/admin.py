from django.contrib import admin
from .models import Deploy, Training, Ans, TraineeBlock, Choice


admin.site.register(Training)
admin.site.register(Deploy)
admin.site.register(Choice)
admin.site.register(TraineeBlock)
admin.site.register(Ans)