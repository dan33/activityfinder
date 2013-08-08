$(document).ready(function() {
  $('#search_submit').click(function() {
    var search_result = $('#search_field').val();
    if (search_result == "") {
      $('#search_field').attr('placeholder', 'Please enter a location...');
      return;
    }
    $.ajax({
      dataType: 'json',
      data: {
        'address': search_result
      },
      type: 'POST',
      url: '/search/',
    }).done(function(data) {
      var latlong = data.latlong;
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
          shadowUrl: '/assets/leaf-shadow.png',
          iconSize: [27, 45], // size of the icon
          shadowSize: [50, 64], // size of the shadow
          iconAnchor: [22, 94], // point of the icon which will correspond to marker's location
          shadowAnchor: [10, 68], // the same for the shadow
          popupAnchor: [-3, -76] // point from which the popup should open relative to the iconAnchor
        });
        var pin = L.marker([activity.latitude, activity.longitude], {
          icon: greenIcon
        }).bindPopup('<h3>' + activity.title + '</h3>' + '<br>' + activity.description + '<br>' + '<a class="button" href=/activities/' + activity.slug + '>' + "View Activity" + '</a>');
        all_pins.push(pin);
        return pin;
      };

      _.each(data.cats, process_category);

      var layer_objects = _.map(layers, function(layer) {
        return layer.layer;
      });

      $('#map_float').empty();
      $('#map_float').append('<div id="map"/>');

      var map = L.map('map', {
        center: new L.LatLng(latlong[0], latlong[1]),
        zoom: 12,
        layers: layer_objects
      });

      var calculate_map_tiles = function() {
        n = 2 ^ zoom;
        x = ((latlong[0] + 180) / 360) * n;
        y = (1 - (ln(tan(latlong[1]) + sec(latlong[1])) / Pi)) / 2 * n;
      };

      L.tileLayer('http://{s}.tile.cloudmade.com/979aecf591d149b3a4d1e9dabdd52998/34243/256/{z}/{x}/{y}.png', {
        attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>'
      }).addTo(map);

      var layercake = {};
      _.each(layers, function(layer) {
        layercake[layer.title] = layer.layer;
      });

      L.control.layers({}, layercake, {
        collapsed: false
      }).addTo(map);

    });
  });
});