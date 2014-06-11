(function($)
{
	$(document).ready(function(){
		if ($('.feel_slider').length > 0) {
			sliderInterval = setInterval(sliderNext, 6000);
			$('.slider_point:first').children('img').attr('src', '/theme/images/point_black.png');
			agent = $('.product_agent:first').text();
			agent_text = $('.product_agent_text:first').text();
			id = parseInt($('.product_agent:first').attr('id').replace('main_product_agent_', ''));
			$('#media_' + id).fadeIn();
			$('#product_agent').html(agent);
			$('#product_agent_text').html(agent_text);
		}

		if ($('.categoryLink.active').length > 0) {
			categoryId = $('.categoryLink.active').attr('categoryid');
			$('.portfolioProduct#categoryId_' + categoryId).slideDown(100);
		}
	});

	$('.categoryLink').on('click', function () {
		$('.categoryLink.active').removeClass('active');
		$(this).addClass('active');
		$('.portfolioProduct').slideUp(100);
		categoryId = $(this).attr('categoryid');
		$('.portfolioProduct#categoryId_' + categoryId).slideDown(100);
	});

	$('.slide_left img')
		.mouseover(function() {
			$(this).attr('src', '/theme/images/slide_left_hover.png')
		})
		.mouseout(function() {
			$(this).attr('src', '/theme/images/slide_left.png')})
		.click(sliderPrev);
	$('.slide_right img')
		.mouseover(function() {
			$(this).attr('src', '/theme/images/slide_right_hover.png')
		})
		.mouseout(function() {
			$(this).attr('src', '/theme/images/slide_right.png')})
		.click(sliderNext);

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

	$('.product_logos').on('click', function () {
		id = $(this).attr('id').replace('logo_', '');
		$('.agent_medias').fadeOut(10, function () {
			$('#media_' + id).fadeIn(300);
		});
		agent = $('#main_product_agent_' + id).text();
		agent_text = $('#main_product_agent_text_' + id).text();
		$('#product_agent').html(agent);
		$('#product_agent_text').html(agent_text);
	});

	$("a.toFancy").fancybox();
})(jQuery);
