$(document).ready(function (){

  var add_color = function () {
    var color = $('#color').val();
    var $box = $('<div></div>');
    $box.addClass('box');
    $box.css('background-color', color);
    $box.appendTo('#colors');
  };

  var set_color = function() {
    var $box = $(this);
    var color = $box.css('background-color');
    $('#selected').css('background-color', color);
  };

  var clear = function () {
    $('#colors').empty();
    $('#selected').css('background-color', 'white');
  };

  var mouz = false;
  $(document).on('mousedown', function () {
    mouz = true
  });

  $(document).on('mouseup', function () {
    mouz = false
  });

  var paint = function () {
    if (mouz) {
      var color = $('#selected').css('background-color');
      var $pixel = $(this);
      $pixel.css('background-color', color);
    };
  };

  var create_pixels = function() {
    $canvas = $('#canvas');
    _(2516).times(function() {
      var $pixel = $('<div/>');
      $pixel.addClass('pixel');
      $pixel.appendTo($canvas);
    });
  };

  var set_bg = function () {
    var $bg = $('#bg').val();
    $canvas = $('#canvas');
    $canvas.css("background-image", "url(" + $bg + ")");
  };


  $('#add_color').on('click', add_color);
  $('#clear').on('click', clear);
  $('#colors').on('click', '.box', set_color); // Delegation
  $('#add_bg').on('click', set_bg);

  $('#color').keypress(function (e) {
    if(e.keyCode==13)
      $('#add_color').click();
  });

  $('#canvas').on('mouseover', '.pixel', paint);

  create_pixels();

});