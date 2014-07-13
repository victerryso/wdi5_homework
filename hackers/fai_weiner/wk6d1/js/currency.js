var rate = 1.8331;

var xDollarsToPounds = function(dollars) {
  var pounds = dollars * rate;
  console.log("AU$" + dollars + " is £" + pounds.toFixed(2) + ".");
};

var xPoundsToDollars = function(pounds) {
  var dollars = pounds / rate;
  console.log("£" + pounds + " is AU$" + dollars.toFixed(2) + ".")
};

xDollarsToPounds(30);
xPoundsToDollars(30);