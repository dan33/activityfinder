$(document).ready(function() {
 $('#search_submit').click(function() {
  var search_result = $('#search_field').val();
  $.ajax({
   dataType: 'json',
   data: {
    'address': search_result
   },
   type: 'POST',
   url: '/search/',
  }).done(function(data) {
   latlong = data;
   console.log(data);
  });
 });
});