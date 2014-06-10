# Calculator

###Objectives:
- Practice with functions, loops, conditions, user-input, switch/case

###Activity:
- Students should work on this lab in groups.

###Explanation
- You will be building a calculator.  A calculator can perform multiple arithmetic operations.  Your function should allow the user to choose which operation is expected, enter in the values to perform the operation on, and ultimately view the result.
- The instructor should carefully step through the lab with the students, as they type out the requirements for each specification.
- Consider having the students make git commits as they finish each phase, so they can see the history

###Specification:
- A user should be given a menu of operations
- A user should be able to choose from the menu
- A user should be able to enter numbers to perform the operation on
- A user should be shown the result
- This process should continue until the user selects a quit option from the menu

#####Phase 1
- Calculator functionality
  - Calculator should be able to do basic arithmetic (+,-, *, /)

#####Phase 2
- Advanced Calculator functionality
  - Calculator should be able to do basic arithmetic (exponents, square roots)

#####Phase 3
- User should be given a menu of Calculator functionality
- User should be able to choose indented functionality

## Mortgage & BMI Calculators

Add additional features to your calculators:

* [Mortgage:](http://www.wikihow.com/Sample/Mortgage-Payment)
  * Calculate the monthly payment when given the other variables as input.
* [BMI:](http://www.wikihow.com/Image:BMI.jpg)
  * Calculate the BMI when given the height and weight.

## Trip Calculator

* This option asks the user for four inputs:
  * Distance – how far will you drive?
  * MPG – what is the fuel efficiency of the car?
  * $PG – how much does gas cost per gallon?
  * Speed – how fast will you drive?

* The output is a string: "Your trip will take 3.5 hours and cost $255.33."
* For every 1 MPH over 60 MPH, reduce the the MPG by 2 MPG. (i.e. a car that normally gets 30 mpg would only get 28 mpg if its speed were 61 mph. Yes this gets silly at high speed where mpg goes to zero or gets negative.)