$(document).ready(function() {

  // Following AJAX call comes from Activities Controller, lines 24 - 30

  $.ajax({
    dataType: 'json',
    type: 'GET',
    url: '/activities/',
  }).done(function(data) {

    // Data involves Category ID, Title, Activities and the Image URL

    var layers = [];
    window.all_pins = [];

    // Runs Process category, which retrieves the image, and returns the pins created in process_pin

    var process_category = function(c) {
      var pins = _.map(c.activities, function(pin) {
        pin.image = c.image;
        return process_pin(pin);
      });

      // With the Pins that were stored, it pushes these into the layers array and creates layer groups out of these

      layers.push({
        id: c.id,
        title: c.title,
        layer: L.layerGroup(pins)
      });
    };

    // Creates the pins for storage in layers.  Also styles the icon

    var process_pin = function(activity) {
      var greenIcon = L.icon({
        iconUrl: activity.image,
        shadowUrl: '/assets/shadow.png',
        iconSize: [27, 45], // Size of the icon
        shadowSize: [26, 23], // Size of the shadow
        iconAnchor: [22, 94], // Point of the icon which will correspond to marker's location
        shadowAnchor: [10, 68], // The same for the shadow
        popupAnchor: [-3, -76] // Point from which the popup should open relative to the iconAnchor
      });

      // Creates the markers using the Icon styling that was just defined

      var pin = L.marker([activity.latitude, activity.longitude], {
        icon: greenIcon

        // It then adds a pop up with title, description, a link to that particular activities show page

      }).bindPopup('<h3>' + activity.title + '</h3>' + '<br>' + activity.description + '<br>' + '<br>' + '<a class="button" href=/activities/' + activity.slug + '>' + "View Activity" + '</a>');

      // And then pushes all pins into the all_pins array, which is then returned

      all_pins.push(pin);
      return pin;
    };

    // This iterates over each piece of data and runs process category on it (which creates the pins and pushes them into the layers)

    _.each(data, process_category);

    // Creates an object of all the layers (and the pins inside them) and returns them, to be added into the map, with var map

    var layer_objects = _.map(layers, function(layer) {
      return layer.layer;
    });

    // Centers the map on Sydney (needs to be set to current geolocation), sets the zoom, and adds the pins

    var map = L.map('map', {
      center: new L.LatLng(-33.8674869, 151.2069902),
      zoom: 10,
      layers: layer_objects
    });

    // var z = 13;

    // Intrinsic to Leaflet, creates the size of each particular tile of the map

    var calculate_map_tiles = function() {
      n = 2 ^ zoom;
      x = ((-0.09 + 180) / 360) * n;
      y = (1 - (ln(tan(51.505) + sec(51.505)) / Pi)) / 2 * n;
    };

    // Creates the tile layer and adds it to the map

    L.tileLayer('http://{s}.tile.cloudmade.com/979aecf591d149b3a4d1e9dabdd52998/34243/256/{z}/{x}/{y}.png', {
      attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>'
    }).addTo(map);

    // Creates a hash of each layer, and adds this to the Layers controller (top right of the map).  Also sets this to automatically expanded

    var layercake = {};
    _.each(layers, function(layer) {
      layercake[layer.title] = layer.layer;
    });
    L.control.layers({}, layercake, {
      collapsed: false
    }).addTo(map);
  });

  // Shows and hides the reply form

  $('button').click(function() {
    $(this).parent().find('.reply_form').toggleClass('hidden');
  });
});