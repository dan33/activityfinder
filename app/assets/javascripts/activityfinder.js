$(document).ready(function() {

  $('#search').on;

  // var littleton = L.marker([39.61, -105.02]).bindPopup('This is Littleton, CO.');
  // var denver = L.marker([39.74, -104.99]).bindPopup('This is Denver, CO.');
  // var aurora = L.marker([39.73, -104.8]).bindPopup('This is Aurora, CO.');
  // var golden = L.marker([39.77, -105.23]).bindPopup('This is Golden, CO.');

  // var cities = L.layerGroup([littleton, denver, golden]);

  var map = L.map('map', {
    center: new L.LatLng(-27.601902,134.46579),
    zoom: 4,
    // layers: [cities]
  });
  var z = 13

  // // MARKR TEMPLATE
  // L.marker([51.5, -0.09]).addTo(map)
  //   .bindPopup('A pretty CSS3 popup. <br> Easily customizable.')
  //   .openPopup();
  // //

  var calculate_map_tiles = function() {
    n = 2 ^ zoom
    x = ((-0.09 + 180) / 360) * n
    y = (1 - (ln(tan(51.505) + sec(51.505)) / Pi)) / 2 * n
  };

  L.tileLayer('http://{s}.tile.cloudmade.com/979aecf591d149b3a4d1e9dabdd52998/997/256/{z}/{x}/{y}.png', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>'
  }).addTo(map);
});