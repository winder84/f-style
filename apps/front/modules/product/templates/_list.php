<?php // Vars: $productPager

echo _tag('div.portfolio_header_line');

foreach ($productPager as $product)
{
	$categoryList[$product->Category->id] = $product->Category;
}

echo _open('ul.portfolioHeaderUl');
	echo _open('ul.portfolioCategoryUl');
	asort($categoryList);
		foreach ($categoryList as $key => $category)
		{
			if ($key == 1) {
				echo _tag('li.active.categoryLink', array('categoryId' => $key), $category);
			} else {
				echo _tag('li.categoryLink', array('categoryId' => $key), $category);
			}
			echo _tag('br');
		}
	echo _close('ul');
	echo _open('ul.portfolioTextUl');
		echo _tag('li.portfolioTitle', 'Некоторые из наших работ');
		echo _tag('li.portfolioDescription', 'Настоящие шедевры текстильного дизайна собраны для Вас в нашем Каталоге. Ознакомится с работами вы можете  кликнув на соответствующий раздел салона штор');
	echo _close('ul');
echo _close('ul');
echo _tag('div.horDelimer');

echo _open('ul.portfolioUl');
	foreach ($productPager as $product)
	{
		echo _open('li.portfolioProduct#categoryId_' . $product->Category->id);
			echo _open('div.productBlock');
				if ($product->Logo != '') {
					echo _media($product->Logo)->size(160, 95)->method('fit');
				} else {
					echo _tag('h4', $product);
				}
				echo _tag('p', $product->description);
			echo _close('div');
			echo _open('ul.productBlock.galleryUl');
				foreach($product->getDmGallery() as $media)
				{
					echo _media($media)->size(160, 95)->method('fit');
				}
			echo _close('ul');
			echo _tag('div.horDelimer');
		echo _close('li');
	}
echo _close('ul');

echo _tag('div.portfolioFake');
