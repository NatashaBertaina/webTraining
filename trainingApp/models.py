import datetime
from django.db import models
from userApp.models import Trainee
from django.contrib.auth.models import User
from django.utils import timezone
from django.db.models import Sum

class Group (models.Model):
    name_group = models.CharField(max_length=100)
    description = models.CharField(max_length=300)
    
    def __str__(self):
        return f"Gruop_Id: {self.id}, name_group: {self.name_group}"
    
class Training(models.Model):
    #Enumeracion para el tipo de entrenamiento
    class TrainingType(models.TextChoices):
        Easy = 'Inicial'
        Intemediate = 'Intermedio'
        Advanced = 'Avanzado'
        
    class StateTraining(models.TextChoices):
        Active = 'Activo'
        inactive = 'Inactivo'
        
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
        default=StateTraining.Active
    )
    #Atributo que gestiona la cantidad de veces que se puede realizar el training
    attempts_allowed = models.IntegerField(default=1)
    groups = models.ManyToManyField(Group)
    
    def was_published_recently(self):
        return self.pub_date >=timezone.now() - datetime.timedelta(days=1)
    def __str__(self):
        return f"Training_Id: {self.id}, Name Training: {self.name_training}"
    
    #Metodo que trae la cantidad de veces que se realizo un training por un trainee especifico
    def get_num_trainee_trainings(self, trainee_id):
        return TraineeTraining.objects.filter(training=self, trainee_id=trainee_id).count()
    @property
    def total_estimated_duration(self):
        """
        Calcula y devuelve la suma de los estimatedDuration de todos los bloques asociados a este entrenamiento.
        """
        return self.block_set.aggregate(total_duration=Sum('estimed_duration_block'))['total_duration'] or 0

class Block(models.Model):
    class StateBlock(models.TextChoices):
        Active = 'Activo'
        inactive = 'Inactivo'
    name_block = models.CharField(max_length=100)
    description = models.CharField(max_length=500)
    estimed_duration_block = models.IntegerField(default=0)
    state_block= models.CharField(
        max_length=20,
        choices=StateBlock.choices,
        default=StateBlock.Active
    )
    training = models.ForeignKey(Training, on_delete=models.CASCADE)
    
    def __str__(self):
        return f"Block_Id: {self.id}, Name Block: {self.name_block}, Training: {self.training.name_training}"
    
    
class Deploy(models.Model):
    block = models.ForeignKey(Block, on_delete=models.CASCADE, null=True)
    question = models.CharField(max_length=100, null=True)
    deploy_image = models.ImageField(upload_to="trainingApp/images", blank=True)
    deploy_sound = models.FileField(upload_to="trainingApp/sound", blank=True)
    #Respuesta correcta
    correct_answer = models.CharField(max_length=100, null=True) 

    def __str__(self):
        return f"Deploy_Id: {self.id}, Block: {self.block.name_block}"


class Choice(models.Model):
    deploy = models.ForeignKey(Deploy, on_delete=models.CASCADE)
    choice = models.CharField(max_length=100, null=True)
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
        return f"T.T_Id: {self.id}, Name Training: {self.training.name_training}, Name Trainee: {self.trainee.user.first_name}"
    
class BlockAnswer(models.Model):
    class StateBlockAnswer(models.TextChoices):
        in_progress = 'En progreso'
        Complated = 'Completo'
        
    state_block= models.CharField(
        max_length=20,
        choices=StateBlockAnswer.choices,
        default=StateBlockAnswer.in_progress
    )
    trainee_Training = models.ForeignKey(TraineeTraining, on_delete=models.CASCADE)
    block = models.ForeignKey(Block, on_delete=models.CASCADE)
    
    def __str__(self):
        return f"Block_Answer_Id: {self.id}, Name block: {self.block.name_block}"


#Clase para guardar la respuesta del usuario de cada deploy
class DeployAnswer(models.Model):
    
    #foreing Key de B.A
    block_answer = models.ForeignKey(BlockAnswer, on_delete=models.CASCADE, null=True)
    #foreing Key de deploy
    deploy = models.ForeignKey(Deploy, on_delete=models.CASCADE)
    #Respuesta a deploy
    user_response = models.CharField(max_length=50, null=True)

    def __str__(self):
        return f"Deploy_Answer_Id: {self.id}"
    
    
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
        return f"Comment_Id: {self.id}, Training: {self.training.name_training}, Trainee: {self.trainee.user.first_name}"