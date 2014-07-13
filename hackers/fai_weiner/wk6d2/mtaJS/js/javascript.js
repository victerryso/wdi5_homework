// NETWORK hash containing each line's stations within an array
var network = {
  line6: ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"],
  lineL: ["8th", "6th", "Union Square", "3rd", "1st"],
  lineN: ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"]
};

// F1: Function to get user input
var getInput = function(message, value) {
  var input = window.prompt(message, value);
  return input;
};

// F2: Transform line input into a variable that matches lines within network
var transformLine = function(line) {
  if (line === "6") {
    return line = "line6"
  } else if (line === "L") {
    return line = "lineL"
  } else if (line === "N") {
    return line = "lineN"
  } else {
    alert("ERROR!")
  };
};

// LINES-C1: Check if start and stop stations are on the same line, spits out "lineCount"
var lineCount = function() {
  if (startLine === stopLine) {
    return 1;
  } else if (startLine !== stopLine) {
    return 2;
  };
};

var directionTest = function () {
  if (lineCount() === 1) {
    if (startIndex < stopIndex) {
      return "upline";
    } else {
      return "downline";
    };
  } else if (lineCount() > 1 ) {
    // leg 1
    if (startIndex < UnionIndex(startLine)) {
      var leg1 = "upline THEN";
    } else {
      var leg1 = "downline THEN";
    };
    // leg 2
    if (UnionIndex(stopLine) > stopIndex) {
      var leg2 = "... downline.";
    } else {
      var leg2 = "... upline.";
    };
    // legs combined
    return leg1 + leg2;
  };
};

// STATIONS-C1: Function to get index automatically, DO NOT CALL ON THIS FUNCTION INDEPENDENTLY!
var getIndex = function(line, station) {
  var index = network[line].indexOf(station);
  return index;
};

var UnionIndex = function(line) {
  var index = network[line].indexOf("Union Square");
  return index;
};

var slicingJourney = function () {};

var getJourney = function() {
  if (directionTest() === "upline") {
    console.log("we're going up!");
    var journey = network[startLine].slice(startIndex + 1, stopIndex + 1);
    console.log("There are " + journey.length + " stop(s) between " + startStation + " and " + stopStation + ".")
    console.log("Your journey: " + journey);
  } else if (directionTest() === "downline" ) {
    console.log("we're going down!");
    var journey = network[startLine].reverse().slice((network[startLine].indexOf(startStation) + 1),(network[stopLine].indexOf(stopStation) + 1));
    console.log("There are " + journey.length + " stop(s) between " + startStation + " and " + stopStation + ".");
    console.log("Your journey: " + journey);
  } else if (directionTest() === "upline THEN... downline."){
    var journey1 = network[startLine].slice(startIndex + 1, UnionIndex(startLine) + 1);
    var journey2 = network[stopLine].reverse().slice(network[stopLine].indexOf("Union Square") + 1, network[stopLine].indexOf(stopStation) + 1);
    console.log("There are " + ( journey1.length + journey2.length ) + " stop(s) between " + startStation + " and " + stopStation + ".");
    console.log("Your journey: " + journey1 + " [TRANSFER] " + journey2);
// GOOD
  } else if (directionTest() === "upline THEN... upline."){
    var journey1 = network[startLine].slice(startIndex + 1, UnionIndex(startLine) + 1);
    var journey2 = network[stopLine].slice(UnionIndex(stopLine) + 1, stopIndex + 1);
    console.log("There are " + ( journey1.length + journey2.length ) + " stop(s) between " + startStation + " and " + stopStation + ".");
    console.log("Your journey: " + journey1 + " [TRANSFER] " + journey2);  
// GOOD
  } else if (directionTest() === "downline THEN... upline."){
    var journey1 = network[startLine].reverse().slice(network[startLine].indexOf(startStation) + 1, network[startLine].indexOf("Union Square") + 1);
    var journey2 = network[stopLine].slice(UnionIndex(stopLine) + 1, stopIndex + 1);
    console.log("There are " + ( journey1.length + journey2.length ) + " stop(s) between " + startStation + " and " + stopStation + ".");
    console.log("Your journey: " + journey1.reverse() + " [TRANSFER] " + journey2);  
// GOOD
  } else if (directionTest() === "downline THEN... downline."){
    var journey1 = network[startLine].reverse().slice(network[startLine].indexOf(startStation) + 1, network[startLine].indexOf("Union Square") + 1);
    var journey2 = network[stopLine].reverse().slice(network[stopLine].indexOf("Union Square") + 1, network[stopLine].indexOf(stopStation) + 1);
    console.log("There are " + ( journey1.length + journey2.length ) + " stop(s) between " + startStation + " and " + stopStation + ".");
    console.log("Your journey: " + journey1 + " [TRANSFER] " + journey2);  
  } else {
    console.log("Invalid.")
  };
};

// ALL THINGS START POSITION
// SEED IF NEEDED: var startLineInput = "L";
// SEED IF NEEDED: var startStation = "1st";
var startLineInput = getInput("Type in start line.", "6, " + "L or " + "N");
var startLine = transformLine(startLineInput);
var startStation = getInput("What is your start station?", network[startLine]);
var startIndex = getIndex(startLine, startStation);

// ALL THINGS STOP POSITION
// SEED IF NEEDED: var stopLineInput = "N";
// SEED IF NEEDED: var stopStation = "Times Square";
var stopLineInput = getInput("Type in stop line.", "6, " + "L or " + "N");
var stopLine = transformLine(stopLineInput);
var stopStation = getInput("What is your stop station?", network[stopLine]);
var stopIndex = getIndex(stopLine, stopStation);

// RESULTS IN CONSOLE
console.log("Start Station: " + startStation + " on Line " + startLineInput);
console.log("Stop Station: " + stopStation + " on Line " + stopLineInput);

getJourney();
