from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth.decorators import login_required
from .views import TrainingList, DeployDetailView,BlockDeployList

from . import views

app_name = 'trainingApp'

urlpatterns = [
    path("", login_required(TrainingList.as_view()), name="training_List"), 
    path('blockList/<int:training_id>/',  login_required(BlockDeployList.as_view()), name="block_deploy_list"),
    path("form/<int:training_id>/<int:block_id>/", login_required(DeployDetailView.as_view()), name="forms"),
    path('reviewList/<int:training_id>/', login_required(views.ReviewList.as_view()), name="review_list"),
    path('review/<int:trainee_training_id>/', login_required(views.Review.as_view()), name="review"),
    path('comment/<int:training_id>/', login_required(views.CommentView.as_view()), name="comment")
    
]