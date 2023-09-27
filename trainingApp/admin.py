from django.contrib import admin

from .models import Training, Deploy, Question

admin.site.register(Training)
admin.site.register(Deploy)
admin.site.register(Question)
