$(document).ready(function() {

  $.ajax({
    dataType: 'json',
    type: 'GET',
    url: '/activities/',
  }).done(function(data) {
    var layers = [];
    window.all_pins = [];
    var process_category = function(c) {
      var pins = _.map(c.activities, function(pin) {
        pin.image = c.image;
        return process_pin(pin);
      });

      layers.push({
        id: c.id,
        title: c.title,
        layer: L.layerGroup(pins)
      });
    };

    var process_pin = function(activity) {
      var greenIcon = L.icon({
        iconUrl: activity.image,
        shadowUrl: '/assets/shadow.png',
        iconSize:     [27, 45], // size of the icon
        shadowSize:   [26, 23], // size of the shadow
        iconAnchor:   [22, 94], // point of the icon which will correspond to marker's location
        shadowAnchor: [10, 68],  // the same for the shadow
        popupAnchor:  [-3, -76] // point from which the popup should open relative to the iconAnchor
      });
      var pin = L.marker([activity.latitude, activity.longitude], {icon: greenIcon }).bindPopup('<h3>' + activity.title + '</h3>' + '<br>' + activity.description);
      all_pins.push(pin);
      return pin;
    };

    _.each(data, process_category);

    var layer_objects = _.map(layers, function(layer) {
      return layer.layer;
    });


    var map = L.map('map', {
      center: new L.LatLng(-33.8674869, 151.2069902),
      zoom: 10,
      layers: layer_objects
    });

    // var z = 13;
    var calculate_map_tiles = function() {
      n = 2 ^ zoom;
      x = ((-0.09 + 180) / 360) * n;
      y = (1 - (ln(tan(51.505) + sec(51.505)) / Pi)) / 2 * n;
    };

    L.tileLayer('http://{s}.tile.cloudmade.com/979aecf591d149b3a4d1e9dabdd52998/34243/256/{z}/{x}/{y}.png', {
      attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>'
    }).addTo(map);


    var layercake = {};
    _.each(layers, function(layer) {
      layercake[layer.title] = layer.layer;
    });
    L.control.layers({}, layercake, {collapsed: false}).addTo(map);
  });

  $('button').click(function() {
    $(this).parent().find('.reply_form').toggleClass('hidden');
  });
});