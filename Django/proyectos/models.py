from __future__ import unicode_literals
from django.core import serializers
from django.core.serializers.python import Serializer
from django.db import models
import json
from django.core.serializers.json import DjangoJSONEncoder


"""
    Entidad que contiene el registro de todos los profesores que han sido
    directores de trabajos de grado
"""
class Director(models.Model):
    nombre = models.CharField(max_length=255)

    def __unicode__(self):
        return "%s" % self.nombre

    class Meta:
        verbose_name_plural = "Directores"
        unique_together = (("nombre"),)

"""
    Entidad que indica a que grupo de investigacion pertenece el trabajo de
    grado
"""
class GrupoInvestigacion(models.Model):
    nombre = models.CharField(max_length=255)

    def __unicode__(self):
        return "%s" % self.nombre

    class Meta:
        verbose_name_plural = "Grupos de investigaci\u00F3n"

"""
    Entidad que indica si el trabajo de grado tuvo mencion de honor
"""
class MencionHonor(models.Model):
    nombre = models.CharField(max_length=255)

    def __unicode__(self):
        return "%s" % self.nombre

    class Meta:
            verbose_name_plural = "Mencion de honor"

"""
    Entidad que indica la modalidad del trabajo de grado
"""
class Modalidad(models.Model):
    nombre = models.CharField(max_length=255)

    def __unicode__(self):
        return "%s" % self.nombre

    class Meta:
        verbose_name_plural = "Modalidades"

"""
    Entidad que indica el titulo al cual aplico el trabajo de grado
"""
class TituloAplicado(models.Model):
    nombre = models.CharField(max_length=255)

    def __unicode__(self):
        return "%s" % self.nombre

    class Meta:
        verbose_name_plural = "T\u00EDtulo aplicado"

"""
    Entidad que indica la fecha de entrega del trabajo de grado
"""
class PeriodoAcademico(models.Model):
    anio = models.CharField(max_length=255, verbose_name="A\u00F1o")
    semestre = models.CharField(max_length=255, null=True, blank=True)

    class Meta:
        unique_together = (("anio","semestre"),)
        verbose_name_plural = "Periodos acad\u00E9micos"

    def __unicode__(self):
        if not self.semestre :
            return "%s" % (self.anio)
        return "%s - %s" % (self.anio, self.semestre)

"""
    Esta es la clase que representa la tabla de trabajos de grado completa
"""
class Proyecto(models.Model):
    codigo = models.CharField(max_length=255, null=True, blank=True)
    nombre = models.CharField(max_length=1000, null=True, verbose_name="Nombre TG")
    autor = models.CharField(max_length=255, null = True)
    paginaWeb = models.CharField(max_length=1000, null=True, blank=True)
    director = models.ForeignKey(Director, null=True)
    tituloAplicado = models.ForeignKey(TituloAplicado, null=True)
    periodoAcademico = models.ForeignKey(PeriodoAcademico, null=True)
    modalidad = models.ForeignKey(Modalidad, null=True, blank=True)
    mencionHonor = models.ForeignKey(MencionHonor, null=True, blank=True)
    grupoInvestigacion = models.ForeignKey(GrupoInvestigacion, null=True, blank=True)

    def __unicode__(self):
        return "%s - %s" % (self.id, self.nombre)

    def get_form(self, request, obj=None, **kwargs):
        self.exclude = ("paginaWeb", )
        proyecto = super(Proyecto, self).get_form(request, obj, **kwargs)
        return proyecto

    def save(self, *args, **kwargs):
        self.codigo = self.codigo.replace(" ", "")
        if self.codigo == "":
            self.codigo = None
            self.paginaWeb = self.paginaWeb.replace(" ", "")
            if self.paginaWeb == "":
                self.paginaWeb = None
        else:
            self.paginaWeb = "http://pegasus.javeriana.edu.co/~{0}/".format(self.codigo)
        super(Proyecto, self).save(*args, **kwargs)

    class Meta:
        unique_together = (("codigo"),)
        verbose_name_plural = "Proyectos"
        
