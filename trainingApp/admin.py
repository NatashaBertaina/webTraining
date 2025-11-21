from django.contrib import admin
from .models import Training, Deploy, Choice, Block, TraineeTraining, DeployAnswer, Comment, BlockAnswer, Group
from import_export.admin import ExportActionMixin
from import_export import resources  # Importa resources desde import_export
from import_export.fields import Field
from modeltranslation.admin import TranslationAdmin
from django.utils.html import format_html
from django.urls import reverse
from django.http import HttpResponseRedirect


# Mixin para controlar la paginación desde un parámetro GET (?per_page=10|50|100)
class PaginationMixin:
    per_page_choices = (10,)
    default_list_per_page = 20

    def changelist_view(self, request, extra_context=None):
        session_key = f'admin_per_page_{self.model._meta.app_label}_{self.model._meta.model_name}'
        per_page_i = request.session.get(session_key)
        if per_page_i in self.per_page_choices:
            self.list_per_page = per_page_i
        else:
            self.list_per_page = self.default_list_per_page

        if extra_context is None:
            extra_context = {}
        extra_context['per_page_choices'] = self.per_page_choices
        extra_context['current_per_page'] = getattr(self, 'list_per_page', self.default_list_per_page)
        extra_context['request'] = request
        return super().changelist_view(request, extra_context=extra_context)

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
class TrainingAdmin(PaginationMixin, TranslationAdmin, admin.ModelAdmin):
    list_display = ('id','name_training','view_blocks','difficulty','state_training','estimatedDuration','attempts_allowed','pub_date')
    list_display_links = ('name_training',)
    list_filter = ('difficulty','state_training','groups')
    search_fields = ('name_training',)
    ordering = ('-pub_date',)

    def view_blocks(self,obj):
        """Link to the Block changelist filtered by this training."""
        try:
            count = obj.block_set.count()
        except Exception:
            count = 0
        url = reverse('admin:trainingApp_block_changelist') + f'?training__id__exact={obj.id}'
        return format_html('<a href="{}">Blocks ({})</a>', url, count)
    view_blocks.short_description = 'Blocks'
    
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
        
class BlockAdmin(PaginationMixin, TranslationAdmin, admin.ModelAdmin):
    list_display = ('id','name_block','view_deploys', 'training', 'state_block','estimed_duration_block',)
    list_display_links = ('name_block',)
    list_filter = ('state_block','training')
    search_fields = ('name_block','description')
    list_select_related = ('training',)
    autocomplete_fields = ('training',)
    
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

    def view_deploys(self,obj):
        """Link to the Deploy changelist filtered by this block."""
        try:
            count = obj.deploy_set.count()
        except Exception:
            count = 0
        url = reverse('admin:trainingApp_deploy_changelist') + f'?block__id__exact={obj.id}'
        return format_html('<a href="{}">Deploys ({})</a>', url, count)
    view_deploys.short_description = 'Deploys'
        
class DeployAdmin(PaginationMixin, TranslationAdmin, admin.ModelAdmin):
    list_display = ('id','question','view_choices','block','has_media')
    list_filter = ('block__training','block')
    search_fields = ('question','block__name_block')
    ordering = ('block','id')

    def has_media(self,obj):
        return bool(obj.deploy_image) or bool(obj.deploy_sound)
    has_media.boolean = True
    has_media.short_description = 'Has media'

    def view_choices(self,obj):
        """Link to the Choice changelist filtered by this deploy."""
        try:
            count = obj.choice_set.count()
        except Exception:
            count = 0
        url = reverse('admin:trainingApp_choice_changelist') + f'?deploy__id__exact={obj.id}'
        return format_html('<a href="{}">Choices ({})</a>', url, count)
    view_choices.short_description = 'Choices'
    
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

class ChoiceAdmin(PaginationMixin, TranslationAdmin, admin.ModelAdmin):
    list_display = ('id','choice','deploy','correctChoice')
    list_filter = ('correctChoice','deploy')
    search_fields = ('choice',)
    
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

class TraineeTrainingAdmin(PaginationMixin, admin.ModelAdmin):
    list_display = ('id','training','trainee','pub_date','state','time_spent')
    list_filter = ('state','training')
    search_fields = ('trainee__user__username','training__name_training')
    raw_id_fields = ('trainee','training')


class DeployAnswerAdmin(PaginationMixin, ExportActionMixin, admin.ModelAdmin):
    resource_class= DeployAnswerResource
    list_display = ('id','deploy','get_trainee_username','selectedChoice')
    search_fields = ('deploy__question','block_answer__trainee_Training__trainee__user__username')
    list_select_related = ('block_answer','selectedChoice')

    def get_trainee_username(self,obj):
        try:
            return obj.block_answer.trainee_Training.trainee.user.username
        except Exception:
            return None
    get_trainee_username.short_description = 'Trainee'


class CommentAdmin(PaginationMixin, admin.ModelAdmin):
    list_display = ('id','training','get_trainee_username','stars','pub_date')
    list_filter = ('stars','training')
    search_fields = ('trainee__user__username','training__name_training','comment_aditional')

    def get_trainee_username(self,obj):
        try:
            return obj.trainee.user.username
        except Exception:
            return None
    get_trainee_username.short_description = 'Trainee'


class BlockAnswerAdmin(PaginationMixin, admin.ModelAdmin):
    list_display = ('id','block','trainee_Training','state_block')
    list_filter = ('state_block','block')
    search_fields = ('trainee_Training__trainee__user__username','block__name_block')


class GroupAdmin(PaginationMixin, admin.ModelAdmin):
    list_display = ('id','name_group','description')
    search_fields = ('name_group',)


admin.site.register(TraineeTraining,TraineeTrainingAdmin)
class HiddenTraineeTrainingAdmin(admin.ModelAdmin):
    """No mostrar ni permitir acciones sobre TraineeTraining en el admin."""
    def get_model_perms(self, request):
        # Retornar diccionario vacío evita que el modelo aparezca en el index del admin
        return {}

    def has_view_permission(self, request, obj=None):
        return False

    def has_add_permission(self, request):
        return False

    def has_change_permission(self, request, obj=None):
        return False

    def has_delete_permission(self, request, obj=None):
        return False

class BlockInline(admin.TabularInline):
    """Show Blocks inside the Training change page for quick overview and edits."""
    model = Block
    fields = ('name_block','state_block','estimed_duration_block')
    extra = 0
    show_change_link = True
    ordering = ('id',)

# Attach inline to TrainingAdmin so Blocks are grouped on the Training change page
TrainingAdmin.inlines = getattr(TrainingAdmin, 'inlines', ()) + (BlockInline,)


class DeployInline(admin.TabularInline):
    """Show Deploys inside the Block change page for quick overview and edits."""
    model = Deploy
    fields = ('question','deploy_image','deploy_sound')
    extra = 0
    show_change_link = True
    ordering = ('id',)

# Attach DeployInline to BlockAdmin so Deploys are grouped on the Block change page
BlockAdmin.inlines = getattr(BlockAdmin, 'inlines', ()) + (DeployInline,)


class ChoiceInline(admin.TabularInline):
    """Show Choices inside the Deploy change page for quick overview and edits."""
    model = Choice
    fields = ('choice','correctChoice')
    extra = 0
    show_change_link = True
    ordering = ('id',)

# Attach ChoiceInline to DeployAdmin so Choices are grouped on the Deploy change page
DeployAdmin.inlines = getattr(DeployAdmin, 'inlines', ()) + (ChoiceInline,)

admin.site.register(Training,TrainingAdmin)
admin.site.register(Block,BlockAdmin)
admin.site.register(Deploy,DeployAdmin)
admin.site.register(Choice,ChoiceAdmin)
admin.site.unregister(TraineeTraining)
admin.site.register(TraineeTraining, HiddenTraineeTrainingAdmin)
admin.site.register(DeployAnswer,DeployAnswerAdmin)
admin.site.register(Comment,CommentAdmin)
admin.site.register(BlockAnswer,BlockAnswerAdmin)
admin.site.register(Group,GroupAdmin)