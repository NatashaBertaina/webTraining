from django.contrib import admin
from .models import Deploy_a, Deploy_b, List_Training, Ans_a, Ans_b, Block, TraineeBlock


admin.site.register(List_Training)
admin.site.register(Block)
admin.site.register(Deploy_a)
admin.site.register(Deploy_b)
admin.site.register(TraineeBlock)
admin.site.register(Ans_a)
admin.site.register(Ans_b)
