<?php // Vars: $productPager

echo _tag('div.portfolio_header_line');

foreach ($productPager as $product)
{
	$categoryList[$product->Category->id] = $product->Category;
}

echo _open('ul.portfolioHeaderUl');
	echo _open('ul.portfolioCategoryUl');
		asort($categoryList);
		$i = 0;
		foreach ($categoryList as $key => $category)
		{
			if ($category->is_material_category) {
				if ($i == 0) {
					echo _tag('li.active.categoryLink', array('categoryId' => $key), $category);
					$i++;
				} else {
					echo _tag('li.categoryLink', array('categoryId' => $key), $category);
				}
				echo _tag('br');
			}
		}
	echo _close('ul');
	echo _open('ul.portfolioTextUl');
		echo _tag('li.portfolioTitle', 'Некоторые из наших работ');
		echo _tag('li.portfolioDescription', 'Настоящие шедевры текстильного дизайна собраны для Вас в нашем Каталоге. Ознакомится с работами вы можете  кликнув на соответствующий раздел салона штор');
	echo _close('ul');
echo _close('ul');
echo _tag('div.horDelimer');

echo _open('ul.portfolioUl');
foreach ($productPager as $pKey => $product)
{
	echo _open('li.portfolioProduct#categoryId_' . $product->Category->id);
	if ($product->is_material) {
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
			echo _tag('a.toFancy', array('href' => '/uploads/' . $media, 'rel' => 'group_' . $pKey), _media($media)->size(160, 95)->method('fit'));
		}
		echo _close('ul');
		echo _tag('div.horDelimer');
	}
	echo _close('li');
}
echo _close('ul');

