<?php
namespace AdminModule;

class CarsPresenter extends BasePresenter{
    
        
    /** @var \ICarsFormFactory @inject */
    public $carsFormControl;
    
    /** @var \ICarsFactory @inject */
    public $carsControl;
   
    /** @var \App\Model\CarsModel @inject */
     public $carsData;
    
   
     
    protected function createComponentCars(): \CarsComponent {
        
        $component = $this->carsControl->create();
        return $component;
    }
    
        
    protected function createComponentCarsForm(): \CarsForm {
        
        $component = $this->carsFormControl->create();
        return $component;
    }
    
    
    public function renderCars():void{
        
        
    }
    
    
    
    
}
