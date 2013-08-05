$(document).ready(function() {


  $.ajax({
    dataType: 'json',
    type: 'GET',
    url: '/activities/',
  }).done(function(data) {
    var layers = [];
      var pins = [];

    var process_category = function (c) {
      pins = [];
      _.each(c.activities, process_pin);
      layers.push({
        id: c.id,
        title: c.title,
        layer: L.layerGroup(pins)
      });
    }

     var process_pin = function(activity) {
      var pin = L.marker([activity.latitude, activity.longitude]).bindPopup('<h3>' + activity.title + '</h3>' + '<br>' + activity.description);
      pins.push(pin);
  };

  _.each(data, process_category);
  // debugger;


    var map = L.map('map', {
    center: new L.LatLng(-33.8674869, 151.2069902),
    zoom: 10,
    layers: [layers[0].layer,layers[1].layer,layers[2].layer]
    });

      // var z = 13;
    var calculate_map_tiles = function() {
    n = 2 ^ zoom;
    x = ((-0.09 + 180) / 360) * n;
    y = (1 - (ln(tan(51.505) + sec(51.505)) / Pi)) / 2 * n;
  };
    L.tileLayer('http://{s}.tile.cloudmade.com/979aecf591d149b3a4d1e9dabdd52998/997/256/{z}/{x}/{y}.png', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>'
  }).addTo(map);
  });


  // show_form);

});