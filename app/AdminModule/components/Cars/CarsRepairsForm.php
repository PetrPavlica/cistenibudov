<?php


class CarsRepairsForm extends Nette\Application\UI\Control
{
    private $carsData;
    
    private $factory;

    public $onCarsRepairsSave;
    
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
        
        $form->addText('repair_what','Oprava:')
                        ->setRequired('Zadejte opravu');
                
        $form->addText('pay','Zaplatit:')
                        ->setRequired('Zadejte platbu');
        
        $form->addText('pay_people','Zaplatit řidičem:')
                        ->setRequired('Zadejte platbu');
       
        $form->addCheckbox('prepay_check')
	->addCondition($form::EQUAL, true)
		->toggle('prepay');

        $form->addInteger('from_prepay')
                ->setDefaultValue(0);
        
        $people=$this->carsData->peopleSelector();
        
        $form->addSelect('people_id','Spoluucast:',$people)
                ->setPrompt('Nikdo');
        
        $form->addText('date','Datum:')
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
                           'repair_what'=>$data['repair_what'],
                           'pay'=>$data['pay'],
                           'pay_people'=>$data['pay'],
                           'prepay_check' =>$data['prepay_check'],
                           'from_prepay' =>$data['from_prepay'],
                           'people_id'=>$data['people_id'],
                           'date'=>$data['date']);
        $data_prepay = array(
                           'people_id'=>$data['people_id'],
                           'pay'=>$data['from_prepay']*(-1),
                           'date'=>$data['date'],
                           );
        if($data['prepay_check']==true){
            $this->carsData->addPeoplePrepay($data_prepay);
        }
        $save = $this->carsData->addRepairs($data_save);
       
        $this->onCarsRepairsSave($this, $save);

    }
    
    public function render(){
    $all_repairs = $this->carsData->allRepairs($this->id);
    $this->template->people = $this->carsData->peopleSelector();
       $this->template->all_repairs = $all_repairs;
       $this->template->render(__DIR__ .'/carsrepairsform.latte');
       //$this->template->render();
    }
}

/** rozhrannĂ­ pro generovanou tovĂˇrniÄŤku */
interface ICarsRepairsFormFactory
{
    /** @return \CarsRepairsForm */
    function create($id);
}
