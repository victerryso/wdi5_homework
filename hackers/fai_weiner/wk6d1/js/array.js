var topTastes = ["salty", "sweet", "sour", "bitter", "savory"];

for (var i = 0; i < topTastes.length; i++) {
  console.log("My #1 choice is " + topTastes[i]);
};


for (var x = 0; x < topTastes.length; x++) {
  if ( x === 0 ) {
    var place = "st";
  } else if ( x === 1 ) {
    var place = "nd";
  } else if ( x === 2 ) {
    var place = "rd";
  } else {
    var place = "th"
  };
  console.log("My " + (x + 1) + place + " choice is " + topTastes[x] + ".");
};