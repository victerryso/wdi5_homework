var movePixels = 10;
var delayMs = 20 ;

// Globals
var canvas = document.getElementsByTagName('canvas')[0];
canvas.width = window.innerWidth;
canvas.height = window.innerHeight;
var context = canvas.getContext('2d');

var image = document.getElementById('image');
var catsArray = [];

// Check for edge hit
var bounceCheck = function(cat) {
  // height
  cat.velY = cat.velY * flip(cat.y, canvas.height);
  // width
  if (flip(cat.x, canvas.width) == -1){
    cat.velX = cat.velX * -1
    if (cat.image.className) {
      cat.image.className = null;
    } else {
      cat.image.className = "backwards";
    }
  }
}

var flip = function (x, boundary) {
  if (x > boundary) {
    return -1;
  } else if (x < 0) {
    return -1;
  } else {
    return 1;
  }
}
//Iterate over items in array and draw onto canvas
var updateHandler = function() {
  context.clearRect(0, 0, canvas.width, canvas.height);
  for (var index in catsArray) {
    cat = catsArray[index];
    bounceCheck(cat);
    cat.x += cat.velX;
    cat.y += cat.velY;
    context.drawImage(cat.image, cat.x, cat.y);

    // drawImage(catsArray[index].x,catsArray[index].y)
  }
}
// Add position and image number to array
var clickHandler = function(event) {
  var x = event.x;
  var y = event.y;
  catsArray.push(catFactory(x,y));
}
//Create cats
var catFactory = function(x,y) {
  var cat = {
    x: x,
    y: y,
    velX: (Math.random() * movePixels) - movePixels/2,
    velY: (Math.random() * movePixels) - movePixels/2,
    image: images[Math.floor(Math.random() * images.length)]
  };
  return cat;
}
var image1 = new Image();
image1.src = 'images/grumpy.png';
var image2 = new Image();
image2.src = 'images/nyan.gif';
images = [image1, image2];
window.onresize = function(event) {
  canvas.width = window.innerWidth;
  canvas.height = window.innerHeight;
}
canvas.addEventListener('click', clickHandler);
window.setInterval(updateHandler,delayMs);

