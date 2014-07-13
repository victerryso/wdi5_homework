// Find the exchange rate between dollars and pounds
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

// Can you refactor the code so that it uses functions? Write a function dollarsToPounds that takes a dollar number as input and outputs a string of what the pound equivalent is.

// Do the same for poundsToDollars


// var exchangeRate = 1.83;
// var dollars = 100;
// var pounds = 100;

// var dollarsToPounds = dollars / exchangeRate;
// var poundsToDollars = pounds * 1.83;

// var dollarsToPounds = dollarsToPounds.toFixed(2);
// var poundsToDollars = poundsToDollars.toFixed(2);

// console.log("$" + dollars + " is " + "£" + dollarsToPounds);
// console.log("£" + pounds + " is " + "$" + poundsToDollars);


var exchangeRate = 1.83;

var dollarsToPounds = function(dollar) {
  var amount = dollar / exchangeRate;
  var amount = amount.toFixed(2);
  console.log("$" + dollar + " is " + "£" + amount);
}

dollarsToPounds(100);


var poundsToDollars = function(pound) {
  var amount = pound * exchangeRate;
  var amount = amount.toFixed(2);
  console.log("£" + pound + " is " + "$" + amount);
}

poundsToDollars(100);


