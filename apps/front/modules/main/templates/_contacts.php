<?php

echo _open('div.contactsTextMapDiv');
	echo _open('ul.contactsTExtUl');
		echo _open('li');
			echo _tag('h2', 'Как нас найти?');
			echo _tag('p', 'Салон-магазин "Чувство стиля" находится по адресу <br />г.Кисловодск, ул. 40 Лет Октября 26');
		echo _close('li');
		echo _open('li.contactsRightLi');
			echo _tag('h2', 'График работы');
			echo _tag('p', 'пнд. - птн.: 9:00-18:00 <br />сб. - вск.: 10:00-17:00 ');
		echo _close('li');
	echo _close('ul');
	echo _tag('div.contactsMap');
	echo _open('p.contactsPhonesP');
		echo 'Если вы хотите посетить наш шоу рум, просьба предварительно <br />
		 созвониться с менеджером, и договориться о времени встречи, <br />
		 чтобы дизайнер был на месте и смог ответить на все интересующие вопросы:<br />';
		echo '<br />+7(928)348-15-01<br />';
		echo '+7(938)301-89-69<br />';
		echo '8(87937)7-09-65<br />';
	echo _close('p');
echo _close('div');
echo _tag('div.horDelimer');
