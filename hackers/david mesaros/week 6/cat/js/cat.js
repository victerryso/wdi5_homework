
var movePixels = 10;
var delayMs = 50;
var catTimer = null;

function catWalk() {
  var img = document.getElementsByTagName('img')[0];
  var currentLeft = parseInt(img.style.left);
  img.style.left = (currentLeft + movePixels) + 'px';
  if (currentLeft > (window.innerWidth-img.width)) {
    img.style.left = '0px';
  }
}
function startCatWalk() {
  catTimer = window.setInterval(catWalk, delayMs);
  
}
//  console.log(catWalk)

var catStart = function(){
  startCatWalk(clearInterval(catTimer))
};

var cat = document.getElementById('start-button');
cat.addEventListener('click', catStart);

var catStop = function(){
  movePixels = 10
  window.clearInterval(catTimer);
};

var cat = document.getElementById('stop-button');
cat.addEventListener('click', catStop);


var speedy = function(){
    movePixels += 5;
    var speed = movePixels * (1000/50);
    document.getElementById('info').innerHTML = 'Current speed: ' + speed + 'px/second';

};

var cat = document.getElementById('speed-button');
cat.addEventListener('click',speedy)












// var kitten = document.getElementsByTagName('img')[0];
// kitten.style.opacity = 0;
// var direction = 'fadeIn';

// var fadeKitty = function () {
//   var kopacity = parseFloat(kitten.style.opacity);
//   if (direction === 'fadeIn') {
//      kitten.style.opacity = 0.01 + kopacity;
//   } else {
//     kitten.style.opacity = -0.01 + kopacity;
//   }
  
//   if (kopacity <= 0.1) {
//     direction = 'fadeIn';
//   } else if (kopacity >= 1) {
//     direction = 'fadeOut';
//   }
//   //console.log(kopacity, direction)
// };

// setInterval(fadeKitty, 5);
