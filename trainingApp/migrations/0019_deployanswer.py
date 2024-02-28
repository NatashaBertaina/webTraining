# Generated by Django 4.2.8 on 2023-12-11 13:16

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('trainingApp', '0018_traineetraining'),
    ]

    operations = [
        migrations.CreateModel(
            name='DeployAnswer',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('user_response', models.CharField(max_length=50, null=True)),
                ('deploy', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='trainingApp.deploy')),
                ('trainee_Training', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='trainingApp.traineetraining')),
            ],
        ),
    ]