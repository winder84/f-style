<?php
/**
 * Slider components
 * 
 * No redirection nor database manipulation ( insert, update, delete ) here
 * 
 */
class sliderComponents extends myFrontModuleComponents
{

  public function executeShow()
  {
    $query = $this->getShowQuery();
    
    $this->slider = $this->getRecord($query);
  }

  public function executeList()
  {
    $query = $this->getListQuery();
    
    $this->sliderPager = $this->getPager($query);
  }


}
