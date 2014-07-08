var network = {
  line6: ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"],
  lineL: ["8th", "6th", "Union Square", "3rd", "1st"],
  lineN: ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"]
};

var getInput = function(message, value) {
  var input = window.prompt(message, value);
  return input;
};

// Makes user life easier, transform line input into proper line name to match network
var transformLine = function(line) {
  if (line === "6") {
    return line = "line6"
  } else if (line === "L") {
    return line = "lineL"
  } else if (line === "N") {
    return line = "lineN"
  };
};
// Math.abs(index)

// array.slice(start_index, stop_index + 1)

// .reverse()

var startLine = getInput("Type in start line.", "6, " + "L or " + "N");
// var startStation = getInput("What is your start station?", "");
var stopLine = getInput("Type in stop line.", "6, " + "L or " + "N");
// var stopStation = getInput("What is your stop station?", "");

// if (startLine === "6") {
//   var startIndex = network.lineL.indexOf(startLine);
// } else if (startLine === "L") { 
//   line = "lineL";
//   var startIndex = network.lineL.indexOf(startLine);
// } else if (startLine === "N") {
//   line = "lineN";
//   var startIndex = network.lineN.indexOf(startLine);
// } else {
//   alert("Invalid Line, please try again.");
// };

console.log(transformLine(startLine))
console.log(transformLine(stopLine))  
// console.log(network[startLine]);
// console.log(network[startLine].indexOf(startStation));
// console.log(network[stopLine]);
// console.log(network[stopLine].indexOf(stopStation));