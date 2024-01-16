from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth.decorators import login_required

from . import views
from .views import IndexView

app_name = 'trainingApp'

urlpatterns = [
    path("", login_required(IndexView.as_view()), name="list_training"),
]