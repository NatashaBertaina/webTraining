# Generated by Django 5.0.1 on 2024-03-31 18:09

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('trainingApp', '0009_group_training_gruops'),
        ('userApp', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='trainee',
            name='group',
            field=models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='trainingApp.group'),
        ),
    ]
