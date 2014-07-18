var lines = {
  n: ['Times Square', '34th','28th', '23rd', 'Union Square', '8th'],
  l: ['8th', '6th', 'Union Square', '3rd', '1st'],
  6: ['Grand Central', '33rd', '28th', '23rd', 'Union Square', 'Astor Place']
};

var startLine = 'n';
var stopLine = 'n';
var startStation = lines.n[4];
var stopStation = lines.n[2];
var startStationIndex = lines.n.indexOf(startStation);
var stopStationIndex = lines.n.indexOf(stopStation);
var intersection = 'Union Square';

// single line, forwards travel
if (startLine === stopLine && startStationIndex < stopStationIndex) {
  var trip = lines[startLine].slice(startStationIndex, stopStationIndex);
  var trip = trip.length;
  console.log(trip);
// single line, backwards travel
} else {
  var trip = lines[startLine].slice(stopStationIndex, startStationIndex);
  var trip = trip.length;
  console.log(trip);
};
