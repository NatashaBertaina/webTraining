from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth.decorators import login_required
from .views import TrainingList, DeployDetailView

from . import views

app_name = 'trainingApp'

urlpatterns = [
    path("", login_required(TrainingList.as_view()), name="training_List"), 
    path("<int:training_id>/",  login_required(DeployDetailView.as_view()), name="forms"),
    path('reviewList/<int:training_id>/', login_required(views.ReviewList.as_view()), name="review_list"),
    path('review/<int:trainee_training_id>/', login_required(views.Review.as_view()), name="review"),
    path('comment/<int:training_id>/', login_required(views.CommentView.as_view()), name="comment"),
]