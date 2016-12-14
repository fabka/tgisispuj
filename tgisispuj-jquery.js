var periodo = '';
var codigo = ''
var modalidad = '';
var grupoInvestigacion = '';
var mencionHonor = '';
var tituloAplicado = '';
var anio = '';
var general = '';
var regex = '';
var encabezado = $('.tabla-principal .encabezado');
var encabezadoFijo = $('.tabla-principal .encabezado-fijo');
var stickyThead = encabezado.offset().top;
var static_url = 'http://pegasus.javeriana.edu.co/static/';
/**
 * Fixed header
*/

$.ajaxSetup({
        scriptCharset: "iso-8859-9",
        cache: false
});

$(function () {
    var theadWidth = encabezado.width();
    var nombre_th, autor_th, director_th, website_th, detalles_th;
    
    $(window).scroll(function () {
        stickyThead = encabezado.offset().top;
        if( $(window).width() > 768 ){
            if ($(window).scrollTop() > stickyThead) {
                encabezadoFijo.show();
                encabezadoFijo.find('.nombre').css('width',90*0.3+'vw');
                encabezadoFijo.find('.autor').css('width',90*0.2+'vw');
                encabezadoFijo.find('.director').css('width',90*0.2+'vw');
                encabezadoFijo.find('.website').css('width',90*0.15+'vw');
                encabezadoFijo.find('.detalles').css('width',90*0.15+'vw');
            } else {
                encabezadoFijo.hide();
            }
        }else{
            encabezadoFijo.hide();
        }
    });
})

$(document).ready(function(){
    encabezadoFijo.hide();
    $('.detalles-div').hide();
    constructor();
});

$(document).keypress(function(e) {
    if(e.which == 13) {
        busqueda();
    }
});

/*
    funciones ajax
*/
function constructor() {
	$.ajax({
		url : './api',
		success : function(data) {
			addTGs(data);
		},
		error : function(data) {
			console.log("Error al recuperar los datos");
		}
	})
}

var entityMap = {
    'á': 'a',
    'é': 'e;',
    'í': 'i',
    'ó': 'o',
    "ú": 'u',
    'ñ': 'n'
  };

  function escapeHtml (string) {
    return String(string).replace(/[áéíóúñ]/g, function fromEntityMap (s) {
      return entityMap[s];
    });
  }

function busqueda(){
    	anio = $("#search-by-year-bar").val();
	var url = './api/busqueda?general='+general+'&modalidad='+modalidad+
		'&grupoInvestigacion='+grupoInvestigacion+'&mencionHonor='+mencionHonor+
		'&anio='+anio+'&semestre='+periodo+'&tituloAplicado='+tituloAplicado;
	$.ajax({
		url : escapeHtml(url),
		contentType: "application/x-www-form-urlencoded;charset=ISO-8859-9",
		dataType: 'json',
		success : function(data) {
			addTGs(data);
		},
		error : function(data) {
			console.log("Error al recuperar los datos");
		}
	})
}

/*
    Controladores de filtros
*/
function clearAttributes(){
    
    constructor();
    
    $("#period-button").text("Periodo ");
    $("#period-button").append($('<span>',{
      'class':'caret'
    }));
    $("#modality-button").text("Modalidad ");
    $("#modality-button").append($('<span>',{
      'class':'caret'
    }));
    $("#honor-mention-button").text("Mención de honor ");
    $("#honor-mention-button").append($('<span>',{
      'class':'caret'
    }));
    $("#research-group-button").text("Grupo de investigación ");
    $("#research-group-button").append($('<span>',{
      'class':'caret'
    }));
    $("#titulo-aplicado-button").text("Título aplicado ")
    $("#titulo-aplicado-button").append($('<span>',{
      'class':'caret'
    }));
    $("#search-by-year-bar").val("");
    $("#search-bar").val("");
    
    periodo = '';
    codigo = ''
    modalidad = '';
    grupoInvestigacion = '';
    mencionHonor = '';
    tituloAplicado = '';
    anio = '';
    general = '';
}

$(".busqueda-avanzada").hide();
//Botón de búsqueda avanzada
$('#busqueda-avanzada-btn').click(function() {
    $(".busqueda-avanzada").slideToggle();
    stickyThead = encabezado.offset().top;
});

//set modality button
$(".modality-button-item").click(function() {
    modalidad = $(this).text();
    $("#modality-button").text(modalidad+" ");
    $("#modality-button").append($('<span>',{
      'class':'caret',
    }));
});

//set mencion de honor
$(".honor-mention-button-item").click(function() {
    mencionHonor = $(this).text();
    $("#honor-mention-button").text(mencionHonor+" ");
    $("#honor-mention-button").append($('<span>',{
      'class':'caret',
    }));
});

//obtener el periodo
$(".period-button-item").click(function() {
  periodo = $(this).text();
  $("#period-button").text(periodo+" ");
  $("#period-button").append($('<span>',{
      'class':'caret',
    }));
});

// grupo de investigación
$(".research-group-button-item").click(function() {
  grupoInvestigacion = $(this).text();
  $("#research-group-button").text(grupoInvestigacion+" ");
  $("#research-group-button").append($('<span>',{
      'class':'caret',
    }));
});

// titulo aplicado
$(".titulo-aplicado-button-item").click(function() {
  tituloAplicado = $(this).text();
  $("#titulo-aplicado-button").text(tituloAplicado+" ");
  $("#titulo-aplicado-button").append($('<span>',{
      'class':'caret',
    }));
});

$("#clear-button").click(function() {
  clearAttributes();
});

/*
* Botones de busqueda y de limpiar
*/

$("#search-button").click(function() {
    busqueda();
});

$('#search-bar').on('keyup', function () {
    general = $(this).val();
    busqueda();
});


//Controlador boton tabla
$(document).on('click', '.btn-detalles', function(e) {
    $(this).closest('tr').next().find('.detalles-div').slideToggle("slow");
    if($(this).text() == '+'){
        $(this).text('-');
    }else if ($(this).text() == '-') {
        $(this).text('+');
    }
});

/*
    controlador tabla
*/
function addTGs(proyectos){
    $('table.tabla-principal tbody.cuerpo-principal').empty();
    for (var i=0; i<proyectos.length; i++) {
        addTG(proyectos[i].nombre,proyectos[i].autor,proyectos[i].director,
        proyectos[i].codigo, proyectos[i].paginaWeb, proyectos[i].periodoAcademico, proyectos[i].modalidad, 
        proyectos[i].mencionHonor, proyectos[i].tituloAplicado, proyectos[i].grupoInvestigacion);
    }
    $('.detalles-div').hide();
    $('.btn-detalles').text('+');
}

function addTG(nombre, autor, director, codigo, website, periodoAcademico, modalidad, mencionHonor, tituloAplicado, grupoInvestigacion){
    var principal = crearPrimeraFila(nombre, autor, director, codigo, website);
    var detalles = crearFilaDetalles(codigo, periodoAcademico, modalidad, mencionHonor, tituloAplicado, grupoInvestigacion);
    principal.appendTo($('table.tabla-principal tbody.cuerpo-principal'));
    detalles.appendTo($('table.tabla-principal tbody.cuerpo-principal'));
}

function crearFilaDetalles(codigo, periodoAcademico, modalidad, mencionHonor, tituloAplicado, grupoInvestigacion){
   return detalles = $(''+
      '<tr class="detalles">'+
          '<td colspan="4">'+
              '<div class="row detalles-div" style="display: block;">'+
                  '<div class="col-xs-12 col-md-4 primero">'+
                      '<table class="tabla-detalles">'+
                          '<tbody>'+
                              '<tr>'+
                                  '<td class="col-titulo">Código:</td>'+
                                  '<td>'+codigo+'</td>'+
                              '</tr>'+
                              '<tr>'+
                                  '<td class="col-titulo">Periodo Académico:</td>'+
                                  '<td>'+periodoAcademico+'</td></tr>'+
                              '<tr>'+
                                  '<td class="col-titulo">Título aplicado:</td>'+
                                  '<td>'+tituloAplicado+'</td>'+
                              '</tr>'+
                          '</tbody>'+
                      '</table>'+
                  '</div>'+
                  '<div class="col-xs-12 col-md-4 segundo">'+
                      '<table class="tabla-detalles">'+
                          '<tbody>'+
                              '<tr>'+
                                  '<td class="col-titulo">Grupo de investigación:</td>'+
                                  '<td>'+grupoInvestigacion+'</td>'+
                              '</tr>'+
                              '<tr>'+
                                  '<td class="col-titulo">Modalidad:</td>'+
                                  '<td>'+modalidad+'</td>'+
                              '</tr>'+
                              '<tr>'+
                                  '<td class="col-titulo">Mención de honor:</td>'+
                                  '<td>'+mencionHonor+'</td>'+
                              '</tr>'+
                          '</tbody>'+
                      '</table>'+
                  '</div>'+
              '</div>'+
          '</td>'+
      '<td class="website"></td>'+
  '</tr>');   
}

function crearPrimeraFila(nombre, autor, director, codigo, website){
  var website;
  if(website != null && website != ''){
      website = 
        '<a class="btn btn-website" role="button" href="'+website+'">'+
            '<img src="http://pegasus.javeriana.edu.co/static/globe.png" alt="tierra">'+
        '</a>';
  }else{
      website = 
        '<a class="btn btn-website" role="button" disabled="disabled">'+
            '<img>'+
        '</a>';
  }
  return $(''+
    '<tr>'+
      '<td class="nombre" data-th="Nombre: ">'+nombre+'</td>'+
        '<td class="autor" data-th="Autor: ">'+autor+'</td>'+
        '<td class="director" data-th="Director: ">'+director+'</td>'+
        '<td class="website">'+
            website +
        ' </td>'+
        '<td class="detalles">'+
            '<button class="btn-detalles" type="button" name="detalles">+</button>'+
        '</td>'+
    '</tr>');
}
