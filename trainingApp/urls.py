from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth.decorators import login_required

from . import views
from .views import IndexView, BlockView, DeployForm

app_name = 'trainingApp'

urlpatterns = [
    path("", login_required(IndexView.as_view()), name="list_training"),
    path("<int:training_id>/", login_required(BlockView.as_view()), name="list_block"),
    path("<int:block_id>/", login_required(DeployForm.as_view()), name="form"),
]