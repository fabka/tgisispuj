# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2016-04-09 02:21
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('proyectos', '0020_auto_20160309_1543'),
    ]

    operations = [
        migrations.AlterField(
            model_name='proyecto',
            name='paginaWeb',
            field=models.CharField(max_length=255, null=True),
        ),
    ]
