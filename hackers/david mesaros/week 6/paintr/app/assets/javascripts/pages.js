// $(document).ready(function(){
// 	var add_color = function (){
// 		var color = $('#color').val();
// 		var $box = $('<div/>');
// 		$box.addClass('box')
// 		$box.css('background-color', color);
// 		//$('#colors').prepend($box);
// 		$box.prependTo('#color');

// 	};

// 	var set_color = function(){
// 		var $box = $(this);
// 		var color = $box.css('background-color');
// 		$('#selected').css('background-color' color)

// 	};

// 	var clear_colors = function(){
// 		$("#colors").empty();
// 		$('#selected').css('background-color', white)
// 	}

// 	var paint = function(){
// 		var color = $("#selected").css('background-color');
// 		var $pixal = $(this);
// 		$pixal.css('background-color', color)
// 	}

// 	$('#add_color').on('click', add_color);
// 	$('#clear').on('click', clear_colors)
	
// 	$('#colors').on('click', '.box', set_color) // delegation make the parents
// 	$('#canvas')on('mouseover', ".pixal", paint)

// 	var create_pixals = function (){
// 		// for (var i = 0; i < 1000; i++){
// 		// 	var $pixal = $('<div/>');
// 		// 	$pixal.addClass('');
// 		// 	$pixal.appendTo("#canvas");
// 		// }

// 		_(5000).times(function(){
// 			var $canvas = $('#canvas')
// 			var $pixal = $('<div/>');
// 		 	$pixal.addClass('');
// 			$pixal.appendTo($canvas);

// 		});
// 	});



// });

$(document).ready(function () {

  var add_color = function () {
    var color = $('#color').val();
    var $box = $('<div></div>');
    $box.addClass('box');
    $box.css('background-color', color);
    $box.prependTo('#colors'); // equivalent to $('#colors').prepend($box);
  };

  var set_color = function () {
    var $box = $(this);
    var color = $box.css('background-color');
    $('#selected').css('background-color', color);
  };

  var clear_colors = function () {
    $('#colors').empty();
    $('#selected').css('background-color', 'white');
  };

// var holdActive = false;
 
 $('#canvas').mousedown(function(){
  holdActive = true
 });

  $('#canvas').mouseup(function () {
    console.log("upbaby");
    holdActive = false;
  });

  var paint = function () {
    if(holdActive == true)
    var color = $('#selected').css('background-color');
    var $pixel = $(this);
   $pixel.css('background-color', color);
 
  };	

  var add_bg = function(){
  	var $bg = $('#background-image').val();
  	$('#canvas').css('background-image', 'url(' + $bg + ')');

  }

  $('#add_color').on('click', add_color);
  $('#clear').on('click', clear_colors);
  $('#colors').on('click', '.box', set_color); // Delegation!
  $('#canvas').on('mouseleave', '.pixel', paint); // Delegation!
  $('#add_bg').on('click', add_bg)

  var create_pixels = function () {
    var $canvas = $('#canvas'); // Cache this to prevent repeatedly querying for it.
    _(5000).times(function () {
      var $pixel = $('<div/>');
      $pixel.addClass('pixel');
      $pixel.appendTo($canvas);
    });
  };

  create_pixels();
});
