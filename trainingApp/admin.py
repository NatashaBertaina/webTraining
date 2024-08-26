from django.contrib import admin
from .models import Training, Deploy, Choice, Block, TraineeTraining, DeployAnswer, Comment, BlockAnswer, Group
from import_export.admin import ExportActionMixin
from import_export import resources  # Importa resources desde import_export
from import_export.fields import Field
from modeltranslation.admin import TranslationAdmin

#Clase que define cómo se importarán/exportarán los objetos DeployAnswer.
class DeployAnswerResource(resources.ModelResource): 
    #Se usa el campo block_answer para llegar al user_name
    username = Field(column_name='username',attribute='block_answer')
    deploy = Field(column_name='deploy', attribute='deploy')
    
    class Meta:
        model = DeployAnswer
        fields = ('id', 'selectedChoice', 'deploy', 'block_answer','username')
        export_order=fields

    #Metodo que sirve para transformar y formatear el valor de un campo específico antes de que se exporte a un formato externo
    def dehydrate_username(self,obj):
        return str(obj.block_answer.trainee_Training.trainee.user.username)
    
    def dehydrate_selectedChoice(self,obj):
        return str(obj.selectedChoice.choice)
    
#Clase que permite que el modelo DeployAnswer tenga acciones de exportación en el panel de administración y permite tambien su personalizacion.
class DeployAnswerAdmin(ExportActionMixin, admin.ModelAdmin):
    resource_class= DeployAnswerResource
    
class DeployResource(resources.ModelResource):
    class Meta:
        model = Deploy
        fields = ('id','question',)    
        
        

#Clases que heredan de admin.ModelAdmin gestionan el estilo en el admin
class TrainingAdmin(TranslationAdmin,admin.ModelAdmin):
    list_display = ('name_training',)
    
    class Media:
        js = (
            'https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js',
            'https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js',
            'modeltranslation/js/tabbed_translation_fields.js',
        )
        css = {
            'all': (
                'modeltranslation/css/tabbed_translation_fields.css',
                'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css',  # Nuevo estilo añadido
            ),
        }
        
class BlockAdmin(TranslationAdmin,admin.ModelAdmin):
    list_display = ('name_block', 'description',) 
    
    class Media:
        js = (
            'https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js',
            'https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js',
            'modeltranslation/js/tabbed_translation_fields.js',
        )
        css = {
            'all': (
                'modeltranslation/css/tabbed_translation_fields.css',
                'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css',  # Nuevo estilo añadido
            ),
        }
        
class DeployAdmin(TranslationAdmin,admin.ModelAdmin):
    list_display = ('question',)
    
    class Media:
        js = (
            'https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js',
            'https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js',
            'modeltranslation/js/tabbed_translation_fields.js',
        )
        css = {
            'all': (
                'modeltranslation/css/tabbed_translation_fields.css',
                'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css',  
            ),
        }

class ChoiceAdmin(TranslationAdmin,admin.ModelAdmin):
    list_display = ('choice',)
    
    class Media:
        js = (
            'https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js',
            'https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js',
            'modeltranslation/js/tabbed_translation_fields.js',
        )
        css = {
            'all': (
                'modeltranslation/css/tabbed_translation_fields.css',
                'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css',  
            ),
        }
        
admin.site.register(Training,TrainingAdmin)
admin.site.register(Deploy,DeployAdmin) 
admin.site.register(Choice,ChoiceAdmin)
admin.site.register(Block,BlockAdmin)
admin.site.register(TraineeTraining)
admin.site.register(DeployAnswer,DeployAnswerAdmin)
admin.site.register(Comment)
admin.site.register(BlockAnswer)
admin.site.register(Group)