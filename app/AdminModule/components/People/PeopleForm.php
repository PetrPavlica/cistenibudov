<?php

use App\Model\PeopleModel;
use Nette\Utils\Image;
use Nette\Security\Passwords;
class PeopleForm extends Nette\Application\UI\Control
{
    private $peopleData;
    
    private $factory;
    
    private $dir;
    private $passwords;        
    public $onPeopleFormSave;
    
    private $id=0;
            
    public function __construct(Nette\Security\Passwords $passwords,App\Model\PeopleModel $peopleData,\App\Forms\FormFactory $factory,$dir)
    {
        $this->passwords = $passwords;
        $this->peopleData = $peopleData;
        $this->factory = $factory;
        $this->dir = $dir;
    }
    
    public function handleedit($id){
        $data_default = $this->peopleData->peopleById($id);
        $this['peopleForm']->setDefaults($data_default);
        $this->id = $id;
    }
    
    public function createComponentPeopleForm() 

    {
        $form = $this->factory->create();
        
        $form->addText('name','Jméno:')
                        ->setRequired('Zadejte jméno');
                
        $form->addText('phone','Telefon:')
                        ->setRequired('Zadejte telefon');
        
        $form->addText('email','Email:')
                        ->setRequired('Zadejte email');
               
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
            $save = $this->peopleData->addPeople($data);
        }
        else{
            $save = $this->peopleData->updatePeople($form['id']->getValue(),$data);
        }
        $this->onPeopleFormSave($save);

    }
    
    public function render(){
       $this->template->render(__DIR__ .'/peopleform.latte');
       //$this->template->render();
    }
}

/** rozhrannĂ­ pro generovanou tovĂˇrniÄŤku */
interface IPeopleFormFactory
{
    /** @return \PeopleForm */
    function create($dir);
}
