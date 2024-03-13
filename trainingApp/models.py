import datetime
from django.db import models
from userApp.models import Trainee
from django.contrib.auth.models import User
from django.utils import timezone
from django.contrib.auth.models import User
from userApp.models import Trainee


class Training(models.Model):
    #Enumeracion para el tipo de entrenamiento
    class TrainingType(models.TextChoices):
        Easy = 'Easy'
        Intemediate = 'Intemediate'
        Advanced = 'Advanced'
        
    class StateTraining(models.TextChoices):
        Active = 'Active'
        inactive = 'Inactive'
        in_progress = 'in_progress'
        
    name_training = models.CharField(max_length=200)
    pub_date = models.DateTimeField("upload date", auto_now_add=True)
    modificationDate = models.DateTimeField(auto_now= True)
    difficulty = models.CharField(
        max_length=20,
        choices=TrainingType.choices,
        default=TrainingType.Easy
    )
    estimatedDuration = models.IntegerField(default=0)
    state_training= models.CharField(
        max_length=20,
        choices=StateTraining.choices,
        default=StateTraining.in_progress
    )
    #Atributo que gestiona la cantidad de veces que se puede realizar el training
    attempts_allowed = models.IntegerField(default=1)
    
    def was_published_recently(self):
        return self.pub_date >=timezone.now() - datetime.timedelta(days=1)
    def __str__(self):
        return f"id: {self.id}, {self.name_training}"
    
    #Metodo que trae la cantidad de veces que se realizo un training por un trainee especifico
    def get_num_trainee_trainings(self, trainee_id):
        return TraineeTraining.objects.filter(training=self, trainee_id=trainee_id).count()

class DeployType(models.Model):
    name_type = models.CharField(max_length=100)
    description = models.CharField(max_length=500)
    
    def __str__(self):
        return f"id: {self.id}, {self.name_type}"
    
class Deploy(models.Model):
    training = models.ForeignKey(Training, on_delete=models.CASCADE)
    deploy_type = models.ForeignKey(DeployType, on_delete=models.CASCADE, null=True)
    question = models.CharField(max_length=50, null=True)
    deploy_image = models.ImageField(upload_to="trainingApp/images", blank=True)
    deploy_sound = models.FileField(upload_to="trainingApp/sound", blank=True)
    #Respuesta correcta
    correct_answer = models.CharField(max_length=50, null=True)

    def __str__(self):
        return f"Deploy: {self.id} {self.training.name_training}"

class Choice(models.Model):
    deploy = models.ForeignKey(Deploy, on_delete=models.CASCADE)
    choice = models.CharField(max_length=50, null=True)
    def __str__(self):
        return f"id: {self.id}, fk: {self.deploy}"
    
class TraineeTraining(models.Model):
    #foreing Key de training
    training = models.ForeignKey(Training, on_delete=models.CASCADE)
    #foreing Key de trainee
    trainee = models.ForeignKey(Trainee, on_delete=models.CASCADE)
    pub_date = models.DateTimeField("upload date")
    state = models.CharField(max_length=100,default="in_progress")
    time_spent = models.DurationField(null=True, blank=True)
    
    def __str__(self):
        return f"Deploy: {self.id}, {self.training.name_training}, {self.trainee.user.first_name}"

#Clase para guardar la respuesta del usuario de cada deploy
class DeployAnswer(models.Model):
    #foreing Key de trainee_Training
    trainee_Training = models.ForeignKey(TraineeTraining, on_delete=models.CASCADE)
    #foreing Key de deploy
    deploy = models.ForeignKey(Deploy, on_delete=models.CASCADE)

    #Respuesta a deploy
    user_response = models.CharField(max_length=50, null=True)

    def __str__(self):
        return f"deploy_Answer: {self.id}"
    
class Comment(models.Model):
    #Enumeracion para el tipo de entrenamiento
    class MostLiked(models.TextChoices):
        WELL_EXPLAINED = 'Well explained'
        INTERESTING = 'Interesting'
        EASY_TO_UNDERSTAND = 'Easy to understand'

    class LeastLiked(models.TextChoices):
        TOO_DIFFICULT = 'Too difficult'
        NOT_INTERESTING = 'Not interesting'
        POORLY_EXPLAINED = 'Poorly explained'
        CONFUSING = 'Confusing'
        REPETITIVE = 'Repetitive'

    #foreing Key de training
    training = models.ForeignKey(Training, on_delete=models.CASCADE)
    #foreing Key de trainee
    trainee = models.ForeignKey(Trainee, on_delete=models.CASCADE)
    more_liked =  models.CharField(
        max_length=20,
        choices=MostLiked.choices,
        blank=False,
        null=False,
    )
    least_liked = models.CharField(
        max_length=20,
        choices=LeastLiked.choices,
        blank=False,
        null=False,
    )
    comment_aditional = models.CharField(max_length=500)
    stars = models.IntegerField(
        choices=[(i, i) for i in range(1, 6)],
        blank=False,
        null=False,
        )
    pub_date = models.DateTimeField("upload date")
    
    def __str__(self):
        return f"Comment id: {self.id}, {self.training.name_training}, {self.trainee.user.first_name}"
