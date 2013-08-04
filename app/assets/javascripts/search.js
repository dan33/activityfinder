$(document).ready(function () {
 $('#search_submit').click(function () {
  var search_result = $('#search_field').val();
  debugger;
  $.ajax({
   dataType: 'json',
   type: 'POST',
   url: '/search/',
  }).done(function () {
   console.log(search_result);
  });
 });
});