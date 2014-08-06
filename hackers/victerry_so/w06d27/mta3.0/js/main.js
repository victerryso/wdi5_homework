// https://gist.github.com/wofockham/7c37700256434ccba6df

// MTA Lab
// Objective:

// Apply your knowledge of JavaScript to solve a problem we've already tackled in Ruby.
// Activity

// Create a program that models a simple subway system.

// The program takes the line and stop that a user is getting on at and the line and stop that user is getting off at and prints the total number of stops for the trip.

// There are 3 subway lines:
// The N line has the following stops: Times Square, 34th, 28th, 23rd, Union Square, and 8th
// The L line has the following stops: 8th, 6th, Union Square, 3rd, and 1st
// The 6 line has the following stops: Grand Central, 33rd, 28th, 23rd, Union Square, and Astor Place.
// All 3 subway lines intersect at Union Square, but there are no other intersection points. (For example, this means the 28th stop on the N line is different than the 28th street stop on the 6 line, so you'll have to differentiate this when you name your stops in the arrays.)
// Hints:

// Get the program to work for a single line before trying to tackle multiple lines.
// Don't worry about user input. Start off by just hardcoding your stop and line choices in local variables. You CAN use prompt() to read user input if you wish but we'll be redoing MTA with actual form inputs later. At this stage we're more interested in finding the routes than giving annoying the user with popups.
// Remember, you've done this in Ruby before. Look at your code and figure out how to do it in JavaScript.
// Consider diagraming the lines by sketching out the subway lines and their stops and intersection.
// Make subway lines are keys in a hash, while the values are an array of all the stops on each line.
// The key to the lab is finding the index positions of each stop.
// Make sure the stops that are the same for different lines have different names (i.e. 23rd on the N and on the 6 need to be differentiated)
// BIG HINT: Look through the Javascript array methods to see what's available to help you: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array

var lines = {
  N: ['Times Square', '34th', '28th', '23rd', 'Union Square', '8th'],
  L: ['8th', '6th', 'Union Square', '3rd', '1st'],
  6: ['Grand Central', '33rd', '28th', '23rd', 'Union Square', 'Astor Place']
};

var startLine = '6';
var finishLine = 'L';
var startStop = 'Grand Central';
var finishStop = '1st';
var exchange = 'Union Square'

var startIndex = lines[startLine].indexOf(startStop);
var finishIndex = lines[finishLine].indexOf(finishStop);

if (startLine === finishLine) {
  var amtStops = Math.abs(startIndex - finishIndex);
  console.log('No. Stops: ' + amtStops);

  if (startIndex < finishIndex) {
    var listStops = lines[startLine].slice(startIndex, finishIndex + 1);
  } else {
    var listStops = lines[startLine].slice(finishIndex, startIndex + 1).reverse();
  }

  console.log(startLine + ': ' + listStops.join(', '));

} else {
  var startExcIndex = lines[startLine].indexOf(exchange);
  var finishExcIndex = lines[finishLine].indexOf(exchange);
  var amtStops = Math.abs(startIndex - startExcIndex) + Math.abs(finishIndex - finishExcIndex);
  console.log('No. Stops: ' + amtStops);

  if (startIndex < startExcIndex) {
    var listStops = lines[startLine].slice(startIndex, startExcIndex + 1);
  } else {
    var listStops = lines[startLine].slice(startExcIndex, startIndex + 1).reverse();
  }
  console.log(startLine + ': ' + listStops.join(', '));

  if (finishExcIndex < finishIndex) {
    var listStops = lines[finishLine].slice(finishExcIndex, finishIndex + 1);
  } else {
    var listStops = lines[finishLine].slice(finishIndex, finishExcIndex + 1).reverse();
  }
  console.log(finishLine + ': ' + listStops.join(', '));

}