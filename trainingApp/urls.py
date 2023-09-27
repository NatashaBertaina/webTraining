from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from . import views

urlpatterns = [
    path("", views.index, name="index"),
    path("<int:training_id>/", views.form, name="form"),
    path("<int:training_id>/results/", views.results, name="results"),
]
