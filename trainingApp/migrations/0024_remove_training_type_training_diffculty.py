# Generated by Django 4.2.8 on 2023-12-30 17:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('trainingApp', '0023_rename_user_response_deploy_correct_answer'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='training',
            name='Type',
        ),
        migrations.AddField(
            model_name='training',
            name='diffculty',
            field=models.CharField(choices=[('Easy', 'Easy'), ('Intemediate', 'Intemediate'), ('Advanced', 'Advanced')], default='Easy', max_length=20),
        ),
    ]
