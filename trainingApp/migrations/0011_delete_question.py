# Generated by Django 4.2.5 on 2023-10-19 20:47

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('trainingApp', '0010_remove_question_choice_result_question_is_correct'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Question',
        ),
    ]
