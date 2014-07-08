var network = {
  line6: ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"],
  lineN: ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
  lineL: ["8th", "6th", "Union Square", "3rd", "1st"]
}

var getInput = function(message, value) {
  var input = window.prompt(message, value);
  return input;
};


var stopStation = getInput("What is your stop station?");
var startLine = getInput("Type in start line.", "6, " + "L or " + "N");
// var stopStation = getInput("What is your stop station?");


console.log(network.line6[0]);