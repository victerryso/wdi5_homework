// Write a function called randomThis() that picks a random "This" element from the array
// Write a function called randomThat() that picks a random "That" element from the array
// Write a function that prints a statement saying: "So.... your startup is basically like a like a this for that?" It should print a new statement each time the function is called.

var things = ['cloud storage provider', 'beer', 'TV network', 'Family guy', 'node.js servers', 'endangered species', 'brewery', 'legless homeless people', 'social network', 'sub-human cave dwellers']

var firstThing = things[Math.floor(Math.random()*things.length)];
var secondThing = things[Math.floor(Math.random()*things.length)];

console.log(firstThing + " for " + secondThing);

// var randomThis = function(selection) {
//   console.log(selection);
// }

// randomThis(firstThing);

// var randomThat = function(selection) {
//   console.log(selection);
// }

// randomThat(secondThing);



// var randomThis = function(x) {
//   var randomThat = function(y) {
//     console.log(x + " for " + y);
//   }
// };

// randomThis(firstThing)(secondThing);









// function a(x) {    // <-- function
//       function b(y) { // <-- inner function
//         console.log(x + y); // <-- use variables from outer scope
//       }
//       console.log(b);       // <-- you can even return a function.
//    }
//    a(3)(4);           // == 7.
