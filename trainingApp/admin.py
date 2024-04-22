from django.contrib import admin
from .models import Training, Deploy, Choice, Block, TraineeTraining, DeployAnswer, Comment, BlockAnswer, Group
from import_export.admin import ExportActionMixin
from import_export import resources  # Importa resources desde import_export
from import_export.fields import Field

#Clase que define cómo se importarán/exportarán los objetos DeployAnswer.
class DeployAnswerResource(resources.ModelResource): 
    #Se usa el campo block_answer para llegar al user_name
    username = Field(column_name='username',attribute='block_answer')
    deploy = Field(column_name='deploy', attribute='deploy')
    
    class Meta:
        model = DeployAnswer
        fields = ('id', 'user_response', 'deploy', 'block_answer','username')
        export_order=fields

    #Metodo que sirve para transformar y formatear el valor de un campo específico antes de que se exporte a un formato externo
    def dehydrate_username(self,obj):
        return str(obj.block_answer.trainee_Training.trainee.user.username)
    
#Clase que permite que el modelo DeployAnswer tenga acciones de exportación en el panel de administración y permite tambien su personalizacion.
class DeployAnswerAdmin(ExportActionMixin, admin.ModelAdmin):
    resource_class= DeployAnswerResource
    
class DeployResource(resources.ModelResource):
    class Meta:
        model = Deploy
        fields = ('id','correct_answer')    

admin.site.register(Training)
admin.site.register(Deploy)
admin.site.register(Choice)
admin.site.register(Block)
admin.site.register(TraineeTraining)
admin.site.register(DeployAnswer,DeployAnswerAdmin)
admin.site.register(Comment)
admin.site.register(BlockAnswer)
admin.site.register(Group)