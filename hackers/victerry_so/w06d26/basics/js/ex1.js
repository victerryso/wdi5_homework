// The Fortune Teller

// Why pay a fortune teller when you can just program your fortune yourself?
// Store the following into variables: number of children, partner's name, geographic location, job title. Output your fortune to the screen like so: "You will be a X in Y, and married to Z with N kids."

var children = '2';
var partner = 'Jess';
var geoLocation = 'Sydney';
var job = 'Engineer';

console.log("You will be a " + job + " in " + geoLocation + " , and married to " + partner + " with " + children + " kids.");

// The Age Calculator
// Forgot how old someone is? Calculate it!

// Store the current year in a variable.
// Store their birth year in a variable.
// Calculate their 2 possible ages based on the stored values.
// Output them to the screen like so: "They are either NN or NN", substituting the values.

var currentYear = 2014;
var birthYear = 1988;
console.log("They are either " + (currentYear - birthYear));

// The Lifetime Supply Calculator
// Ever wonder how much a "lifetime supply" of your favorite snack is? Wonder no more!

// Store your current age into a variable.
// Store a maximum age into a variable.
// Store an estimated amount per day (as a number).
// Calculate how many you would eat total for the rest of your life.
// Output the result to the screen like so: "You will need NN to last you until the ripe old age of X".

var currentAge = 25;
var maxAge = 70;
var amtPerDay = 10;
console.log("You will need " + ((maxAge - currentAge) * 365 * amtPerDay) + " to last you until the ripe old age of " + maxAge);

// The Geometrizer
// Calculate properties of a circle, using the definitions at http://math2.org/math/geometry/circles.htm

// Store a radius into a variable.
// Calculate the circumference based on the radius, and output "The circumference is NN".
// Calculate the area based on the radius, and output "The area is NN".

var radius = 5;
console.log("The circumference is " + (radius * Math.PI));
console.log("The area is " + (radius * radius * Math.PI));

// The Temperature Converter
// It's hot out! Let's make a converter based on the steps at http://www.mathsisfun.com/temperature-conversion.html

// Store a celsius temperature into a variable.
// Convert it to fahrenheit and output "NN°C is NN°F".
// Now store a fahrenheit temperature into a variable.
// Convert it to celsius and output "NN°F is NN°C."

var celcius = 30;
console.log(celcius + "°C is " + (celcius * 9 / 5 + 32) + "°F");
var fahrenheit = 92;
console.log(fahrenheit + "°F is " + (fahrenheit - 32 * 5 / 9) + "°C");