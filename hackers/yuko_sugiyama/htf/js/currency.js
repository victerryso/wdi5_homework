// Find the exchange rate between dollars and pounds
// Store the exchange rate in a variable
// Converting dollars to pounds:

var gbpBase = 0.544;


// Store a dollar amount into a variable.
// Convert it to pounds and output "$NN is £NN".
// Converting pounds to dollars:
var dollarsToPounds = function(x){
    var convertAudGbp = x*gbpBase;
    var exchangedGbp = convertAudGbp
    console.log("AU$"+x+"is"+"£"+ exchangedGbp.toFixed(2));
    return exchangedGbp;
}

var checkAUDconverted = dollarsToPounds(5);

// Now store a pound amount into a variable.
// Convert it to dollar and output "£NN is $NN."
// Cleaning it up:
// Can you make sure the output is only 2 decimal places?

 var poundsToDollars = function(y){
    var convertGBPAUD = y/gbpBase;
    var exchangedAUD = convertGBPAUD
    console.log("GB£"+y+"is"+"AUD$"+ exchangedAUD.toFixed(2));
    return exchangedAUD;
}

var checkGBPconverted = poundsToDollars(10);

// Refactoring

// Can you refactor the code so that it uses functions? Write a function dollarsToPounds that takes a dollar number as input and outputs a string of what the pound equivalent is.
// Do the same for poundsToDollars