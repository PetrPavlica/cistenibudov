<?php
namespace AdminModule;

class CarsPresenter extends BasePresenter{
    
        
    /** @var \ICarsFormFactory @inject */
    public $carsFormControl;
    
    /** @var \ICarsPeopleFormFactory @inject */
    public $carsPeopleFormControl;
    
    /** @var \ICarsWheelsFormFactory @inject */
    public $carsWheelsFormControl;
    
    /** @var \ICarsRepairsFormFactory @inject */
    public $carsRepairsFormControl;
    
    /** @var \ICarsCardsFormFactory @inject */
    public $carsCardsFormControl;
    
    /** @var \ICarsCrashesFormFactory @inject */
    public $carsCrashesFormControl;
    
    /** @var \ICarsFactory @inject */
    public $carsControl;
    
    /** @var \ICarFactory @inject */
    public $carControl;
   
    /** @var \App\Model\CarsModel @inject */
     public $carsData;
    
   
     
    protected function createComponentCars(): \CarsComponent {
        
        $component = $this->carsControl->create();
        return $component;
    }
    
    protected function createComponentCar(): \Car {
        
        $component = $this->carControl->create($this->getParameter('id'));
        return $component;
    }
    protected function createComponentCarsCrashesForm(): \CarsCrashesForm {
        
        $component = $this->carsCrashesFormControl->create($this->getParameter('id'));
        return $component;
    }
    
    protected function createComponentCarsWheelsForm(): \CarsWheelsForm {
        
        $component = $this->carsWheelsFormControl->create($this->getParameter('id'));
        return $component;
    }
    
    protected function createComponentCarsRepairsForm(): \CarsRepairsForm {
        
        $component = $this->carsRepairsFormControl->create($this->getParameter('id'));
        return $component;
    }
    
    protected function createComponentCarsCardsForm(): \CarsCardsForm {
        
        $component = $this->carsCardsFormControl->create($this->getParameter('id'));
        return $component;
    }
    
    protected function createComponentCarsPeopleForm(): \CarsPeopleForm {
        
        $component = $this->carsPeopleFormControl->create($this->getParameter('id'));
        return $component;
    }
    
    
    protected function createComponentCarsForm(): \CarsForm {
        
        $component = $this->carsFormControl->create();
        return $component;
    }
    
    
    public function renderCars():void{
        
        
    }
    
    public function renderCar($id):void{
        
        
    }
    
    
}
