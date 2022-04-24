<?php


class PeoplePrepayForm extends Nette\Application\UI\Control
{
    private $peopleData;
    
    private $factory;

    public $onPeopleBonusSave;
    
    private $id=0;
            
    public function __construct(App\Model\peopleModel $peopleData,\App\Forms\FormFactory $factory,$id)
    {
        
        $this->peopleData = $peopleData;
        $this->factory = $factory;
        $this->id = $id;
        }
    
    public function handleedit($id){
        $data_default = $this->peopleData->peopleById($id);
        $this['peopleForm']->setDefaults($data_default);
        $this->id = $id;
    }
    
    public function createComponentPeoplePrepayForm() 

    {
        $form = $this->factory->create();
        
        $form->addInteger('pay','Platba')
                        ->setRequired('Zaloha');
        
        $form->addText('date','Datum')
                        ->setRequired('Zaloha');
               
        $form->addHidden('people_id',$this->id);
        
        $form->addSubmit('send', 'Uložit')
        ->setAttribute('class', 'btn btn-info btn-sm');   

       
        $form->onSuccess[] = [$this, 'processForm'];
        return $form;
    }

    public function processForm($form)
    {
        $data = $form->getValues();       
        $data_save = array('people_id'=>$data['people_id'],
                           'pay'=>$data['pay'],
                           'date'=>$data['date']
                           );
                            
        $save = $this->peopleData->addPeoplePrepay($data_save);
       
        $this->onPeopleBonusSave($this, $save);

    }
    
    public function render(){
       $this->template->people = $this->peopleData->peopleSelector(); 
       $this->template->all_prepay = $this->peopleData->allPrepayPeople($this->id);
       $this->template->render(__DIR__ .'/peopleprepayform.latte');
       //$this->template->render();
    }
}

/** rozhrannĂ­ pro generovanou tovĂˇrniÄŤku */
interface IPeoplePrepayFormFactory
{
    /** @return \PeoplePrepayForm */
    function create($id);
}
