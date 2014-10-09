

// var makeMadLib = function(){
// var story = document.getElementById('story');

// var noun = document.getElementById('noun').value;
// var adjective = document.getElementById('adjective').value;
// var name = document.getElementById('person').value;


// story.innerHTML = name + " really likes " + noun +  "  " + adjective + " . "
// // var n  = createButton.innerHTML; 
// // createButton.innerHTML = n;
// };
// var createButton = document.getElementById("lib-button");
// createButton.addEventListener('click', makeMadLib);



// var libIt = function(){
// };
// var libButton = document.getElementById('lib-button');
// libButton.addEventListener('click', libIt);


squaredNumber = function(num) {
    var squaredNumber = num * num;
    console.log('The result of squaring the number ' + num + ' is ' + squaredNumber);
    return squaredNumber;
};

var squareButton = document.getElementById("square-button");
squareButton.addEventListener("click", function() {
  var num = document.getElementById("square-input").value;
  document.getElementById("solution").innerHTML = squaredNumber(num);
});

HalfNum = function(){
	var num = document.getElementById('half-input').value;
	var results = num / 2;
	console.log('The result of dividing the number ' + num + ' is ' + results);
	document.getElementById("solution").innerHTML = results
  return results ;
 
 	
};

var halfButton  = document.getElementById("half-button");
halfButton.addEventListener('click', HalfNum );


var areaButton = document.getElementById("area-button");
areaButton.addEventListener("click", function() {
  var num = document.getElementById("area-input").value;
  document.getElementById("solution").innerHTML = areaOfCircle(num);
});

