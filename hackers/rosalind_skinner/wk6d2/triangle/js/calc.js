// Create a calculator in JavaScript.

// Requirements

// Prompt the user to enter an operator and two operands.
// Support the following operations: addition, subtraction, multiplication, and division.
// Output may appear in the console or in an alert.
// Bonus

// Support the modulus operator.
// Support the square root operator.
// Support more than two operands.

var operator = prompt("Enter an operator");
var num1 = parseInt(prompt("Enter your first number"));
var num2 = parseInt(prompt("Enter your second number"));

var calculate = function(operator, num1, num2){
  if (operator == "*") {
    var answer = num1 * num2;
  } else if (operator == "+") {
    var answer = num1 + num2;
  } else if (operator == "-") {
    var answer = num1 - num2;
  } else if (operator == "/") {
    var answer = num1 / num2;
  }
  window.alert(answer);
}


calculate(operator,num1,num2);