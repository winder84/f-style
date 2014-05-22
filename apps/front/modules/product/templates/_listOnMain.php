<?php // Vars: $productPager

foreach ($productPager as $product) {
	if ($product->is_on_main) {
		$products[] = $product;
	}
}


echo _open('ul.main_products');
	echo _tag('h3', 'Некоторые из наших заказчиков');
	foreach ($products as $key => $product)
	{
		if ($key < 5) {
			echo _open('li.element');
				echo _tag('div.product_logos#logo_' . $product->id, _media($product->Logo)->height(95));
			echo _close('li');
			echo _tag('div.slide_li_hidden.product_agent#main_product_agent_' . $product->id, $product->agent);
			echo _tag('div.slide_li_hidden.product_agent_text#main_product_agent_text_' . $product->id, $product->agent_text);
			$keys[] = $product->id;
			$agent_media[$product->id] = $product->getDmGallery();
		}
	}
	echo _tag('div.horDelimer.main_products_del');
	echo _open('ul.agent_ul');
		echo _open('li.agent_first_li');
			echo _tag('h3#product_agent');
			echo _tag('div#product_agent_text');
		echo _close('li');
		echo _open('li.agent_second_li');
			foreach ($keys as $key) {
				echo _open('ul.agent_medias#media_' . $key);
					foreach ($agent_media[$key] as $media) {
						echo _tag('li', _media($media)->size(150, 100)->method('fit'));
					}
				echo _close('ul');
			}
		echo _close('li');
	echo _close('ul');
echo _close('ul');

//			foreach($product->getDmGallery() as $mKey => $media)
//			{
//				if ($mKey < 6) {
//					echo _open('li.element');
//						echo _media($media)->size(150, 150);
//					echo _close('li');
//				}
//			}
