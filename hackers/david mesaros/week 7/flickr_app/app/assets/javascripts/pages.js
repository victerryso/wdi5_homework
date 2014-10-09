// $(document).ready(function(){

// 	var search_in_loop = false

// 	var clear_images = function(){
// 		$('#images').empty()

// 	};

	



// 	var search_flickr = function(){
// 		if (search_in_loop = true){
// 			return;
// 		}

// 		search_in_loop = true;
		
// 		var query = $("#search").val();

// 		var page = 1;



// 		var process_images = function(data){
// 			var images = data.photos.photo;

// 			for(var i = 0; i < images.length; i++){
// 				var item = images[i];
// 				var img_url = "http://farm"+ item.farm +".static.flickr.com/"+ item.server +"/"+ item.id +"_"+ item.secret +"_m.jpg";
// 				var $img = $('<img>')
// 				$img.attr('src', img_url);
// 				$('#images').append($img);
// 				$img.hide();
// 				$img.show(2000);

			
			 

				

// 				}
		
			
		
// 		};

 			 
		

// 		$.getJSON('https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=0e3e8bee7d3b5002817c6b2e9ec8f9f5&text=' + query + '&per_page=100&page=' + page + '&format=json&jsoncallback=?', process_images)

// 		$(window).scroll(function() {
//     				if($(window).scrollTop() >= $(document).height() - $(window).height()) {
// 							page ++ ;
//     					search_flickr();

//            // ajax call get data from server and append to the 		div
//     			}
// 			});
// 	};
	
					

// 	$('#search_flickr').on('click', search_flickr);
// 	$('#clear_images').on('click', clear_images)
// });


$(document).ready(function () {

  var page = 1

  var search_in_progress = false;
  var search_flickr = function () {

    if (search_in_progress) {
      return;
    }

    search_in_progress = true;

    var query = $('#search').val();
    var key = '5f5a78b55d0916888526ec3b3eb2e3aa'

    var process_images = function (data) {
      search_in_progress = false;
      var images = data.photos.photo;
      for (i = 0; i < images.length; i++) {
        var item = images[i];
        var img_url = "http://farm"+ item.farm +".static.flickr.com/"+ item.server +"/"+ item.id +"_"+ item.secret +"_m.jpg";
        var $img = $('<img>');
        $img.attr('src', img_url);
        $('#images').append($img);
        $img.hide();
        $img.fadeIn(2000);
      };
    };

  var data = $.getJSON('https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=' + key + '&text=' + query + '&per_page=48&page=' + page + '&format=json&jsoncallback=?', process_images);

  };

  var clear_flickr = function () {
    $('img').remove();
  };

  $(window).scroll(function () {
    if ($(window).scrollTop() >= $(document).height() - $(window).height()) {
      page++;
      search_flickr();
    }
  });


  $('#search_flickr').on('click', function () {page = 1; clear_flickr(); search_flickr()});
  $('#clear_images').on('click', clear_flickr);

});