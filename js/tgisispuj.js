var period = null;
var modality = null;
var researchGroup = null;
var honorMention = null;
var year = null;
var general = null;
var regex_str = null;

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

// search button
$("#search-button").click(function() {

  //Recolectar datos
  colectAttributes();
  var i = 0;
  $.each($("#table tbody").find("tr"), function() {
    var arr = new Array();
    $( "td" ).each(function() {
      arr.push( $(this).text() );
    });
    console.log( arr );
  });
});

/*
//Regex test

$("#search-button").click(function() {
  regex_str = "^";
  year = $('#search-by-year-bar').val();
  general = $('#search-bar').val();

  if(modality != null)
    regex_str += '(?=.*\\b'+modality+'\\b)';
  if(researchGroup != null)
    regex_str += '(?=.*\\b'+researchGroup+'\\b)';
  if(honorMention != null)
    regex_str += '(?=.*\\b'+honorMention+'\\b)';
  if(year != '' )
    regex_str += '(?=.*\\b'+year+'\\b)';
  if(period != null)
    regex_str += '(?=.*\\b'+period+'\\b)';
  regex_str += '.*$';

  var this_text;
  console.log(regex_str);
  $.each($("#table tbody").find("tr"), function() {
    this_text = $(this).text();
    this_text.replace(/\n/gi, "hola");
    if ( this_text.match( regex_str ) ){
      //console.log("(true) regex = " + regex_str);
      //console.log("(true) this_text = " + this_text);
    }else{
      //console.log("(false) regex = " + regex_str);
      //console.log("(false) $(this).text() = " + this_text);
    }

  });
});


//General  search
$("#search-bar").keyup(function(){
    _this = this;
    // Show only matching TR, hide rest of them
    $.each($("#table tbody").find("tr"), function() {
      console.log($(this).text());
      if($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) == -1)
         $(this).hide();
      else
         $(this).show();
    });
});

//get research group
$(".research-group-button").click(function() {
    researchGroup = $(this).text();
    if( researchGroup == "Sin filtro" )
      researchGroup = "";
    //search( researchGroup, ".research-group");
});

//get honor mention
$(".honor-mention-button").click(function() {
    honorMention = $(this).text();
    if( honorMention == "Sin filtro" ){
      honorMention = "";
      //search( honorMention, ".honor-mention" );
    }else{

      if( honorMention == "No" )
        clase = ".glyphicon-remove";
      else
        clase = ".glyphicon-ok";

      console.log(honorMention + " " + clase);
      $.each($("#table tbody").find("tr").find(".honor-mention").find("p").find(clase), function() {

           if( !$(this).hasClass(clase) ){
              console.log(   $(this).closest(".honor-mention") );
              $(this).closest(".honor-mention").hide();
          }else
              $(this).closest(".honor-mention").show();

      });
    }
});


//Search by year
$("#search-by-year-bar").keyup(function(){
    _this = this;
    // Show only matching TR, hide rest of them
    $.each($("#table tbody").find("tr").find(".year"), function() {
      if($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) == -1)
         $(this).parent().hide();
      else
         $(this).parent().show();
    });
});
*/
