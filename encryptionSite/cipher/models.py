from django.db import models

# Create your models here.
class encrypt(models.Model):
    text = models.TextField()
    def __str__(self):
        return self.text

class decrypt(models.Model):
    text = models.TextField()
    def __str__(self):
        return self.text

class result(models.Model):
    output = models.TextField()
    def __str__(self):
        return self.output
