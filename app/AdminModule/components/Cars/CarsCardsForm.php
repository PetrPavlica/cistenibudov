<?php


class CarsCardsForm extends Nette\Application\UI\Control
{
    private $carsData;
    
    private $factory;

    public $onCarsCardsSave;
    
    private $id=0;
            
    public function __construct(App\Model\CarsModel $carsData,\App\Forms\FormFactory $factory,$id)
    {
        
        $this->carsData = $carsData;
        $this->factory = $factory;
        $this->id = $id;
        }
    
    public function handleedit($id){
        $data_default = $this->peopleData->peopleById($id);
        $this['peopleForm']->setDefaults($data_default);
        $this->id = $id;
    }
    
    public function createComponentCarsCardsForm() 

    {
        $form = $this->factory->create();
        
        $form->addText('pay','Zaplatit:')
                        ->setRequired('Zadejte platbu');
        
        $form->addText('pay_people','Zaplatit řidičem:')
                        ->setRequired('Zadejte platbu');
        
        $people=$this->carsData->peopleSelector();
        
        $form->addSelect('people_id','Spoluucast:',$people)
                ->setPrompt('Nikdo');
        
        $form->addText('date_from','Datum:')
                ->setRequired('Zadejte datum');
        
        $form->addText('date_to','Datum do:')
                ->setRequired('Zadejte datum');
        
        $form->addHidden('id',$this->id);
        
        $form->addSubmit('send', 'Uložit')
        ->setAttribute('class', 'btn btn-info btn-sm');   

       
        $form->onSuccess[] = [$this, 'processForm'];
        return $form;
    }

    public function processForm($form)
    {
        $data = $form->getValues();
        $data_save = array('car_id'=>$data['id'],
                            'pay'=>$data['pay'],
                            'pay_people'=>$data['pay'],
                            'people_id'=>$data['people_id'],
                            'date_from'=>$data['date_from'],
                            'date_to'=>$data['date_to']);
        $save = $this->carsData->addCards($data_save);
       
        $this->onCarsCardsSave($this, $save);

    }
    
    public function render(){
    $all_cards = $this->carsData->allCards($this->id);
    $this->template->people = $this->carsData->peopleSelector();
       $this->template->all_cards = $all_cards;
       $this->template->render(__DIR__ .'/carscardsform.latte');
       //$this->template->render();
    }
}

/** rozhrannĂ­ pro generovanou tovĂˇrniÄŤku */
interface ICarsCardsFormFactory
{
    /** @return \CarsCardsForm */
    function create($id);
}
