<?php
namespace AdminModule;

class PeoplePresenter extends BasePresenter{
    
        
    /** @var \ICarsFormFactory @inject */
    public $CarsFormControl;
    
   
    /** @var \App\Model\CarsModel @inject */
     public $carsData;
    
   
   /*  
    protected function createComponentPeople(): \PeopleComponent {
        
        $component = $this->peopleControl->create();
        return $component;
    }
    */
        
    protected function createComponentCarsForm(): \CarsForm {
        
        $component = $this->carsFormControl->create();
        return $component;
    }
    
    
    public function renderPeople():void{
        
        
    }
    
    
    
    
}
