from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render_to_response
from django.template import loader
from django.template import RequestContext
from django.core import serializers


from .models import Proyecto
from .models import Director
from .models import TituloAplicado
from .models import PeriodoAcademico
from .models import Modalidad
from .models import MencionHonor
from .models import GrupoInvestigacion
from django.db.models import Count
from django.db.models import Q
import json
import unicodedata

'''
    Carga los datos proporcionados en el administrador de Django, para que puedan ser presentados en
    el html.
'''
def proyectos(request):
    proyectos = Proyecto.objects.all()
    titulosAplicados = TituloAplicado.objects.all()
    periodosAcademicos = PeriodoAcademico.objects.values('semestre').annotate(dcount=Count('semestre'))
    modalidades = Modalidad.objects.all()
    mencionesHonor = MencionHonor.objects.all()
    gruposInvestigacion = GrupoInvestigacion.objects.all()
    template = loader.get_template('index.html')
    context = {
        'proyectos': proyectos,
        'titulosAplicados' : titulosAplicados,
        'periodosAcademicos' : periodosAcademicos,
        'modalidades'  : modalidades,
        'mencionesHonor' : mencionesHonor,
        'gruposInvestigacion' : gruposInvestigacion,
    }

    return HttpResponse(template.render(context, request))

'''
    Esta funcion entrega todos los trabajos de grado disponibles sin ningun filtro
'''
def api(request):

    modalidad_nombre = ''
    mencionHonor_nombre = ''
    grupoInvestigacion_nombre = ''

    proyectos = Proyecto.objects.all().order_by('periodoAcademico__anio', 'periodoAcademico__semestre', 'nombre')
    list = [] #create list
    for p in proyectos: #populate list

        if p.modalidad is None:
            modalidad_nombre = ''
        else:
            modalidad_nombre = p.modalidad.nombre

        if p.mencionHonor is None:
            mencionHonor_nombre = ''
        else:
            mencionHonor_nombre = p.mencionHonor.nombre

        if p.grupoInvestigacion is None:
            grupoInvestigacion_nombre = ''
        else:
            grupoInvestigacion_nombre = p.grupoInvestigacion.nombre

        if not p.periodoAcademico.semestre:
            periodoAcademico = p.periodoAcademico.anio
        else:
            periodoAcademico = p.periodoAcademico.anio + '-' + p.periodoAcademico.semestre

        list.append({'nombre':p.nombre,
            'autor':p.autor,
            'director': p.director.nombre,
            'paginaWeb':p.paginaWeb,
            'codigo': p.codigo,
            'tituloAplicado': p.tituloAplicado.nombre,
            'periodoAcademico':periodoAcademico,
            'modalidad': modalidad_nombre,
            'mencionHonor':mencionHonor_nombre,
            'grupoInvestigacion':grupoInvestigacion_nombre })

    data = json.dumps(list)
    return HttpResponse(data, content_type='application/json')

'''
    Esta funcion analiza las peticiones y devuelve los trabajos de grado con los filtros que se hayan solicitado.
'''
def busqueda(request):

    qObjects = Q()
    qGeneral = Q()
    if request.method == 'GET':
        general = request.GET.get('general', '')
        modalidad = request.GET.get('modalidad', '')
        grupoInvestigacion = request.GET.get('grupoInvestigacion', '')
        mencionHonor = request.GET.get('mencionHonor', '')
        anio = request.GET.get('anio', '')
        semestre = request.GET.get('semestre', '')
        tituloAplicado = request.GET.get('tituloAplicado', '')
    if general:
        print(general)
        qGeneral = qGeneral | Q(nombre__icontains=general)
        qGeneral = qGeneral | Q(autor__icontains=general)
        qGeneral = qGeneral | Q(director__nombre__icontains=general)
        qObjects = qObjects & qGeneral
    if modalidad:
        qObjects = qObjects & Q(modalidad__nombre=modalidad)
    if grupoInvestigacion:
        qObjects = qObjects & Q(grupoInvestigacion__nombre=grupoInvestigacion)
    if mencionHonor:
        qObjects = qObjects & Q(mencionHonor__nombre=mencionHonor)
    if anio:
        qObjects = qObjects & Q(periodoAcademico__anio=anio)
    if semestre:
        qObjects = qObjects & Q(periodoAcademico__semestre=semestre)
    if tituloAplicado:
        qObjects = qObjects & Q(tituloAplicado__nombre=tituloAplicado)
    proyectos = Proyecto.objects.all().filter( qObjects ).order_by('periodoAcademico__anio', 'periodoAcademico__semestre', 'nombre');

    list = [] #create list
    if proyectos:
        for p in proyectos: #populate list

            if p.modalidad is None:
                modalidad_nombre = ''
            else:
                modalidad_nombre = p.modalidad.nombre

            if p.mencionHonor is None:
                mencionHonor_nombre = ''
            else:
                mencionHonor_nombre = p.mencionHonor.nombre

            if p.grupoInvestigacion is None:
                grupoInvestigacion_nombre = ''
            else:
                grupoInvestigacion_nombre = p.grupoInvestigacion.nombre

            if not p.periodoAcademico.semestre:
                periodoAcademico = p.periodoAcademico.anio
            else:
                periodoAcademico = p.periodoAcademico.anio + '-' + p.periodoAcademico.semestre
            list.append({'nombre':p.nombre,
                'autor':p.autor,
                'director': p.director.nombre,
                'paginaWeb':p.paginaWeb,
                'codigo': p.codigo,
                'tituloAplicado': p.tituloAplicado.nombre,
                'periodoAcademico':periodoAcademico,
                'modalidad': modalidad_nombre,
                'mencionHonor':mencionHonor_nombre,
                'grupoInvestigacion':grupoInvestigacion_nombre })
    data = json.dumps(list)
    return HttpResponse(data, content_type='application/json');

'''
    Manejo de una respuesta HTTP 400
'''
def handler400(request):
    response = render_to_response('400.html', {}, context_instance=RequestContext(request))
    response.status_code = 400
    return response

'''
    Manejo de una respuesta HTTP 401
'''
def handler403(request):
    response = render_to_response('401.html', {}, context_instance=RequestContext(request))
    response.status_code = 401
    return response

'''
    Manejo de una respuesta HTTP 403
'''
def handler403(request):
    response = render_to_response('403.html', {}, context_instance=RequestContext(request))
    response.status_code = 403
    return response

'''
    Manejo de una respuesta HTTP 404
'''
def handler404(request):
    response = render_to_response('404.html', {}, context_instance=RequestContext(request))
    response.status_code = 404
    return response

'''
    Manejo de una respuesta HTTP 500
'''
def handler500(request):
    response = render_to_response('500.html', {}, context_instance=RequestContext(request))
    response.status_code = 500
    return response

'''
    Manejo de una respuesta HTTP 503
'''
def handler503(request):
    response = render_to_response('500.html', {}, context_instance=RequestContext(request))
    response.status_code = 503
    return response

'''
   Funcion encargada de quitar los acentos de una cadena de caracteres.
   tomada de http://stackoverflow.com/a/518232
'''
def strip_accents(s):
    return ''.join(c for c in unicodedata.normalize('NFD', s)
        if unicodedata.category(c) != 'Mn')