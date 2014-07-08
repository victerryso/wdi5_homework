var network = {
  line6: ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"],
  lineL: ["8th", "6th", "Union Square", "3rd", "1st"],
  lineN: ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"]
};
// Function to get user input
var getInput = function(message, value) {
  var input = window.prompt(message, value);
  return input;
};

// Transform line input into a variable that matches lines within network
var transformLine = function(line) {
  if (line === "6") {
    return line = "line6"
  } else if (line === "L") {
    return line = "lineL"
  } else if (line === "N") {
    return line = "lineN"
    // CATCH!!! wrong line input
  };
};

// Function to get index automatically
var getIndex = function(startLine, startStation) {
  var index = network[startLine].indexOf(startStation);
  return index;
};


// Math.abs(index)

// array.slice(start_index, stop_index + 1)

// .reverse()

var startLineInput = getInput("Type in start line.", "6, " + "L or " + "N");
var startLine = transformLine(startLineInput);
var startStation = getInput("What is your start station?", network[startLine]);

var stopLineInput = getInput("Type in stop line.", "6, " + "L or " + "N");
var stopLine = transformLine(stopLineInput);
var stopStation = getInput("What is your stop station?", network[stopLine]);


var startIndex = getIndex(startLine, startStation);
var stopIndex = getIndex(stopLine, stopStation);

console.log(startLine);
console.log(startIndex);
console.log(stopLine);  
console.log(stopIndex);

if (startLine === stopLine) {
  console.log("Same line.");
  if (startIndex === -1 || stopIndex === -1) {
    console.log("end of the line included.");
  } else {
    console.log("come back to this");
  };
} else {
  console.log("Stations are not on the same line.");
};


