<?php // Vars: $form

echo _open('div.contForm');
	echo _tag('h2', 'Обратная связь');
	echo $form->open('.feedback_form');
	echo _tag('table.contact_form_table',
		_tag('tr',
			_tag('td',
				'Имя<span style="color: red;">*</span> :<br />'. $form['name']->field()->error() . '<br />' .
				'Электронная почта<span style="color: red;">*</span>:<br />' . $form['email']->field()->error() . '<br />' .
				$form->submit('Отправить')) .
			_tag('td',
				'Сообщение:<br />' .
				$form['body']->field()->error())
		)
	);
	echo '<input hidden="hidden" style="display: none;" name="botScan" id="botScan" value="">';
	echo $form->renderHiddenFields();

	// close the form tag
	echo $form->close();
echo _close('div');
echo _tag('div.contactsPodl');
