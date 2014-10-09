$(document).ready(function() {

  var lines = {
    N: ['Times Square', '34th', '28th', '23rd', 'Union Square', '8th'],
    L: ['8th', '6th', 'Union Square', '3rd', '1st'],
    6: ['Grand Central', '33rd', '28th', '23rd', 'Union Square', 'Astor Place']
  };


  var trip = function() {

    $('#result').empty();

    var startLine = $('#startLine').val();
    var startStop = $('#startStop').val();
    var finishLine = $('#finishLine').val();
    var finishStop = $('#finishStop').val();

    var exchange = 'Union Square';

    var startIndex = lines[startLine].indexOf(startStop);
    var finishIndex = lines[finishLine].indexOf(finishStop);

    if (startLine === finishLine) {
      var amtStops = Math.abs(startIndex - finishIndex);
      $('#result').append("<p>No. Stops: " + amtStops + "</p>");

      if (startIndex < finishIndex) {
        var listStops = lines[startLine].slice(startIndex, finishIndex + 1);
      } else {
        var listStops = lines[startLine].slice(finishIndex, startIndex + 1).reverse();
      }

      $('#result').append("<p>" + startLine + ": " + listStops.join(', ') + "</p>");

    } else {
      var startExcIndex = lines[startLine].indexOf(exchange);
      var finishExcIndex = lines[finishLine].indexOf(exchange);
      var amtStops = Math.abs(startIndex - startExcIndex) + Math.abs(finishIndex - finishExcIndex);
      $('#result').append("<p>No. Stops: " + amtStops + "</p>");

      if (startIndex < startExcIndex) {
        var listStops = lines[startLine].slice(startIndex, startExcIndex + 1);
      } else {
        var listStops = lines[startLine].slice(startExcIndex, startIndex + 1).reverse();
      }
      $('#result').append("<p>" + finishLine + ": " + listStops.join(', ') + "</p>");

      if (finishExcIndex < finishIndex) {
        var listStops = lines[finishLine].slice(finishExcIndex, finishIndex + 1);
      } else {
        var listStops = lines[finishLine].slice(finishIndex, finishExcIndex + 1).reverse();
      }
      $('#result').append("<p>" + startLine + ": " + listStops.join(', ') + "</p>");
    }


  };

  for (i = 0; i < Object.keys(lines).length; i++) {
    var line = Object.keys(lines)[i];
    var $line = "<option value='" + line + "'>" + line + "</option>"
    $('#startLine').append($line);
    $('#finishLine').append($line);
  };

  var listStartStations = function () {
    $('#startStop').empty();
    var line = $('#startLine').val();
    for (j = 0; j < lines[line].length; j++) {
        var $option = "<option value='" + lines[line][j] + "'>" + lines[line][j] + "</option>"
        $('#startStop').append($option);
    };
  };

  var listFinishStations = function () {
    $('#finishStop').empty();
    var line = $('#finishLine').val();
    for (j = 0; j < lines[line].length; j++) {
        var $option = "<option value='" + lines[line][j] + "'>" + lines[line][j] + "</option>"
        $('#finishStop').append($option);
    };
  };

  $('#startLine').on('change', listStartStations);
  $('#finishLine').on('change', listFinishStations);
  $('#submit').on('click', trip);

  listStartStations();
  listFinishStations();
});