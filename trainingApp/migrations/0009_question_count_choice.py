# Generated by Django 4.2.5 on 2023-09-28 15:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('trainingApp', '0008_alter_deploy_question_text'),
    ]

    operations = [
        migrations.AddField(
            model_name='question',
            name='count_choice',
            field=models.IntegerField(default=0),
        ),
    ]
