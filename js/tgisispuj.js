var period = null;
var researchGroup = null;
var honorMention = null;
var year = null;
var txt = null;
var regex_str = null;

//Regex test
/*
$("#search-button").click(function() {
  regex_str = "";
  year = $('#search-by-year-bar').val();
  txt = $('#search-bar').val();

  if(period != null)
    regex_str += '(.*\\b'+period+'\\b)';
  if(researchGroup != null)
    regex_str += '(.*\\b'+researchGroup+'\\b)';
  if(honorMention != null)
    regex_str += '(.*\\b'+honorMention+'\\b)';
  if(year != '' )
    regex_str += '(.*\\b'+year+'\\b)';
  if(txt != '')
    regex_str += '(.*\\b'+txt+'\\b)';

  var regex = RegExp(regex_str,"i");
  $.each($("#table tbody").find("tr"), function() {
    console
    if ( regex.test( $(this).text() ) ){
      console.log("(true) regex = " + regex_str);
      console.log("(true) $(this).text() = " + $(this).text());
    }else{
      console.log("(false) regex = " + regex_str);
      console.log("(false) $(this).text() = " + $(this).text());
    }

  });
});
*/


function search(str, clase){
  $.each($("#table tbody").find("tr").find(clase), function() {
      console.log($(this).text());
      if($(this).text().toLowerCase().indexOf(str.toLowerCase()) == -1)
         $(this).parent().hide();
      else
         $(this).parent().show();
  });
}


//get research group
$(".research-group-button").click(function() {
    researchGroup = $(this).text();
    if( researchGroup == "Sin filtro" )
      researchGroup = "";
    search( researchGroup, ".research-group");
});

//get honor mention
$(".honor-mention-button").click(function() {
    honorMention = $(this).text();
    if( honorMention == "Sin filtro" )
      honorMention = "";
    search( honorMention, ".honor-mention" );
});

//get period
$(".period-button").click(function() {
    period = $(this).text();
    if( period == "Sin filtro" )
      period = "";
    search( period, ".period" );
});


//Search by year
$("#search-by-year-bar").keyup(function(){
    _this = this;
    // Show only matching TR, hide rest of them
    $.each($("#table tbody").find("tr").find(".year"), function() {
      console.log("$(this).text() = " + $(this).text());
      _thisval = $(_this).val();
      console.log("$(_this).val() = " + $(_this).val());
      if($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) == -1)
         $(this).parent().hide();
      else
         $(this).parent().show();
    });
});

//General  search
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
