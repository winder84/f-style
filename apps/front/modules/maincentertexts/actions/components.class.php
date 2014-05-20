<?php
/**
 * Текст в центре на главной components
 * 
 * No redirection nor database manipulation ( insert, update, delete ) here
 */
class maincentertextsComponents extends myFrontModuleComponents
{

  public function executeList()
  {
    $query = $this->getListQuery();
    
    $this->maincentertextsPager = $this->getPager($query);
  }


}
