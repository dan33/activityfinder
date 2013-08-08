$(document).ready(function() {

    if (window.location.pathname != "/") {
        $('#panel').addClass("panel_show", 0);
    }

    $('#loginbutt').hide();
    $('#signupbutt').hide();

    $('#panelactivities, #panelme').click(function() {
        $('#panel').toggleClass("panel_show", 400);
    });

    $('#search').keypress(function(e){
    if (e.which == 13){
        $("#search_submit").click();
        }
    });

    $('#button2').click(function() {
        $('#panel').css({'width': '299px', 'overflow-y': 'hidden'});
        $('#panel').toggle( "blind", 600, function () {
            $('#panel').css({'width': '293', 'overflow-y': 'auto'});
        });
    });

    $('.login').click(function() {
        $('#modal').hide();
        $('#container').hide();
        $('.log_in').show();
        $('#signupbutt').hide();
        $('#loginbutt').hide();
        // $('.block_out').fadeOut(100);
    });

    $('#signuph2').click(function() {
        $('#modal').hide();
        $('#container').hide();
        $('.sign_up').show();
        $('#signupbutt').hide();
        $('#loginbutt').hide();
        // $('.block_out').fadeOut(100);
    });

    $('#loginh2').click(function() {
        $('#modal').hide();
        $('#container').hide();
        $('.sign_up').hide();
        $('#signupbutt').show();
        $('#loginbutt').show();
        // $('.block_out').fadeOut(100);
    });

    $('#close').click(function () {
        $('#modal').hide();
        $('.sign_up').hide();
        $('.block_out').hide();
        $('.log_in').hide();
        $('#loginbutt').show();
        $('#signupbutt').show();
    });

    $('#closelogin').click(function () {
        $('.log_in').hide();
        $('.sign_up').hide();
        $('.block_out').hide();
        $('#loginbutt').show();
        $('#signupbutt').show();
    });

    $('#closesignup').click(function () {
        $('.sign_up').hide();
        $('.log_in').hide();
        $('.block_out').hide();
        $('#loginbutt').show();
        $('#signupbutt').show();
    });

    $('.signup').click(function() {
        $('#modal').hide();
        $('#container').hide();
        $('.sign_up').show();
        // $('.block_out').fadeOut(100);
    });

    $('#signupbutt').click(function () {
        $('.block_out').show();
        $('.sign_up').show();
        $('#signupbutt').hide();
        $('#loginbutt').hide();
    });

    $('#loginbutt').click(function () {
        $('.block_out').show();
        $('.log_in').show();
        $('#signupbutt').hide();
        $('#loginbutt').hide();
    });
































});