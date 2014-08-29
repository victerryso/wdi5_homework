$(document).ready(function () {

var stations = {
    N: [ "Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
    L: [ "8th", "6th", "Union Square", "3rd", "1st"],
    _6: [ "Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]
  };

var showStations = function() {
  _.each( stations, function( stops, line ) {
      var $lines = $('<optgroup/>').attr('label',line);
      var $options = $('#start-station, #end-station').append($lines);
      _.each( stops, function( stop ) {
        var $stop = $('<option/>').val(line + ", "+ stop).text(stop);
        $($options).append($stop);

      });
  });
};

showStations();
   // var selectOption = function() {
    // var $stationSelect = $( ".start-station option:selected" ).text();
    //   console.log($stationSelect);
   // };



  var startLine = prompt("Enter Start Line");
  var startStation = prompt("Enter Start Station");
  var endLine = prompt("Enter End Line");
  var endStation = prompt("Enter End Station");

  var trip = [];
  // var start = stations[startLine].indexOf(startStation);
  // var end = stations[endLine].indexOf(endStation);
  // var startUnionSq = stations[startLine].indexOf("Union Square");
  // var endUnionSq = stations[endLine].indexOf("Union Square");

  if (startLine === endLine) {
    if (start < end) {
      for(i = start; i <= end; i++){
        var tripStops = stations[startLine][i];
        trip.push(tripStops);
      }
    } else if (start > end){
        for(i = end; i <= start; i++){
          var tripStops = stations[startLine][i];
          trip.push(tripStops);
        }
    }
    var tripLength = trip.length;
  } else {
    if (start < startUnionSq) {
      for(i = start; i <= startUnionSq; i++){
        var tripStops = stations[startLine][i];
        trip.push(tripStops);
      }
    }
    if (end < endUnionSq) {
      for (i = end; i <= (endUnionSq + 1); i++) {
        var tripStops = stations[endLine][i];
        trip.push(tripStops);
      }
    }
    if (start > startUnionSq) {
      for (i = startUnionSq; i <= start; i++) {
        var tripStops = stations[startLine][i];
        trip.push(tripStops);
      }
    }
    if (end > endUnionSq) {
      for (i = (endUnionSq + 1); i <= end; i++) {
        var tripStops = stations[endLine][i];
        trip.push(tripStops);
      }
    }
    var tripLength = trip.length;
  }
    var trip = trip.join(", ");

  alert("Your trip: " + trip + " with " + tripLength + " stops.");


});