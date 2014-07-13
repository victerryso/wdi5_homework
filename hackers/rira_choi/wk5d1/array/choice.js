// Create an array to hold your top choices (colors, presidents, whatever).

// For each choice, log to the screen a string like: "My #1 choice is blue."

// Bonus: Change it to log "My 1st choice, "My 2nd choice", "My 3rd choice",
// picking the right suffix for the number based on what it is.

var myTopChoice = ['Beer', 'Shiraz', 'Jane Austen', 'Chocolate', 'Vintage'];
for (i = 0; i < myTopChoice.length; i++){
  console.log("My " + (i + 1) + "choice is " + myTopChoice[i] + ".");
}

var myTopChoice = ['Beer', 'Shiraz', 'Jane Austen', 'Chocolate', 'Vintage'];
for (i = 0; i < myTopChoice.length; i++){
  if (i == 0){
    console.log("My 1st choice is " + myTopChoice[0] + ".");
  } else if(i == 1 ) {
    console.log("My 2nd choice is " + myTopChoice[1] + ".");
  } else if(i == 2 ) {
    console.log("My 3rd choice is " + myTopChoice[2] + ".");
  } else {
    console.log("My " + (i + 1) + "th choice is " + myTopChoice[i] + ".");
  }
}