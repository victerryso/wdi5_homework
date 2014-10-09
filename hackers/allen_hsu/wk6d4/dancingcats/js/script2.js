var movePixels = 5;
var delayMs = 20 ;
var canvas = document.getElementsByTagName('body')[0];
canvas.height = window.innerHeight;
canvas.width = window.innerWidth;

// Check for edge hit
var flip = function (x, vel, boundary, image) {
  if (x > boundary - image.height) {
    if (vel < 0) return 1;
    if (vel > 0) {
      image.className = null;
      return -1;
    }
  } else if (x < 0) {
    if (vel > 0) return 1;
    if (vel < 0) {
      image.className = 'backwards';
      return -1;

    }
  } else {
    return 1;
  }
}
// Parse int
var getCatInt = function(cat, attribute) {
  return parseInt(cat.getAttribute(attribute));
}

//Iterate over items with tag image
var updateHandler = function() {
  var cats = document.getElementsByTagName('img');
  for (var index in cats) {
    var cat = cats[index];
    x = parseInt(cat.style.left);
    y = parseInt(cat.style.top) ;
    velx = getCatInt(cat, 'velx');
    vely = getCatInt(cat, 'vely');
    cat.style.left = (x + velx) + "px";
    cat.style.top = (y + vely) + "px";
    cat.setAttribute("velx", velx * flip(x, velx, canvas.width, cat))
    cat.setAttribute("vely", vely * flip(y, vely, canvas.height, cat))
  }
}
// Add position and image number to array
var clickHandler = function(event) {
  var x = event.x;
  var y = event.y;
  cat = catFactory(x,y);
  canvas.appendChild(cat);
}
//Create cats
var catFactory = function(x,y) {
  var cat = document.createElement('img')
  cat.src = images[Math.floor(Math.random() * images.length)];
  cat.style.position = "absolute";
  cat.style.left = x + "px";
  cat.style.top = y + "px";
  cat.setAttribute("velX", (Math.random() * movePixels) - movePixels/2);
  cat.setAttribute("velY", (Math.random() * movePixels) - movePixels/2);
  return cat;
}
var image1 = 'images/grumpy.png';
var image2 = 'images/nyan.gif';
var image3 = 'images/scouse-cat.gif';
images = [image1, image2, image3];
window.onresize = function(event) {
  canvas.width = window.innerWidth;
  canvas.height = window.innerHeight;
}
canvas.addEventListener('click', clickHandler);
window.setInterval(updateHandler,delayMs);