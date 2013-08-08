$(document).ready(function() {
  $('#search_submit').click(function() {

    // Error handling for search functionality, if there is nothing entered, it will alter the placeholder text

    var search_result = $('#search_field').val();
    if (search_result === "") {
      $('#search_field').attr('placeholder', 'Please enter a location...');
      return;
    }

    // Sends a post request to retrieve the latitude and longitude of the inputted address

    $.ajax({
      dataType: 'json',
      data: {
        'address': search_result
      },
      type: 'POST',
      url: '/search/',
    }).done(function(data) {

      // Iterates over the data, and retrieves the lat and long

      var latlong = data.latlong;
      var layers = [];
      window.all_pins = [];

      // Makes all of the following accessible to the process pin function (this uses AJAX to redraw the map with correct information)

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
          shadowUrl: '/assets/leaf-shadow.png',
          iconSize: [27, 45], // size of the icon
          shadowSize: [50, 64], // size of the shadow
          iconAnchor: [22, 94], // point of the icon which will correspond to marker's location
          shadowAnchor: [10, 68], // the same for the shadow
          popupAnchor: [-3, -76] // point from which the popup should open relative to the iconAnchor
        });

        // Creates the markers using the Icon styling that was just defined

        var pin = L.marker([activity.latitude, activity.longitude], {
          icon: greenIcon

          // It then adds a pop up with title, description, a link to that particular activities show page

        }).bindPopup('<h3>' + activity.title + '</h3>' + '<br>' + activity.description + '<br>' + '<a class="button" href=/activities/' + activity.slug + '>' + "View Activity" + '</a>');

        // And then pushes all pins into the all_pins array, which is then returned

        all_pins.push(pin);
        return pin;
      };

      // Iterates over each category defined (activities controller - lines 77 - 98), and stores the id, title, activities and image.  It then renders the latlong with allows the information stored in cats to be accessed

      _.each(data.cats, process_category);

      // Creates an object of all the layers (and the pins inside them) and returns them, to be added into the map, with var map

      var layer_objects = _.map(layers, function(layer) {
        return layer.layer;
      });

      // Clears the larger map container and then appends it with the map function (which is where the map is added, funnily enough)

      $('#map_float').empty();
      $('#map_float').append('<div id="map"/>');

      // Centers the map on wherever is chosen, adds layers and sets the zoom

      var map = L.map('map', {
        center: new L.LatLng(latlong[0], latlong[1]),
        zoom: 12,
        layers: layer_objects
      });

      // Creates the intrinsic leaflet things

      var calculate_map_tiles = function() {
        n = 2 ^ zoom;
        x = ((latlong[0] + 180) / 360) * n;
        y = (1 - (ln(tan(latlong[1]) + sec(latlong[1])) / Pi)) / 2 * n;
      };

      L.tileLayer('http://{s}.tile.cloudmade.com/979aecf591d149b3a4d1e9dabdd52998/34243/256/{z}/{x}/{y}.png', {
        attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>'
      }).addTo(map);

      // Iterates over the layers and then adds them to the layer control, also sets that to automatically expanded

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