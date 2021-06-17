<?php
namespace AdminModule;

class PeoplePresenter extends BasePresenter{
    
    /** @var \IPeopleFactory @inject */
    public $peopleControl;
      
    /** @var \IPeopleFormFactory @inject */
    public $peopleFormControl;
    
    /** @var \IPeopleInfFormFactory @inject */
    public $peopleInfFormControl;
    
    /** @var \IBoltDataFormFactory @inject */
    public $boltDataFormControl;
    
    /** @var \App\Model\PeopleModel @inject */
     public $peopleData;
    
    protected function createComponentBoltDataForm(): \BoltDataForm {
        
        $component = $this->boltDataFormControl->create($this->getParameter('wwwDir'));
        return $component;
    }
     
    protected function createComponentPeople(): \PeopleComponent {
        
        $component = $this->peopleControl->create();
        
        return $component;
    }
    
    protected function createComponentPeopleInfForm(): \PeopleInfForm {
        
        $component = $this->peopleInfFormControl->create($this->getParameter('wwwDir'),$this->getParameter('id'));
        return $component;
    }
    
    protected function createComponentPeopleForm(): \PeopleForm {
        
        $component = $this->peopleFormControl->create($this->getParameter('wwwDir'));
        $component->onPeopleFormSave[] = function ($data) {
                    $this->redirect('People:peopleinf',$data['id']);
		};
        return $component;
    }
    
    
    public function renderPeople():void{
        
        
    }
    
    public function renderBoltdata():void{
        
        
    }
    public function renderPeopleInf($id):void{
        
        
    }
    
}
