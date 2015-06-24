<?php // Vars: $maincentertextsPager

echo $maincentertextsPager->renderNavigationTop();

echo _open('ul.mainCenterTexts');

foreach ($maincentertextsPager as $key => $maincentertexts)
{
	if ($key < 3 ) {
		echo _open('li.element');
			echo _tag('h2.mainCenterTextsTitle', $maincentertexts);
			echo _tag('p.mainCenterText', $maincentertexts->description);
		echo _close('li');
	}
}

echo _close('ul');
echo _tag('div.mainFake');

echo $maincentertextsPager->renderNavigationBottom();