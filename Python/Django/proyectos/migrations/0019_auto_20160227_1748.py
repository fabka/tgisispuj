# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2016-02-27 17:48
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('proyectos', '0018_proyecto_periodoacademico'),
    ]

    operations = [
        migrations.AlterField(
            model_name='periodoacademico',
            name='semestre',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='proyecto',
            name='codigo',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='proyecto',
            name='grupoInvestigacion',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='proyectos.GrupoInvestigacion'),
        ),
        migrations.AlterField(
            model_name='proyecto',
            name='mencionHonor',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='proyectos.MencionHonor'),
        ),
        migrations.AlterField(
            model_name='proyecto',
            name='modalidad',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='proyectos.Modalidad'),
        ),
    ]