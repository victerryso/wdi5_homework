var movePixels = 2;
var delayMs = 10;
var catTimer = null;

function catWalk() {
  var img = document.getElementById('walking-cat');
  var staringCat = document.getElementById('staring-cat');
  var currentLeft = parseInt(img.style.left);
  var currentRight = parseInt(img.style.right);

img.style.left = (currentLeft + movePixels) + 'px';
img.style.right = (currentRight + movePixels) + 'px';

  if (img.style.left < (window.innerWidth/2 + 'px')) {
    staringCat.style.WebkitTransform = 'scaleX(1)';
    staringCat.style.filter = 'FlipH';
  } else if (img.style.right < (window.innerWidth/2 + 'px')) {
    staringCat.style.WebkitTransform = 'scaleX(-1)';
    staringCat.style.filter = 'FlipH';
  }

  if (currentLeft > (window.innerWidth - img.width)) {
    img.style.left = null;
    img.style.right = '0px';
    img.style.left = (currentRight + movePixels) + 'px';
    img.style.WebkitTransform = 'scaleX(1)';
    img.style.filter = 'FlipH';

  } else if (currentRight > (window.innerWidth - img.width)){
    img.style.right = null;
    img.style.left = '0px';
    img.style.right = (currentLeft + movePixels) + 'px';
    img.style.WebkitTransform = 'scaleX(-1)';
    img.style.filter = 'FlipH';

  }


}

// function jumpingCat() {
//   var jumpCat = document.getElementById('jumping-cat');

//   var currentLeft = parseInt(jumpCat.style.left);
//   var currentRight = parseInt(jumpCat.style.right);


//   // jumpCat.style.bottom = (currentBottom + movePixels) + 'px';
//   jumpCat.style.left = (currentLeft + movePixels) + 'px';
//   jumpCat.style.right = (currentRight + movePixels) + 'px';

//   if (currentLeft > (window.innerWidth - jumpCat.width)) {
//     jumpCat.style.left = null;
//     jumpCat.style.right = '0px';
//     jumpCat.style.left = (currentRight + movePixels) + 'px';
//     jumpCat.style.WebkitTransform = 'scaleX(-1)';
//     // if (currentBottom < '50' + 'px') {
//     //   jumpCat.style.bottom = '0px';
//     //   jumpCat.style.bottom = (currentBottom + movePixels) + 'px';
//     // } else if (currentBottom > '50' + 'px'){
//     //   jumpCat.style.bottom = '0px';
//     //   jumpCat.style.bottom = (currentBottom - movePixels) + 'px';
//     // }

//   } else if (currentRight > (window.innerWidth - jumpCat.width)){
//     jumpCat.style.right = null;
//     jumpCat.style.left = '0px';
//     jumpCat.style.right = (currentLeft + movePixels) + 'px';
//     jumpCat.style.WebkitTransform = 'scaleX(1)';

//   }
// }

// function jump() {
//   var jump = document.getElementById('jumping-cat');
//   var currentBottom = parseInt(jump.style.bottom);

//   jump.style.bottom = (currentBottom + movePixels) + 'px';
//   jump.style.bottom = '0';
//   for (i = 0; i < jump.style.bottom; i++) {
//     jump.style.bottom = i + movePixels) + 'px';
//   }

//   for (i = 50; i < 0; i--) {
//     jump.style.bottom = i - movePixels) + 'px';
//   }

//   // if (currentBottom < '50' + 'px') {
//   //     jump.style.bottom = '0px';
//   //     jump.style.bottom = (currentBottom + movePixels) + 'px';
//   //   } else if (currentBottom > '50' + 'px'){
//   //     jump.style.bottom = '0px';
//   //     jump.style.bottom = (currentBottom - movePixels) + 'px';
//   //   }
// }


function startCatWalk() {
  catTimer = window.setInterval(catWalk, delayMs);

}

// function startCatJump() {
//   catTimer = window.setInterval(jumpingCat, delayMs);
// }

// function jumpCat() {
//   catTimer = window.setInterval(jump, delayMs)
// }

// startCatJump();
// jumpCat();
startCatWalk();