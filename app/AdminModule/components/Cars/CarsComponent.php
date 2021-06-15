<?php

class CarsComponent extends Nette\Application\UI\Control
{
    private $carsData;
    
    public function __construct(App\Model\CarsModel $carsData)
    {
        $this->carsData = $carsData;
    }
    
    public function render():void{
        
        $allCars = $this->carsData->allCars();
        $this->template->allCars = $allCars;
        $this->template->render(__DIR__ .'/allcars.latte');
    }
}

/** creator */
interface ICarsFactory
{
    /** @return \CarsComponent */
    function create();
}

