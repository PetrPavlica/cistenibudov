<?php


class CarsCrashesForm extends Nette\Application\UI\Control
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
    
    public function handleedit($id){
        $data_default = $this->peopleData->peopleById($id);
        $this['peopleForm']->setDefaults($data_default);
        $this->id = $id;
    }
    
    public function createComponentCarsCrashesForm() 

    {
        $form = $this->factory->create();
        
        $form->addText('pay','Zaplatit řidičem:')
                        ->setRequired('Zadejte platbu');
        
        $form->addText('pay_people','Zaplatit řidičem:')
                        ->setRequired('Zadejte platbu');
        
        $people=$this->carsData->peopleSelector();
        
        $form->addSelect('people_id','Spoluucast:',$people)
                ->setPrompt('Nikdo');
        
        $form->addCheckbox('prepay_check')
	->addCondition($form::EQUAL, true)
		->toggle('prepay');

        $form->addInteger('from_prepay')
                ->setDefaultValue(0);
        
        $form->addText('date','Datum:')
                ->setRequired('Zadejte datum');
        
        $form->addTextArea('text','Text:');
        
        
        $form->addHidden('id',$this->id);
        
        $form->addSubmit('send', 'Uložit')
        ->setAttribute('class', 'btn btn-info btn-sm');   

       
        $form->onSuccess[] = [$this, 'processForm'];
        return $form;
    }

    public function processForm($form)
    {
        $data = $form->getValues(); 
        $data_save = array(
                           'car_id'=>$data['id'],
                           'pay'=>$data['pay'],
                           'pay_people'=>$data['pay_people'],
                           'prepay_check' =>$data['prepay_check'],
                           'from_prepay' =>$data['from_prepay'],
                           'people_id'=>$data['people_id'],
                           'date'=>$data['date'],
                           'text'=>$data['text']);
        $data_prepay = array(
                           'people_id'=>$data['people_id'],
                           'pay'=>$data['from_prepay']*(-1),
                           'date'=>$data['date'],
                           );
        if($data['prepay_check']==true){
            $this->carsData->addPeoplePrepay($data_prepay);
        }
        $save = $this->carsData->addCrashes($data_save);
       
        $this->onCarsSave($this, $save);

    }
    
    public function render(){
    $all_crashes = $this->carsData->allCrashes($this->id);
    $this->template->people = $this->carsData->peopleSelector();
       $this->template->all_crashes = $all_crashes;
       $this->template->render(__DIR__ .'/carscrashesform.latte');
       //$this->template->render();
    }
}

/** rozhrannĂ­ pro generovanou tovĂˇrniÄŤku */
interface ICarsCrashesFormFactory
{
    /** @return \CarsCrashesForm */
    function create($id);
}
