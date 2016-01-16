var period = null;
var code = null;
var modality = null;
var researchGroup = null;
var honorMention = null;
var year = null;
var general = null;
var regex = null;

$('.row').hide();
$(".btn-detalles").click(function() {
    $(this).closest('tr').next().find('.row').slideToggle("slow");
    if($(this).text() == '+'){
        $(this).text('-');
    }else if ($(this).text() == '-') {
        $(this).text('+');
    }
});

$(".busqueda-avanzada").hide();
//Botón de búsqueda avanzada
$('#busqueda-avanzada-btn').click(function() {
    $(".busqueda-avanzada").slideToggle();
});
