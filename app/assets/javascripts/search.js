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
      var latlong = data.latlong;
      var activities = data.activities;
      debugger;
      console.log(latlong);
      $('#map_float').empty();
      $('#map_float').append('<div id="map"/>');
      var map = L.map('map', {
        center: new L.LatLng(latlong[0], latlong[1]),
        zoom: 10,
        // layers: [cities]
      });

      L.marker(latlong).addTo(map)
        .bindPopup('A pretty CSS3 popup. <br> Easily customizable.')
        .openPopup();

      L.marker([-33.6451568, 151.2849679]).addTo(map).bindPopup('This is Church Point, CO.');

      var calculate_map_tiles = function() {
        n = 2 ^ zoom;
        x = ((latlong[0] + 180) / 360) * n;
        y = (1 - (ln(tan(latlong[1]) + sec(latlong[1])) / Pi)) / 2 * n;
      };

      L.tileLayer('http://{s}.tile.cloudmade.com/979aecf591d149b3a4d1e9dabdd52998/997/256/{z}/{x}/{y}.png', {
        attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>'
      }).addTo(map);
    });
  });
});