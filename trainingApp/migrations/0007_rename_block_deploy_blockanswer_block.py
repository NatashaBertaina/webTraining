# Generated by Django 5.0.1 on 2024-03-17 14:04

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('trainingApp', '0006_remove_deploy_block_deploy_and_more'),
    ]

    operations = [
        migrations.RenameField(
            model_name='blockanswer',
            old_name='block_deploy',
            new_name='block',
        ),
    ]
