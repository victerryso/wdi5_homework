var leftPos;
var width;


var next = function() {
  $('#carousel').animate({left: "-=612" + "px"}, 400);
  leftPos = parseInt($('#carousel').css('left'));
  width = parseInt($('#carousel').css('width'));
  if (leftPos == -width) {
     $('#carousel').animate({left: "0" + "px"}, 400);
  }
};

var prev = function() {
  $('#carousel').animate({left: "+=612" + "px"}, 400);
  if (leftPos === '1224' + "px") {
     $('#carousel').animate({left: width}, 400);
  }

};

$('#next').click(next);
$('#previous').click(prev);