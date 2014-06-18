<?php
/**
 * Contact actions
 */
class contactActions extends myFrontModuleActions
{

	public function executeFormWidget(dmWebRequest $request)
	{
		$form = $this->forms['Contact'];

		if ($request->isMethod('post') && $form->bindAndValid($request))
		{
			$form->save();
			$this->redirectBack();
		}
	}

}
