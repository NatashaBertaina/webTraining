# Generated by Django 4.2.8 on 2024-01-10 16:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('trainingApp', '0026_alter_training_pub_date'),
    ]

    operations = [
        migrations.AddField(
            model_name='training',
            name='state',
            field=models.CharField(default='in_progress', max_length=100),
        ),
    ]