$(document).ready(function () {

    if (window.location.pathname != "/" ) { $('#panel').addClass("panel_show", 0 ) };

    $('#panelactivities, #panelme').click(function () {
        $('#panel').toggleClass("panel_show", 400 );
    });


    $('#panelsearch').keypress(function(e){
    if (e.which == 13){
        $("#search_submit").click();
        }
    });

});