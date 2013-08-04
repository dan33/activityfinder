$(document).ready(function () {

  $('#search').on;


  var map = L.map('map').setView([51.505, -0.09], 13);
  var z = 13
  var marker = L.marker([51.5, -0.09]).addTo(map);

  var calculate_map_tiles = function() {
    n = 2 ^ zoom
    x = ((-0.09 + 180) / 360) * n
    y = (1 - (ln(tan(51.505) + sec(51.505)) / Pi)) / 2 * n
  };

  L.tileLayer('http://{s}.tile.cloudmade.com/979aecf591d149b3a4d1e9dabdd52998/997/256/{z}/{x}/{y}.png', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
    maxZoom: 18
  }).addTo(map);
});