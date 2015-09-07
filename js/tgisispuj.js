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
  if( year != null && period !=null)
    array.push(year+"-"+period);
  else if (year == null && period == null) {
    array.push(null);
  }else if (year == null) {
    array.push("-"+period);
  }else if (period == null) {
      array.push(year+"-");
  }
  array.push(researchGroup);
  array.push(code);
  array.push(modality);
  array.push(honorMention);
  return array;
}

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

function evalRow( row, searchFor ){
  console.log(row);
  console.log(searchFor);
  for( var i=0; i<searchFor.length; i++ ){
    if( searchFor[i] != null ){
      if( row[i+3] == null )
        return false;
      row[i+3] = row[i+3].toLowerCase();
      console.log("if("+searchFor[i]+"=="+row[i+3]+ ")");
      if( row[i+3].indexOf(searchFor[i].toLowerCase()) < 0 )
        return false;
    }
  }
  return true;
}

// search button
var splitted;
$("#search-button").click(function() {
  $.each($(".item"), function() {
    splitted = $(this).text().split("\n" , -1)
    splitted = deleteEmpty( splitted );
    if( !evalRow( splitted, attributesToArray() ) ){
      $(this).hide();
    }else{
      $(this).show();
    }
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
    $.each($(".item"), function() {
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
