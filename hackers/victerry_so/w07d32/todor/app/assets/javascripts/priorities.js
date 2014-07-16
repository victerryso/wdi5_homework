$(document).ready(function () {

  var render_priority_boxes = function () {
    var $colors = $('.color');
    $colors.each(function (i, color) {
      var $color = $(color);
      var hex = $color.text();
      var $box = $('<div/>');
      $box.addClass('priority');
      $box.css('background-color', hex);
      // $color.after($box);
      // $color.prev().before($box);
      $color.closest('li').prepend($box);
    });
  };

  // var show_form = function() {
  //   $('form').show();
  //   $('#new_priority').hide();
  // };
  // $('#new_priority').on('click', show_form);

  // var hide_form = function() {
  //   event.preventDefault();
  //   $('form').hide();
  //   $('#new_priority').show();
  // };
  // $('#cancel_priority').on('click', hide_form);

  var toggle_form = function (event) {
    event.preventDefault();
    $('form').toggle();
    $('#new_priority').toggle();
  };

  $('#new_priority').on('click', toggle_form);
  $('#cancel_priority').on('click', toggle_form);

  $('#priorities').on('submit', function (event) {
    event.preventDefault();

    var name = $('#name').val();
    var color = $('#color').val();
    var urgency = $('#urgency').val();

    $.ajax({
      url: '/priorities',
      type: 'POST',
      dataType: 'json',
      data: {
        name: name,
        color: color,
        urgency: urgency
      },
      success: function (p) {
        var $li = $('<li/>');
        var $span1 = $('<span/>');
        $span1.text(p.name);
        var $span2 = $('<span/>');
        $span2.addClass('invisible color');
        $span2.text(p.color);
        var $box = $('<div/>');
        $box.addClass('priority');
        $box.css('background-color', p.color);
        $li.prepend($box);
        $li.append($span1);
        $li.append($span2);
        $('#priority-list').append($li);
      }
    });
  });

  render_priority_boxes();

});