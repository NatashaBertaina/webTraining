# Generated by Django 4.2.5 on 2023-09-28 14:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('trainingApp', '0006_alter_deploy_deploy_image_alter_deploy_deploy_sound'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='question',
            name='question_text',
        ),
        migrations.AddField(
            model_name='deploy',
            name='question_text',
            field=models.CharField(blank=True, max_length=500),
        ),
        migrations.AddField(
            model_name='question',
            name='choice_result',
            field=models.CharField(default=2, max_length=10),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='deploy',
            name='deploy_image',
            field=models.ImageField(blank=True, upload_to='trainingApp/images'),
        ),
        migrations.AlterField(
            model_name='deploy',
            name='deploy_sound',
            field=models.FileField(blank=True, upload_to='trainingApp/sound'),
        ),
    ]