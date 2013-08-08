$(document).ready(function() {

    if (window.location.pathname != "/") {
        $('#panel').addClass("panel_show", 0);
    }

    $('#panelactivities, #panelme').click(function() {
        $('#panel').toggleClass("panel_show", 400);
    });

    $('#search').keypress(function(e){
    if (e.which == 13){
        $("#search_submit").click();
        }
    });

    $('#button2').click(function() {
        $('#panel').toggle( "blind" );
    });

    $('.login').click(function() {
        $('#modal').hide();
        $('#container').hide();
        $('.log_in').show();
        // $('.block_out').fadeOut(100);
    });

    $('#signuph2').click(function() {
        $('#modal').hide();
        $('#container').hide();
        $('.sign_up').show();
        // $('.block_out').fadeOut(100);
    });

    $('#loginh2').click(function() {
        $('#modal').hide();
        $('#container').hide();
        $('.sign_up').hide();
        // $('.block_out').fadeOut(100);
    });

    $('#close').click(function () {
        $('#modal').hide();
        $('.sign_up').hide();
        $('.block_out').hide();
        $('.log_in').hide();
    });

    $('#closelogin').click(function () {
        $('.log_in').hide();
        $('.block_out').hide();
    });

    $('#closesignup').click(function () {
        $('.sign_up').hide();
        $('.block_out').hide();
    });

    $('.signup').click(function() {
        $('#modal').hide();
        $('#container').hide();
        $('.sign_up').show();
        // $('.block_out').fadeOut(100);
    });
});