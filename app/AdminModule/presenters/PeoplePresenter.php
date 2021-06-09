<?php
namespace AdminModule;

class PeoplePresenter extends BasePresenter{
    
    /** @var \IPeopleFactory @inject */
    public $peopleControl;
      
    /** @var \IPeopleFormFactory @inject */
    public $peopleFormControl;
    
    /** @var \App\Model\PeopleModel @inject */
     public $peopleData;
    
    protected function createComponentPeople(): \PeopleComponent {
        
        $component = $this->peopleControl->create();
        return $component;
    }
    
        
    protected function createComponentPeopleForm(): \PeopleForm {
        
        $component = $this->peopleFormControl->create($this->getParameter('wwwDir'));
        return $component;
    }
    
    
    public function renderPeople():void{
        
        
    }
    
    
}