<?php // Vars: $sliderPager

//echo $sliderPager->renderNavigationTop();

echo _open('ul.feel_slider');
	foreach ($sliderPager as $key => $slider)
	{
		if ($key == 0) {
			echo _open('li.element#slide_' . $key);
				echo _media($slider->Image);
			echo _close('li');
		} else {
			echo _open('li.element.slide_li_hidden#slide_' . $key);
				echo _media($slider->Image);
			echo _close('li');
		}
	}
	echo _open('div.slide_arrows');
		echo _tag('div.slide_arrow.slide_left', _media('slide_left.png'));
		echo _tag('div.slide_arrow.slide_right', _media('slide_right.png'));
	echo _close('div');
echo _close('ul');

echo _open('ul.slider_points');
	foreach ($sliderPager as $key => $slider) {
		echo _tag('li.slider_point#slide_point_' . $key, _media('point_grey.png'));
	}
echo _close('ul');

echo _tag('div.horDelimer');
//echo $sliderPager->renderNavigationBottom();