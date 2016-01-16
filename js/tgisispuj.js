var period = null;
var code = null;
var modality = null;
var researchGroup = null;
var honorMention = null;
var year = null;
var general = null;
var regex = null;

$('.detalles-div').hide();
$(".btn-detalles").click(function() {
    $(this).closest('tr').next().find('.detalles-div').slideToggle("slow");
    if($(this).text() == '+'){
        $(this).text('-');
    }else if ($(this).text() == '-') {
        $(this).text('+');
    }
});

function clearAttributes(){
  $("#period-button").text("Periodo");
  $("#modality-button").text("Modalidad");
  $("#honor-mention-button").text("Mención de honor");
  $("#research-group-button").text("Grupo de investigación");
  $("#search-by-year-bar").val("");
  $("#search-bar").val("");
}

$(".busqueda-avanzada").hide();
//Botón de búsqueda avanzada
$('#busqueda-avanzada-btn').click(function() {
    $(".busqueda-avanzada").slideToggle();
});

//set modality button
$(".modality-button-item").click(function() {
    var str = $(this).text();
    $("#modality-button").text(str);
});

//set mencion de honor
$(".honor-mention-button-item").click(function() {
  var str = $(this).text();
  $("#honor-mention-button").text(str);
});

//get period
$(".period-button-item").click(function() {
  var str = $(this).text();
  $("#period-button").text(str);
});

//get research group
$(".research-group-button-item").click(function() {
  var str = $(this).text();
  $("#research-group-button").text(str);
});

$("#clear-button").click(function() {
  clearAttributes();
});
