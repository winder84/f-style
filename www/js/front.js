(function($)
{
	$(document).ready(function(){
		sliderInterval = setInterval(sliderNext, 6000);
		$('.slider_point:first').children('img').attr('src', '/theme/images/point_black.png');
	});
	$('.slide_left img')
		.mouseover(function() {
			$(this).attr('src', '/theme/images/slide_left_hover.png')
		})
		.mouseout(function() {
			$(this).attr('src', '/theme/images/slide_left.png')})
		.click(sliderPrev)
	;
	$('.slide_right img')
		.mouseover(function() {
			$(this).attr('src', '/theme/images/slide_right_hover.png')
		})
		.mouseout(function() {
			$(this).attr('src', '/theme/images/slide_right.png')})
		.click(sliderNext)
	;
	// Here is the entry point for your front javascript

	function sliderNext() {
		$('.feel_slider li:visible').fadeOut(500, function() {
			$(this).addClass('slide_li_hidden');
			nextSlide = $(this).next('li');
			if(nextSlide.length == 0) {
				nextSlide = $('.feel_slider li:first');
			}
			id = nextSlide.attr('id').replace('slide_', '');
			$('.slider_point').children('img').attr('src', '/theme/images/point_grey.png');
			$('#slide_point_' + id).children('img').attr('src', '/theme/images/point_black.png');
			nextSlide.fadeIn(500, function() {
				$(this).removeClass('slide_li_hidden');
			});
		});
		clearInterval(sliderInterval)
		sliderInterval = setInterval(sliderNext, 6000);
	}

	function sliderPrev() {
		$('.feel_slider li:visible').fadeOut(500, function() {
			$(this).addClass('slide_li_hidden');
			nextSlide = $(this).prev('li');
			if(nextSlide.length == 0) {
				nextSlide = $('.feel_slider li:last');
			}
			id = nextSlide.attr('id').replace('slide_', '');
			$('.slider_point').children('img').attr('src', '/theme/images/point_grey.png');
			$('#slide_point_' + id).children('img').attr('src', '/theme/images/point_black.png');
			nextSlide.fadeIn(500, function() {
				$(this).removeClass('slide_li_hidden');
			});
		});
		clearInterval(sliderInterval)
		sliderInterval = setInterval(sliderNext, 6000);
	}
})(jQuery);
