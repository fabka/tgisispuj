var period = null;
var code = null;
var modality = null;
var researchGroup = null;
var honorMention = null;
var year = null;
var general = null;
var regex = null;

function clearAttributes(){
  $("#period-button").text("Periodo");
  $("#modality-button").text("Modalidad");
  $("#honor-mention-button").text("Mención de honor");
  $("#research-group-button").text("Grupo de investigación");
  $("#search-by-year-bar").val("");
  $("#search-bar").val("");
}

function colectAttributes(){
  period = $("#period-button").text();
  modality = $("#modality-button").text();
  honorMention = $("#honor-mention-button").text();
  researchGroup = $("#research-group-button").text();
  year = $("#search-by-year-bar").val();
  general = $("#search-bar").val();

  fixAttributes();
}

function fixAttributes(){
  if( period.indexOf("Periodo") > -1 )
    period = null;
  if( modality.indexOf("Modalidad") > -1 )
    modality = null;
  if( honorMention.indexOf("Mención de honor") > -1 )
    honorMention = null;
  if( researchGroup.indexOf("Grupo de investigación") > -1 )
    researchGroup = null;
  if( year == "" )
    year = null;
}

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

//get regular expression
function getRegex(){
  colectAttributes();
  var regex = "";

  if( modality != null )
    regex += "(\\b"+modality+"\\b).*[\\s\\S]*";
  if( researchGroup != null )
    regex += "(\\b"+researchGroup+"\\b).*[\\s\\S]*";
  if( honorMention != null )
    regex += "(\\b"+honorMention+"\\b).*[\\s\\S]*";
  if( year != null )
    regex += "(\\b"+year+"\\b).*[\\s\\S]*";
  if( period != null )
    regex += "(\\b"+period+"\\b).*[\\s\\S]*";
  return regex;
}

function attributesToArray(){
  colectAttributes();
  var array = [];
  array.push(modality);
  array.push(honorMention);
  array.push(code);
  array.push(researchGroup);
  array.push(period);
  array.push(year);
  return array;
}

function arrayToString( array ){
  var cadena  = "";
  console.log(array.length);
  for( var i=0; i<array.length; i++ ){
    console.log("i:"+i+" "+array[i]);
    if( array[i] != null ){
      cadena += array[i];
    }
  }
  return cadena;
}

function evalRow( cadena ){
  var array = attributesToArray();
  for( var i=0; i<array.length; i++ ){
    if( array[i] != null )
      if( cadena.indexOf(array[i]) < 0 )
        return false;
  }
  return true;
}

// search button
var splitted;
$("#search-button").click(function() {
  var splittedString;
  $.each($(".cuerpo"), function() {
    splitted = $(this).text().split("\n" , -1)
    splitted = deleteEmpty( splitted );
    splittedString = arrayToString( splitted );
    if( !evalRow( splittedString ) )
      $(this).hide();
  });
});

//clean button
$("#clear-button").click(function() {
  clearAttributes();
});


$(".advanced-search").hide();
//Botón de búsqueda avanzada
$("#advanced-search-button").click(function() {
  $(".advanced-search").slideToggle("slow");
});

//Búsquda general
$("#search-bar").keyup(function(){
    _this = this;
    // Show only matching TR, hide rest of them
    $.each($("#table tbody").find("tr"), function() {
        if($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) == -1)
           $(this).hide();
        else
           $(this).show();
    });
});

$(".cabeza .secondary").hide();
//Mostrar ocultar información secundaria
$(".cabeza").click(function() {
  $(this).find(".secondary").slideToggle();
});

$(".item .secondary").hide();
//Mostrar ocultar información secundaria
$(".item").click(function() {
  $(this).find(".secondary").slideToggle();
});

function deleteEmpty( array ) {
  for (var i = 0; i < array.length; i++) {
    array[i] = array[i].replace(/ /g,"");
    if (array[i] == " " || array[i] == "") {
      array.splice(i, 1);
      i--;
    }
  }
  return array;
}
