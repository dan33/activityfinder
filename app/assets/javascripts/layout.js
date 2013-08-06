$(document).ready(function () {

    $('#panelactivities, #panelme').click(function () {
        $('#panel').toggleClass("panel_show");
    });

    $(document).keypress(function(e){
    if (e.which == 13){
        $("#search_submit").click();
    }
});

});