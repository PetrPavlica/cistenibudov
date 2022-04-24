<?php


class CarsChangesForm extends Nette\Application\UI\Control
{
    private $carsData;
    
    private $factory;

    public $onCarsChangesSave;
    
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
    
    public function createComponentCarsRepairsForm() 

    {
        $form = $this->factory->create();
        
        $form->addText('changes_what','Oprava:')
                        ->setRequired('Zadejte opravu');
                
        $form->addText('pay','Zaplatit:')
                        ->setRequired('Zadejte platbu');
        
        $form->addText('pay_people','Zaplatit řidičem:')
                        ->setRequired('Zadejte platbu');
        
        $people=$this->carsData->peopleSelector();
        
        $form->addSelect('people_id','Spoluucast:',$people)
                ->setPrompt('Nikdo');
        
        $form->addText('date','Datum:')
                ->setRequired('Zadejte datum');
        
        $form->addText('date_next','Datum příští výměny:')
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
                            'changes_what'=>$data['repair_what'],
                           'pay'=>$data['pay'],
                            'pay_people'=>$data['pay'],
                            'people_id'=>$data['people_id'],
                            'date'=>$data['date'],
                            'date_next'=>$data['date_next']);
        $save = $this->carsData->addChanges($data_save);
       
        $this->onCarsChangesSave($this, $save);

    }
    
    public function render(){
    $all_changes = $this->carsData->allChanges($this->id);
    $this->template->people = $this->carsData->peopleSelector();
       $this->template->all_repairs = $all_changes;
       $this->template->render(__DIR__ .'/carschangesform.latte');
       //$this->template->render();
    }
}

/** rozhrannĂ­ pro generovanou tovĂˇrniÄŤku */
interface ICarsChangesFormFactory
{
    /** @return \CarsChangesForm */
    function create($id);
}
