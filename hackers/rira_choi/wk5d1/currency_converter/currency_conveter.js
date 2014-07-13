// Store the exchange rate in a variable
// Converting dollars to pounds:

// Store a dollar amount into a variable.
// Convert it to pounds and output "$NN is £NN".
// Converting pounds to dollars:

// Now store a pound amount into a variable.
// Convert it to dollar and output "£NN is $NN."
// Cleaning it up:

// Can you make sure the output is only 2 decimal places?
// Refactoring

// Can you refactor the code so that it uses functions?
// Write a function dollarsToPounds that takes a dollar number as input and outputs a string of what the pound equivalent is.
// Do the same for poundsToDollars

var poundsToDollars = function(Pounds){
  var Dollars = Pounds * 1.8330;
  return "£" + Pounds.toFixed(2) + " is " + "$" + Dollars.toFixed(2);
}

var result1 = poundsToDollars(10);
console.log(result1);

var dollarsToPounds = function(dollars){
  var Pounds = dollars / 1.8330;
  return "$" + dollars.toFixed(2) + " is £" + Pounds.toFixed(2);
}

var result1 = dollarsToPounds(20);
console.log(result1);




