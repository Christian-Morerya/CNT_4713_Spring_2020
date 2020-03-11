from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
def index(request):
    return HttpResponse("Hello, and welcome to my encryption and decryption website!")

def detail(reqest, cipher_encrypt_id):
    return HttpResponse("")