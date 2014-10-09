var movePixels = 2;
var delayMs = 30;
var catTimer = null;
var start = document.getElementById('start-button');
var stop = document.getElementById('stop-button')

function catWalk() {
  var img = document.getElementsByTagName('img')[0];
  var currentLeft = parseInt(img.style.left);
  var currentRight = parseInt(img.style.right);

img.style.left = (currentLeft + movePixels) + 'px';
img.style.right = (currentRight + movePixels) + 'px';

  if (currentLeft > (window.innerWidth - img.width)) {
    img.style.left = null;
    img.style.right = '0px';
    img.style.left = (currentRight + movePixels) + 'px';
    img.style.WebkitTransform = 'scaleX(-1)';
    img.style.filter = 'FlipH';
  } else if (currentRight > (window.innerWidth - img.width)){
    img.style.right = null;
    img.style.left = '0px';
    img.style.right = (currentLeft + movePixels) + 'px';
    img.style.WebkitTransform = 'scaleX(1)';
    img.style.filter = 'FlipH';
  }
}

function stopCatWalk() {
  catTimer = window.clearInterval(startCatWalk);
}

function startCatWalk() {
  catTimer = window.setInterval(catWalk, delayMs);

}

// if (biopacity <=0.1) {
//     direction = 'fadeIn';
//   } else if (biopacity >= 1) {
//     direction = 'fadeOut';
//   }
// };


start.addEventListener ('click', startCatWalk);
stop.addEventListener ('click', stopCatWalk);