$(document).ready(function() {
  var process_activities = function(a) {
    _.each(a, function(a) {
      L.marker([a.latitude, a.longitude]).addTo(map)
        .bindPopup('<h3>' + a.title + '</h3>' + '<br>' + a.description);
    });
  };

  $.ajax({
    dataType: 'json',
    type: 'GET',
    url: '/activities/',
  }).done(function(activities) {
    debugger;
    var relaxation_layer = L.layerGroup(process_activities([activities.relaxation]));
    var nightlife_layer = L.layerGroup(process_activities([activities.nightlife]));
    var exercise_layer = L.layerGroup(process_activities([activities.exercise]));
  });

  // var relaxation = L.marker([39.61, -105.02]).bindPopup('This is Littleton, CO.');
  // var exercise = L.marker([39.74, -104.99]).bindPopup('This is Denver, CO.');
  // var nightlife = L.marker([39.73, -104.8]).bindPopup('This is Aurora, CO.');
  // var relaxation_layer = L.layerGroup(process_activities(relaxation));

  var z = 13;
  var calculate_map_tiles = function() {
    n = 2 ^ zoom;
    x = ((-0.09 + 180) / 360) * n;
    y = (1 - (ln(tan(51.505) + sec(51.505)) / Pi)) / 2 * n;
  };

  var map = L.map('map', {
    center: new L.LatLng(-33.8674869, 151.2069902),
    zoom: 10,
    layers: [relaxation_layer, exercise_layer, nightlife_layer]
  });

    L.tileLayer('http://{s}.tile.cloudmade.com/979aecf591d149b3a4d1e9dabdd52998/997/256/{z}/{x}/{y}.png', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>'
  }).addTo(map);
});