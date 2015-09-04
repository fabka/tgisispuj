var period = null;
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

// search button
$("#search-button").click(function() {
  regex  = getRegex();
    $.each($("#table tbody").find("tr"), function() {
      var regularExp = new RegExp( regex );
      var arrow = $(this).text();
      if( regularExp.test( arrow ) ){
        $(this).show();
      }else{
        $(this).hide();
      }
  });
});

//clean button
$("#clear-button").click(function() {
  clearAttributes();
});
