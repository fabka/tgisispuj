# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2016-02-05 21:45
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('proyectos', '0002_profesores'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Profesores',
            new_name='Profesor',
        ),
    ]