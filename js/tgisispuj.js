//search-bar
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

//Search by year
$("#search-bar").keyup(function(){
    _this = this;
    // Show only matching TR, hide rest of them
    $.each($("#table tbody").find("tr"), function() {
        if( $(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) == -1)
           $(this).hide();
        else
           $(this).show();
    });
});
