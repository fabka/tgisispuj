# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2016-02-12 21:30
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('proyectos', '0011_auto_20160212_2128'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='director',
            unique_together=set([('nombre',)]),
        ),
    ]
