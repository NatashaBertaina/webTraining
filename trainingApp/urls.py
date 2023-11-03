from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from . import views

app_name = 'trainingApp'

urlpatterns = [
    path("", views.IndexView.as_view(), name="index"),
    path("<int:deploy_id>/", views.DeployDetailView.as_view(), name="forms"),
    path("<int:pk>/results/", views.ResultsView.as_view(), name="results"),
]