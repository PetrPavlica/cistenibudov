<?php

class Car extends Nette\Application\UI\Control
{
    private $carsData;
    
    private $id;
    
    public function __construct(App\Model\CarsModel $carsData,$id)
    {
        $this->carsData = $carsData;
        $this->id = $id;
    }
    
    public function render():void{
        
        $car = $this->carsData->carById($this->id);
        $this->template->car = $car;
        $this->template->render(__DIR__ .'/car.latte');
    }
}

/** creator */
interface ICarFactory
{
    /** @return \Car */
    function create($id);
}