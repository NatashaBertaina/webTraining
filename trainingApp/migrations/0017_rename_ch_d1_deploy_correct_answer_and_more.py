# Generated by Django 5.0.1 on 2024-01-11 14:20

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('trainingApp', '0016_remove_deploy_question'),
        ('userApp', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='deploy',
            old_name='ch_d1',
            new_name='correct_answer',
        ),
        migrations.RenameField(
            model_name='training',
            old_name='name_training',
            new_name='training_name',
        ),
        migrations.RemoveField(
            model_name='deploy',
            name='ch_d2',
        ),
        migrations.RemoveField(
            model_name='deploy',
            name='ch_d3',
        ),
        migrations.RemoveField(
            model_name='deploy',
            name='ch_d4',
        ),
        migrations.RemoveField(
            model_name='deploy',
            name='training',
        ),
        migrations.RemoveField(
            model_name='deploy',
            name='user_response',
        ),
        migrations.RemoveField(
            model_name='training',
            name='pub_date',
        ),
        migrations.AddField(
            model_name='training',
            name='estimateDuration',
            field=models.IntegerField(default=0),
        ),
        migrations.AddField(
            model_name='training',
            name='modificationDate',
            field=models.DateTimeField(auto_now=True),
        ),
        migrations.AlterField(
            model_name='deploy',
            name='deploy_image',
            field=models.ImageField(blank=True, upload_to='training/images'),
        ),
        migrations.AlterField(
            model_name='deploy',
            name='deploy_sound',
            field=models.FileField(blank=True, upload_to='training/sound'),
        ),
        migrations.CreateModel(
            name='Choice',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('choice', models.CharField(max_length=50, null=True)),
                ('deploy', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='trainingApp.deploy')),
            ],
        ),
        migrations.CreateModel(
            name='TraineeBlock',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('pub_date', models.DateTimeField(verbose_name='upload date')),
                ('trainee', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='userApp.trainee')),
            ],
        ),
        migrations.CreateModel(
            name='Ans',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('user_response', models.CharField(max_length=50, null=True)),
                ('question', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='trainingApp.deploy')),
                ('trainee_block', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='trainingApp.traineeblock')),
            ],
        ),
    ]