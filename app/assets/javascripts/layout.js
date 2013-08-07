$(document).ready(function() {

    if (window.location.pathname != "/") {
        $('#panel').addClass("panel_show", 0);
    }

    $('#panelactivities, #panelme').click(function() {
        $('#panel').toggleClass("panel_show", 400);
    });

    $('#panelsearch').keypress(function(e) {
        if (e.which == 13) {
            $("#search_submit").click();
        }
    });

    $('leaflet-control-layers').addClass("leaflet-control-layers-expanded");

    $('.login').click(function() {
        $('#modal').hide();
        $('.log_in').show();
        // $('.block_out').fadeOut(100);
    });

    $('.signup').click(function() {
        $('#modal').hide();
        $('.sign_up').show();
        // $('.block_out').fadeOut(100);
    });
});