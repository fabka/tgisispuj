# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2016-02-06 03:52
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('proyectos', '0007_auto_20160206_0336'),
    ]

    operations = [
        migrations.CreateModel(
            name='PeriodoAcademico',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('anio', models.CharField(max_length=255)),
                ('semestre', models.CharField(max_length=255)),
            ],
        ),
    ]
