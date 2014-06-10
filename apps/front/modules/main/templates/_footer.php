<?php

echo _open('ul.footerLogo');
	echo _tag('li', _tag('p.footer_text', 'Чувство стиля'));
	echo _tag('li.footer_logo', _media('header_logo.png')->height(70)->method('fit'));
echo _close('ul');
?>