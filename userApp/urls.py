from django.urls import path
from django.conf import settings
from . import views

app_name = 'userApp'

urlpatterns = [
    path('signup/', views.signup, name='signup'),
    path('logout/', views.signout, name='logout'),
    path('signin/', views.signin, name='signin'),
]