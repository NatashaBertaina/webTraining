# Generated by Django 4.2.8 on 2023-12-11 13:15

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('userApp', '0001_initial'),
        ('trainingApp', '0017_delete_trainee'),
    ]

    operations = [
        migrations.CreateModel(
            name='TraineeTraining',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('pub_date', models.DateTimeField(verbose_name='upload date')),
                ('trainee', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='userApp.trainee')),
                ('training', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='trainingApp.training')),
            ],
        ),
    ]