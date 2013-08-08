$(document).ready(function() {

 // if (window.location.pathname == "/") {
 //  $('#panel').addClass("panel_show", 0);
 // } else {

  // This changes the state of the buttons to Hide Activity when not on the root path

 //  $('#button2').empty();
 //  $('#button2').append('<p>HIDE ACTIVITY</p>');
 // }

 // Think the following code works better than above.  Need to work on this...

 if (window.location.pathname != "/") {
  $('#button2').empty();
  $('#button2').append('<p>HIDE ACTIVITY</p>');
 }

 // On document load, hide all but the modal and the black opaque background

 $('#loginbutt').hide();
 $('#signupbutt').hide();
 $('#user_nav').hide();

 // Don't see the need for the following code

 // $('#panelactivities, #panelme').click(function() {
 //  $('#panel').toggleClass("panel_show", 400);
 // });

 // Adds key bindings to the forms..

 $('#search').keypress(function(e) {
  if (e.which == 13) {
   // If enter is clicked (and you are focussed on the search form), run the search function
   $("#search_submit").click();
  }
 });

 // Defines what to hide and show when particular things are clicked

 $('#button1').click(function() {
  $('.block_out').removeClass('hidden');
  $('.block_out').show();
  $('.new_activity').removeClass('hidden');
  $('.new_activity').show();
  $('#container').hide();
  $('.leaflet-top').hide();
  $('#search').hide();
  $('#panel').hide();
 });

 // The following is the button protocol based on the pathname

 $('#button2').click(function() {
  if (window.location.pathname != "/") {
   var text = $.trim($('#button2').text());

   // Runs in cycles between show activity and hide activity (this isn't on the homepage)

   if (text == "SHOW ACTIVITY") {
    $('#button2').empty();
    $('#button2').append('<p>HIDE ACTIVITY</p>');
   } else {
    $('#button2').empty();
    $('#button2').append('<p>SHOW ACTIVITY</p>');
   }
  } else {

   // Runs in cycles between show profile and hide profile (this is on the homepage)

   var text2 = $.trim($('#button2').text());
   if (text2 == "SHOW PROFILE") {
    $('#button2').empty();
    $('#button2').append('<p>HIDE PROFILE</p>');
   } else {
    $('#button2').empty();
    $('#button2').append('<p>SHOW PROFILE</p>');
   }
  }

  // The following compensates for the adding of the border from the Jquery UI library

  $('#panel').css({

   // Make the border unnoticable and hide the vertical scrollbar

   'width': '299px',
   'overflow-y': 'hidden'
  });

  $('#panel').toggle("blind", 600, function() {
   $('#panel').css({

    // Revert back to the appropriate width, add auto scrolling on the vertical axis, and get rid of the horizontal scrollbar

    'width': '293',
    'overflow-y': 'auto',
    'overflow-x': 'hidden'
   });
  });
 });

 // Defines what to hide and show when particular things are clicked

 $('.login').click(function() {
  $('#modal').hide();
  $('#container').hide();
  $('.log_in').show();
  $('#signupbutt').hide();
  $('#loginbutt').hide();
  $('#container').hide();
  $('.leaflet-top').hide();
  $('#search').hide();
  $('#panel').hide();
 });

 // Defines what to hide and show when particular things are clicked

 $('#signuph2').click(function() {
  $('#modal').hide();
  $('#container').hide();
  $('.sign_up').show();
  $('#signupbutt').hide();
  $('#loginbutt').hide();
  $('#container').hide();
  $('.leaflet-top').hide();
  $('#search').hide();
  $('#panel').hide();
 });

 // Defines what to hide and show when particular things are clicked

 $('#loginh2').click(function() {
  $('#modal').hide();
  $('#container').hide();
  $('.sign_up').hide();
  $('#signupbutt').show();
  $('#loginbutt').show();
  $('#container').hide();
  $('.leaflet-top').hide();
  $('#search').hide();
  $('#panel').hide();
 });

 // Defines what to hide and show when particular things are clicked

 $('#close').click(function() {
  $('#modal').hide();
  $('.sign_up').hide();
  $('.block_out').hide();
  $('.log_in').hide();
  $('#loginbutt').show();
  $('#signupbutt').show();
  $('.new_activity').hide();
  $('#container').show();
  $('.leaflet-top').show();
  $('#search').show();
  $('#panel').hide();
  if (window.location.pathname != "/") {

   // If you aren't on the root page (Home#index), change the writing in buttons to be appropriate for Activities show

   $('#button2').empty();
   $('#button2').append('<p>SHOW ACTIVITY</p>');
  } else {

   // Otherwise make it appropriate for the Profile view (home#index)

   $('#button2').empty();
   $('#button2').append('<p>SHOW PROFILE</p>');
  }
 });

 // Defines what to hide and show when particular things are clicked

 $('#closelogin').click(function() {
  $('.log_in').hide();
  $('.sign_up').hide();
  $('.block_out').hide();
  $('#loginbutt').show();
  $('#signupbutt').show();
  $('#container').show();
  $('.leaflet-top').show();
  $('#search').show();
  $('#panel').show();
 });

 // Defines what to hide and show when particular things are clicked

 $('#closesignup').click(function() {
  $('.sign_up').hide();
  $('.log_in').hide();
  $('.block_out').hide();
  $('#loginbutt').show();
  $('#signupbutt').show();
  $('#container').show();
  $('.leaflet-top').show();
  $('#search').show();
  $('#panel').show();
  $('.edit_user_button').hide();
 });

 // Defines what to hide and show when particular things are clicked

 $('.signup').click(function() {
  $('#modal').hide();
  $('#container').hide();
  $('.sign_up').show();
 });

 // Defines what to hide and show when particular things are clicked

 $('#signupbutt').click(function() {
  $('.block_out').show();
  $('.sign_up').show();
  $('#signupbutt').hide();
  $('#loginbutt').hide();
 });

 // Defines what to hide and show when particular things are clicked

 $('#loginbutt').click(function() {
  $('.block_out').show();
  $('.log_in').show();
  $('#signupbutt').hide();
  $('#loginbutt').hide();
 });

 // Defines what to hide and show when particular things are clicked

 $('.edit_user').click(function() {
  $('.block_out').show();
  $('.edit_user_button').show();
 });

});