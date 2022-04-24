<?php


class CarsPeopleForm extends Nette\Application\UI\Control
{
    private $carsData;
    
    private $factory;

    public $onCarsSave;
    
    private $id=0;
            
    public function __construct(App\Model\CarsModel $carsData,\App\Forms\FormFactory $factory,$id)
    {
        
        $this->carsData = $carsData;
        $this->factory = $factory;
        $this->id = $id;
        }
    
        
    public function createComponentCarsPeopleForm() 

    {
        $form = $this->factory->create();
        $peoples_select = $this->carsData->peopleSelector();
        $form->addSelect('people_id','Auto:',$peoples_select)
                        ->setRequired('Zadejte auto');
        $form->addInteger('pay','Platba')
                        ->setRequired('Zaloha');
        
        $form->addText('date_start','Datum od')
                        ->setRequired('Datum od'); 
        
        $form->addText('date_end','Datum do'); 
        
        $form->addHidden('id',$this->id);
        
        $form->addSubmit('send', 'Uložit')
        ->setAttribute('class', 'btn btn-info btn-sm');   

       
        $form->onSuccess[] = [$this, 'processForm'];
        return $form;
    }

    public function processForm($form)
    {
        $data = $form->getValues();       
        $data_save = array('people_id'=>$data['people_id'],
                           'car_id'=>$data['id'],
                           'pay'=>$data['pay'],
                           'date_start'=>$data['date_start'],
                           'date_end'=>$data['date_end']);
    $data_people = array('car_id'=>$data['id'],
                         'pay_car'=>$data['pay']); 
        $this->carsData->updatePeople($data['people_id'],$data_people);
        $this->carsData->updateCar($data['id'],array('people_id'=>$data['people_id'],
                                                    'pay'=>$data['pay']));
        $save = $this->carsData->addCarPeople($data_save);
       
        $this->onCarsSave($this, $save);

    }
    
    public function render(){
       $this->template->car = $this->carsData->carById($this->id); 
       $this->template->people = $this->carsData->peopleSelector(); 
       $this->template->carpeople = $this->carsData->allCarsPeople($this->id);
       $this->template->render(__DIR__ .'/carspeopleform.latte');
       //$this->template->render();
    }
}

/** rozhrannĂ­ pro generovanou tovĂˇrniÄŤku */
interface ICarsPeopleFormFactory
{
    /** @return \CarsPeopleForm */
    function create($id);
}
