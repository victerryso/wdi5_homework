// Triangle Area

// Given the following object, write an area function in JavaScript that calculates the area of triangle:

// var triangle = {
//   sideA: 3,
//   sideB: 4,
//   sideC: 5
// };
// Make sure your program detects triangles with invalid sizes (e.g. there are no triangles with sides 1, 1 and 15)

var triangle = {
  sideA: 3,
  sideB: 4,
  sideC: 5
};

var area = function(a, b, c) {
  if (a + b > c && a + c > b && b + c > a) {
    var p = (a + b + c)/2;
    console.log(Math.sqrt(p * (p - a) * (p - b) * (p - c)));
  } else {
    console.log('Danger! Danger!');
  }
};

area(triangle.sideA, triangle.sideB, triangle.sideC);

// JavaScript Calculator

// Create a calculator in JavaScript.

// Requirements

// Prompt the user to enter an operator and two operands.
// Support the following operations: addition, subtraction, multiplication, and division.
// Output may appear in the console or in an alert.
// Bonus

// Support the modulus operator.
// Support the square root operator.
// Support more than two operands.

var calc = function() {
  var x = parseFloat(prompt('Enter number:'));
  while (op !== '=') {

    console.log(x);
    var op = prompt('Enter operator:');

    if (op !== '=') {
      var y = parseFloat(prompt('Enter number:'));
      console.log(op + y);
    };

    if (op === '+') {
      x = x + y;
    } else if (op === '-') {
      x = x - y;
    } else if (op === '*') {
      x = x * y;
    } else if (op === '/') {
      x = x / y;
    } else if (op === '%') {
      x = x % y;
    } else if (op === '^') {
      x = Math.pow(x, y);
    } else if (op === '=') {
      //
    } else {
      console.log('Danger! Danger!');
    }
  }
};

calc();