from django.contrib import admin
from django.urls import path, include
from . import views

#sets up url paths to send to encrypt, or decrypt or admin or default
urlpatterns = [
    path('', views.index, name='index'),

]