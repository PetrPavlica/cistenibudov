<?php


class CarsForm extends Nette\Application\UI\Control
{
    private $carsData;
    
    private $factory;

    public $onCarsSave;
    
    private $id=0;
            
    public function __construct(App\Model\CarsModel $carsData,\App\Forms\FormFactory $factory)
    {
        
        $this->carsData = $carsData;
        $this->factory = $factory;
        }
    
    public function handleedit($id){
        $data_default = $this->peopleData->peopleById($id);
        $this['peopleForm']->setDefaults($data_default);
        $this->id = $id;
    }
    
    public function createComponentCarsForm() 

    {
        $form = $this->factory->create();
        
        $form->addText('name','Jméno:')
                        ->setRequired('Zadejte jméno');
                
        $form->addText('spz','SPZ:')
                        ->setRequired('Zadejte spz');
                     
        $form->addHidden('id',$this->id);
        
        $form->addSubmit('send', 'Uložit')
        ->setAttribute('class', 'btn btn-info btn-sm');   

       
        $form->onSuccess[] = [$this, 'processForm'];
        return $form;
    }

    public function processForm($form)
    {
        $data = $form->getValues();       
        if($form['id']->getValue() == 0){
            $save = $this->carsData->addCar($data);
        }
        else{
            $save = $this->peopleData->updateCar($form['id']->getValue(),$data);
        }
        $this->onCarsSave($this, $save);

    }
    
    public function render(){
       $this->template->render(__DIR__ .'/carsform.latte');
       //$this->template->render();
    }
}

/** rozhrannĂ­ pro generovanou tovĂˇrniÄŤku */
interface ICarsFormFactory
{
    /** @return \CarsForm */
    function create();
}
