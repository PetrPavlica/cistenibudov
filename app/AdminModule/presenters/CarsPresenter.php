<?php
namespace AdminModule;

class CarsPresenter extends BasePresenter{
    
        
    /** @var \ICarsFormFactory @inject */
    public $carsFormControl;
    
   
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
    
    
    public function renderCars():void{
        
        
    }
    
    
    
    
}
