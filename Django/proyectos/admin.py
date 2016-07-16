from django.contrib import admin

from .models import Proyecto, Director, Modalidad, TituloAplicado, MencionHonor, GrupoInvestigacion, PeriodoAcademico

@admin.register(Proyecto)
class Administrador( admin.ModelAdmin ):
    list_filter = ('codigo',)
    list_display = ('codigo','nombre')
    
@admin.register(Director)
class Administrador( admin.ModelAdmin ):
    list_filter = ('nombre',)
    list_display = ('nombre',)
    
@admin.register(Modalidad)
class Administrador( admin.ModelAdmin ):
    list_filter = ('nombre',)
    list_display = ('nombre',)

@admin.register(TituloAplicado)
class Administrador( admin.ModelAdmin ):
    list_filter = ('nombre',)
    list_display = ('nombre',)

@admin.register(MencionHonor)
class Administrador( admin.ModelAdmin ):
    list_filter = ('nombre',)
    list_display = ('nombre',)

@admin.register(GrupoInvestigacion)
class Administrador( admin.ModelAdmin ):
    list_filter = ('nombre',)
    list_display = ('nombre',)

@admin.register(PeriodoAcademico)
class Administrador( admin.ModelAdmin ):
    list_filter = ('anio',)
    list_display = ('anio','semestre')