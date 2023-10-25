from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from . import views

app_name = 'trainingApp'

urlpatterns = [
    path("", views.IndexView.as_view(), name="index"),
    path("<int:pk>/", views.QuestionFormView.as_view(), name="question"),
    path("<int:pk>/results/", views.ResultsView.as_view(), name="results"),
    path("<int:training_id>/answer/", views.answer, name="answer"),
]