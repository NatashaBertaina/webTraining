from .models import Deploy, Choice, Block, Training
from modeltranslation.translator import translator, TranslationOptions

class TrainingTranslationOptions(TranslationOptions):
    fields = ('name_training',)  # campos para traducir
    
class BlockTranslationOptions(TranslationOptions):
    fields = ('name_block', 'description',)  # campos para traducir
    
class DeployTranslationOptions(TranslationOptions):
    fields = ('question',)  # campos para traducir

class ChoiceTranslationOptions(TranslationOptions):
    fields = ('choice',)

translator.register(Training, TrainingTranslationOptions)
translator.register(Block, BlockTranslationOptions)
translator.register(Deploy, DeployTranslationOptions)
translator.register(Choice, ChoiceTranslationOptions)

