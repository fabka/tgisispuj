from django.contrib import admin

from .models import Proyecto, Director, Modalidad, TituloAplicado, MencionHonor, GrupoInvestigacion, PeriodoAcademico

'''
   En esta clase, list_filter() indica en el admin como se filtraran los resultados en el administrador de Django
   y list_display() indica que valores se van a mostrar. 
'''


'''
    Muestra todos los proyectos disponibles. En este caso se muestra una tabla con codigo y nombre y se filtra 
    unicamente con el codigo del trabjo de grado
'''
@admin.register(Proyecto)
class Administrador( admin.ModelAdmin ):
    list_filter = ('codigo',)
    list_display = ('codigo','nombre')

'''
    Indica los directores de trabajo de grado disponibles. Muestra el nombre y se filtra también por nombre
''' 
@admin.register(Director)
class Administrador( admin.ModelAdmin ):
    list_filter = ('nombre',)
    list_display = ('nombre',)

'''
    Indica las modalidades de trabajo de grado disponibles. Muestra la modalidad y tambien filtra por modalidad
''' 
@admin.register(Modalidad)
class Administrador( admin.ModelAdmin ):
    list_filter = ('nombre',)
    list_display = ('nombre',)

'''
    Indica el titulo al que aplica el trabajo de grado. Muestra el titulo y tambien filtra por titulo
'''
@admin.register(TituloAplicado)
class Administrador( admin.ModelAdmin ):
    list_filter = ('nombre',)
    list_display = ('nombre',)

'''
    Indica si el trabajo de grado obtuvo mencion de honor. Muestra si el trabajo de grado obtuvo o no, 
    y filtra tambien con base en los mismos resultados.
'''
@admin.register(MencionHonor)
class Administrador( admin.ModelAdmin ):
    list_filter = ('nombre',)
    list_display = ('nombre',)

'''
    Indica el grupo de investigacion al cual pertenece el trabajo de grado. Muestra el nombre del grupo de 
    investigacion y filtra tambien con el mismo nombre. 
'''
@admin.register(GrupoInvestigacion)
class Administrador( admin.ModelAdmin ):
    list_filter = ('nombre',)
    list_display = ('nombre',)

'''
   Indica el periodo academico en el cual se presento el trabajo de grado. Muestra el anio y el semetre y filtra
   unicamente por el anio de presentacion
'''
@admin.register(PeriodoAcademico)
class Administrador( admin.ModelAdmin ):
    list_filter = ('anio',)
    list_display = ('anio','semestre')