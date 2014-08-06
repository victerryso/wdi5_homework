var counterButton = document.getElementById('counter');

var incrementButton = function() {
  var n = counterButton.innerHTML;
  n = parseInt(n);
  n++
  counterButton.innerHTML = n;
};

counterButton.addEventListener('click', incrementButton);

var libButton = document.getElementById('lib-button');

var makeMadLib = function() {
  var noun = document.getElementById('noun').value;
  var adjective = document.getElementById('adjective').value;
  var person = document.getElementById('person').value;
  var divNode = document.getElementById('story');
  divNode.innerHTML = (person + ' is a ' + adjective + ' ' + noun);
};

libButton.addEventListener('click', makeMadLib);