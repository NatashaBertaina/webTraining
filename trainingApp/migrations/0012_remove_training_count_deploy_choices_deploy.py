# Generated by Django 4.2.5 on 2023-10-23 18:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('trainingApp', '0011_delete_question'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='training',
            name='count',
        ),
        migrations.AddField(
            model_name='deploy',
            name='choices_deploy',
            field=models.CharField(choices=[('A', 'choice A'), ('B', 'choice B'), ('C', 'choice C'), ('D', 'choice D')], max_length=1, null=True),
        ),
    ]
