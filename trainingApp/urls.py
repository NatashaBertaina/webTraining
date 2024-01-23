from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth.decorators import login_required

from . import views
from .views import IndexView, DeployDetailView

app_name = 'trainingApp'

urlpatterns = [
    path("", login_required(IndexView.as_view()), name="training_List"),
    path("<int:training_id>/",  login_required(DeployDetailView.as_view()), name="forms"),
    path('reviewList/<int:training_id>/', login_required(views.ReviewList.as_view()), name="review_list"),
    path('review/<int:trainee_training_id>/', login_required(views.Review.as_view()), name="review"),
]