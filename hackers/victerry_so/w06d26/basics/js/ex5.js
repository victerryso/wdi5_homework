// Your top choices
// Create an array to hold your top choices (colors, presidents, whatever).

// For each choice, log to the screen a string like: "My #1 choice is blue."

// Bonus: Change it to log "My 1st choice, "My 2nd choice", "My 3rd choice", picking the right suffix for the number based on what it is.

var array = ['Yellow', 'Rock', 'Lumpiie', 'Palopiie', 'Snugglepuff', 'Poi Poi', 'Red Clown'];

var suffix = function(i) {
  if (i === 1) {
    return 'st'
  }
  else if (i === 2) {
    return 'nd'
  }
  else if (i === 3) {
    return 'rd'
  }
  else {
    return 'th'
  }
};

for (i = 1; i < array.length; i++) {
  console.log('My ' + i + suffix(i) + ' choice is ' + array[i])
};