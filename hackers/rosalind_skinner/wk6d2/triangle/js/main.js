// Given the following object, write an area function in JavaScript that calculates the area of triangle:

// var triangle = {
//   sideA: 3,
//   sideB: 4,
//   sideC: 5
// };
// Make sure your program detects triangles with invalid sizes (e.g. there are no triangles with sides 1, 1 and 15)

var sideA = parseInt(prompt("enter side a"));
var sideB = parseInt(prompt("enter side b"));
var sideC = parseInt(prompt("enter side c"));

var triangleCheck = function(sideA, sideB, sideC) {
  if (((sideA + sideB) > sideC) && ((sideB + sideC) > sideA) && ((sideA + sideC) > sideB)){
      area(sideA, sideB, sideC);
  }else{
    window.alert("You have input invalid side lengths!");
  }
}

var area = function(sideA, sideB, sideC){
  var area = Math.sqrt((sideA + sideB - sideC) * (sideA - sideB + sideC) * (-sideA + sideB + sideC) * (sideA + sideB + sideC));
  var area = area/4;
  window.alert("The area of the triangle with sides " + sideA + " ," + sideB + " ," + sideC + " gives an area of " + area + ".");
}

triangleCheck(sideA,sideB,sideC);
