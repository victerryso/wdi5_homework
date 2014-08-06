var apple = { // Objects in JS
  age: 18,
  color: 'red',
  likes: ['worms', 'birds'],
  dob: {day: 5, 'month': 0},
  yum: function(number) {
    console.log(number * 'm');
  };
};

console.log(apple.color); // Getting the value from the color key
console.log(apple.likes[0]); // Just like ruby
apple.likes.push('pigs'); // How to push it into an array
console.log(apple.likes); // Viewing the new array
console.log(apple.dob.day); // A hash in a hash
apple.color = 'green' // Changing the value
apple.smell = 'stinky' // Creating new keys + values
apple.yum(3) // Calling a function from an object

var fruitFactory = function(age, color) { // Quicker method to make more than one fruit
  var fruit = {
    age: age,
    color: color,
    yum: function(number) {
    console.log('yummy!');
    }
  };
  return fruit;
};

var banana = fruitFactory(10, 'yellow');
