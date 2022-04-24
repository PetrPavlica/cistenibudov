<?php

class Bolt extends Nette\Application\UI\Control
{
    private $peopleData;
    
    public function __construct(App\Model\PeopleModel $peopleData)
    {
        $this->peopleData = $peopleData;
    }
    
    public function render():void{
        
        $allBolt = $this->peopleData->allBolt();
        
        $this->template->allBolt = $allBolt;
        
        $this->template->render(__DIR__ .'/allbolt.latte');
    }
}

/** creator */
interface IBoltFactory
{
    /** @return \Bolt */
    function create();
}
