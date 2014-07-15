$prev = $('#previous');
$next = $('#next');

$carousel = $('#carousel');


var prevAnimate = function() {$(this).find("img:first").before($(this).find("img:last"));
  $(this).css({marginLeft:0});}

var nextAnimate = function() {$(this).find("img:last").after($(this).find("img:first"));
  $(this).css({marginLeft:0});}

$prev.click(function() {$carousel.animate({marginLeft: +612}, 1000, prevAnimate)});

$next.click(function() {$carousel.animate({marginLeft: -612}, 1000, nextAnimate)});