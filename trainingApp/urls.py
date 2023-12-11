from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth.decorators import login_required
from .views import TrainingList, DeployDetailView

from . import views

app_name = 'trainingApp'

urlpatterns = [
    path("", login_required(TrainingList.as_view()), name="training_List"), 
    path("<int:training_id>/",  login_required(DeployDetailView.as_view()), name="forms")
]