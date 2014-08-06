// The Fortune Teller

// Why pay a fortune teller when you can just program your fortune yourself?
// Store the following into variables: number of children, partner's name, geographic location, job title. Output your fortune to the screen like so: "You will be a X in Y, and married to Z with N kids."
var fortune = function(children, partner, geolocation, job) {
  console.log("You will be a " + job + " in " + geolocation + " , and married to " + partner + " with " + children + " kids.");
};

fortune('2', 'ko', 'syd', 'clown');

// The Age Calculator
// Forgot how old someone is? Calculate it!

// Store the current year in a variable.
// Store their birth year in a variable.
// Calculate their 2 possible ages based on the stored values.
// Output them to the screen like so: "They are either NN or NN", substituting the values.
var agecalc = function(currentYear, birthYear) {
  console.log("They are either " + (new Date().getFullYear() - birthYear));
};

agecalc(2014, 1990);

// The Lifetime Supply Calculator
// Ever wonder how much a "lifetime supply" of your favorite snack is? Wonder no more!

// Store your current age into a variable.
// Store a maximum age into a variable.
// Store an estimated amount per day (as a number).
// Calculate how many you would eat total for the rest of your life.
// Output the result to the screen like so: "You will need NN to last you until the ripe old age of X".
var supply = function(currentAge, maxAge, amtPerDay) {
  console.log("You will need " + Math.round((maxAge - currentAge) * 365 * amtPerDay) + " to last you until the ripe old age of " + maxAge);
};

supply(25, 70, 32.83);

// The Geometrizer
// Calculate properties of a circle, using the definitions at http://math2.org/math/geometry/circles.htm

// Store a radius into a variable.
// Calculate the circumference based on the radius, and output "The circumference is NN".
// Calculate the area based on the radius, and output "The area is NN".
var circle = function(radius) {
  console.log("The circumference is " + (radius * Math.PI));
  console.log("The area is " + (radius * radius * Math.PI));
};

circle(2);

// The Temperature Converter
// It's hot out! Let's make a converter based on the steps at http://www.mathsisfun.com/temperature-conversion.html

// Store a celsius temperature into a variable.
// Convert it to fahrenheit and output "NN°C is NN°F".
// Now store a fahrenheit temperature into a variable.
// Convert it to celsius and output "NN°F is NN°C."

var temp = function(celcius, fahrenheit) {
  console.log(celcius + "°C is " + (celcius * 9 / 5 + 32) + "°F");
  console.log(fahrenheit + "°F is " + (fahrenheit - 32 * 5 / 9) + "°C");
};

temp (30,90);