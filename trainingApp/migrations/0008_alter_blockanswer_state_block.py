# Generated by Django 5.0.1 on 2024-03-19 19:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('trainingApp', '0007_rename_block_deploy_blockanswer_block'),
    ]

    operations = [
        migrations.AlterField(
            model_name='blockanswer',
            name='state_block',
            field=models.CharField(choices=[('In progress', 'In Progress'), ('Completed', 'Complated')], default='In progress', max_length=20),
        ),
    ]