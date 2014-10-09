
//  $(document).ready(function(){
// 	$("#previous").click(function () {
//           $("#carousel").animate({'left':'-=100px'}, 300);
//     });
// });


//  $(document).ready(function(){
// 	$("#next").click(function () {
//           $("#carousel").animate({'left':'+=100px'}, 300);
//     });
// });

// $(document).ready(function() {
//         //move the last list item before the first item. The purpose of this is if the user clicks previous he will be able to see the last item.
//         $('#carousel:first').before($('#carousel:last'));

//         //when user clicks the image for sliding right
//         $('#right_scroll img').click(function(){

//             //get the width of the items ( i like making the jquery part dynamic, so if you change the width in the css you won't have o change it here too ) '
//             var item_width = $('#carousel_ul li').outerWidth() + 10;

//             //calculate the new left indent of the unordered list
//             var left_indent = parseInt($('#carousel_ul').css('left')) - item_width;

//             //make the sliding effect using jquery's anumate function '
//             $('#carousel_ul').animate({'left' : left_indent},{queue:false, duration:500},function(){

//                 //get the first list item and put it after the last list item (that's how the infinite effects is made) '
//                 $('#carousel_ul li:last').after($('#carousel_ul li:first'));

//                 //and get the left indent to the default -210px
//                 $('#carousel_ul').css({'left' : '-210px'});
//             });
//         });

//     });

        
   $(document).ready(function(){
$prev = $('#previous');
$next = $('#next');

$carousel = $('#carousel');


var prevAnimate = function() {$(this).find("img:first").before($(this).find("img:last"));
  $(this).css({marginLeft:0});}

var nextAnimate = function() {$(this).find("img:last").after($(this).find("img:first"));
  $(this).css({marginLeft:0});}

$prev.click(function() {$carousel.animate({marginLeft: +612}, 1000, prevAnimate)});

$next.click(function() {$carousel.animate({marginLeft: -612}, 1000, nextAnimate)});

}); 
