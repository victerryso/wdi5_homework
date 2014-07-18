// Modulo fix
Number.prototype.mod = function(n) {
return ((this%n)+n)%n;
}
// Globals
var image1 = $('#img1');
var image2 = $('#img2');
var image3 = $('#img3');
var images = [image1, image2, image3];
// var images =[
//               [image1, image2, image3],
//               [image1, image2, image3],
//               [image1, image2, image3]
//             ];
var position = 0;
// Helpers
var preparePosition = function () {
  leftImage = images[(position-1).mod(images.length)];
  rightImage = images[(position+1).mod(images.length)];
  leftImage.css('left', -leftImage.width() + "px");
  rightImage.css('left', rightImage.width() + "px");
}

var animate = function(image, direction) {
  console.log(direction);
  var width = image.width() * direction;
  // image.css('left',width);
  var nextImage = images[(-direction+position).mod(images.length)];
  var nextPos = parseInt(nextImage.css("left"));
  image.animate(
    {"left": "+=" + width + "px"},
    {
      duration: 500,
      step: function (now, fx) {
        // console.log(nextImage);
        nextImage.css("left", nextPos + now );

      },
      easing: "swing",
      complete: function() {
        position = (position - direction).mod(images.length);
        preparePosition();
      }
  });
}
var direction = function(dir) {
  animate(images[position], dir);
};

// intialise
$( window ).load(function(){
  preparePosition();
})

// listeners
$('#next').click(function(){
  if (jQuery(':animated').length){
    console.log("animated");
    return false;
  }
  direction(-1);
})

$('#previous').click(function(){
  if (jQuery(':animated').length){
    return false;
  }
  direction(1);
})
