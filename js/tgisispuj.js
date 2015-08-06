var period = null;
var researchGroup = null;
var honorMention = null;

function search(str, clase){
  $.each($("#table tbody").find("tr").find(clase), function() {
      console.log($(this).text());
      if($(this).text().toLowerCase().indexOf(str.toLowerCase()) == -1)
         $(this).parent().hide();
      else
         $(this).parent().show();
  });
}

//search by research group
$(".research-group-button").click(function() {
    researchGroup = $(this).text();
    if( researchGroup == "Sin filtro" )
      researchGroup = "";
    search( researchGroup, ".research-group");
});

//search by honor mention
$(".honor-mention-button").click(function() {
    honorMention = $(this).text();
    if( honorMention == "Sin filtro" )
      honorMention = "";
    search( honorMention, ".honor-mention" );
});

//search by period
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
