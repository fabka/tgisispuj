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
			addProyectos(data);
		},
		error : function(data) {
			console.log("Error al recuperar los datos");
		}
	})
}

function busqueda(){
    anio = $("#search-by-year-bar").val();
    var url = './api/busqueda?general='+general+'&modalidad='+modalidad+'&grupoInvestigacion='+grupoInvestigacion+'&mencionHonor='+mencionHonor+'&anio='+anio+'&semestre='
		    +periodo+'&tituloAplicado='+tituloAplicado;
    $.ajax({
		url : url,
		success : function(data) {
			addProyectos(data);
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
function addProyectos(proyectos){
    $('table.tabla-principal tbody.cuerpo-principal').empty();
    for (var i=0; i<proyectos.length; i++) {
        addProyecto(proyectos[i].nombre,proyectos[i].autor,proyectos[i].director,
        proyectos[i].codigo, proyectos[i].paginaWeb, proyectos[i].periodoAcademico, proyectos[i].modalidad, 
        proyectos[i].mencionHonor, proyectos[i].tituloAplicado, proyectos[i].grupoInvestigacion);
    }
    $('.detalles-div').hide();
    $('.btn-detalles').text('+');
}

function addProyecto(nombre, autor, director, codigo, website, periodoAcademico, modalidad, mencionHonor, tituloAplicado, grupoInvestigacion){
    var principal = crearPrimeraFila(nombre, autor, director, codigo, website);
    var detalles = crearFilaDetalles(codigo, periodoAcademico, modalidad, mencionHonor, tituloAplicado, grupoInvestigacion);
    principal.appendTo($('table.tabla-principal tbody.cuerpo-principal'));
    detalles.appendTo($('table.tabla-principal tbody.cuerpo-principal'));
}

function crearFilaDetalles(codigo, periodoAcademico, modalidad, mencionHonor, tituloAplicado, grupoInvestigacion){
   var detalles_tr;
   var tr_1,tr_2,tr_3,tr_4,tr_5,tr_6;
   var td_11, td_12,td_21,td_22,td_31,td_32,td_41,td_42,td_51,td_52,td_61,td_62;
   var table_1, table_2;
   var div_1, div_21, div_22;
   var td_main;
   
   /**
    * Tabla 1
    */
   td_11 = $('<td>',{
     'class':'col-titulo',
     text:'Código:'
   });
   td_12 = $('<td>',{
     text:codigo
   });
   tr_1 = $('<tr>');
   tr_1.append(td_11);
   tr_1.append(td_12);
   
   td_21 = $('<td>',{
     'class':'col-titulo',
     text:'Periodo Académico:'
   });
   td_22 = $('<td>',{
     text:periodoAcademico
   });
   tr_2 = $('<tr>');
   tr_2.append(td_21);
   tr_2.append(td_22);
   
   td_31 = $('<td>',{
     'class':'col-titulo',
     text:'Título aplicado:'
   });
   td_32 = $('<td>',{
     text:tituloAplicado
   });
   tr_3 = $('<tr>');
   tr_3.append(td_31);
   tr_3.append(td_32);
   
   table_1 = $('<table>',{
     'class':'tabla-detalles'
   });
   table_1.append(tr_1);
   table_1.append(tr_2);
   table_1.append(tr_3);
   
   div_21 = $('<div>',{
     'class':'col-xs-12 col-md-4 primero'
   });
   div_21.append(table_1);
   
   /**
    * tabla 2
    */
   td_41 = $('<td>',{
     'class':'col-titulo',
     text:'Grupo de investigación:'
   });
   td_42 = $('<td>',{
     text:grupoInvestigacion
   });
   tr_4 = $('<tr>');
   tr_4.append(td_41);
   tr_4.append(td_42);
   
   td_51 = $('<td>',{
     'class':'col-titulo',
     text:'Modalidad:'
   });
   td_52 = $('<td>',{
     text:modalidad
   });
   tr_5 = $('<tr>');
   tr_5.append(td_51);
   tr_5.append(td_52);
   
   td_61 = $('<td>',{
     'class':'col-titulo',
     text:'Mención de honor:'
   });
   td_62 = $('<td>',{
     text:mencionHonor
   });
   tr_6 = $('<tr>');
   tr_6.append(td_61);
   tr_6.append(td_62);
   
   table_2 = $('<table>',{
     'class':'tabla-detalles'
   });
   table_2.append(tr_4);
   table_2.append(tr_5);
   table_2.append(tr_6);
   
   div_22 = $('<div>',{
     'class':'col-xs-12 col-md-4 segundo'
   });
   div_22.append(table_2);
   
   //divs
   div_1 = $('<div>',{
     'class':'row detalles-div'
   });
   div_1.append(div_21);
   div_1.append(div_22);
   td_main = $('<td>',{
     'colspan':'4'
   });
   td_main.append(div_1);
   detalles_tr = $('<tr>',{
     'class':'detalles'
   });
   detalles_tr.append(td_main);
   detalles_tr.append($('<td>',{
       'class':'website'
   }));
   return detalles_tr;
}

function crearPrimeraFila(nombre, autor, director, codigo, website){
  var website_boton, website_img, detalles_boton, paginaWeb, principal, detalles, nombre_td, detalles_td;
    //nombre
    nombre_td = $('<td>', {
      'class': 'nombre',
      'data-th': 'Nombre: ',
      'text': nombre
    });
    
    //autor
    autor = $('<td>', {
      class: 'autor',
      'data-th': 'Autor: ',
      text: autor
    });
    
    //director
    director = $('<td>', {
      'class': 'director',
      'data-th': 'Director: ',
      'text': director
    });
    
    //website
    if (codigo != null || codigo == ''){
    website_img = $('<img/>',{
        'src': static_url+"globe.png",
        'alt': "tierra"
    });
    website_boton = $('<a>',{
        'class': 'btn btn-website',
        'role': 'button',
        'href' : website
    });
      website_boton.append(website_img);
    }else{
        if( website == null || website == ''){
            website_img = $('<img/>',{
             });
            website_boton = $('<a>',{
                'class': 'btn btn-website',
                'role': 'button',
                'disabled':'true'
            });
        }else{
            website_img = $('<img/>',{
                'src': static_url+"globe.png",
                'alt': "tierra"
            });
            website_boton = $('<a>',{
                'class': 'btn btn-website',
                'role': 'button',
                'href' : website
            });
        }
        website_boton.append(website_img);
    }
    paginaWeb = $('<td>',{
      'class': 'website'
    });
    paginaWeb.append(website_boton);
    
    //detalles
    detalles_boton = $('<button>',{
        'class': 'btn-detalles',
        'type': 'button',
        'name': 'detalles',
        'text': '+'
    });
    detalles_td = $('<td>',{
      'class': 'detalles'
    });
    detalles_td.append(detalles_boton);
    
    principal = $('<tr>');
    principal.append(nombre_td);
    principal.append(autor);
    principal.append(director);
    principal.append(paginaWeb);
    principal.append(detalles_td);
    return principal;
}
