<?php
namespace AdminModule;

class PeoplePresenter extends BasePresenter{
    
    public $day = NULL;
    
    /** @var \IPeopleFactory @inject */
    public $peopleControl;
    
    /** @var \IBoltFactory @inject */
    public $boltControl;
    
    /** @var \IPeopleFormFactory @inject */
    public $peopleFormControl;

    /** @var \IPeopleBonusFormFactory @inject */
    public $peopleBonusFormControl;
    
    /** @var \IPeoplePrepayFormFactory @inject */
    public $peoplePrepayFormControl;
    
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
    
    protected function createComponentBolt(): \Bolt {
        
        $component = $this->boltControl->create();
        
        return $component;
    }
    
    protected function createComponentPeopleInfForm(): \PeopleInfForm {
        
        $component = $this->peopleInfFormControl->create($this->getParameter('wwwDir'),$this->getParameter('id'));
        return $component;
    }
    
    protected function createComponentPeopleBonusForm(): \PeopleBonusForm {
        
        $component = $this->peopleBonusFormControl->create($this->getParameter('id'));
       return $component;
    }
    
    protected function createComponentPeoplePrepayForm(): \PeoplePrepayForm {
        
        $component = $this->peoplePrepayFormControl->create($this->getParameter('id'));
       return $component;
    }
    
    protected function createComponentPeopleForm(): \PeopleForm {
        
        $component = $this->peopleFormControl->create($this->getParameter('wwwDir'));
        $component->onPeopleFormSave[] = function ($data) {
                    $this->redirect('People:peopleinf',$data['id']);
		};
        return $component;
    }
     public function actionprevweek($id,$day){
        $date = strtotime("-6 day", $day);
        $this->day = $date;
    }
    public function actionnextweek($day){
        
        $this->day = $day;
    }
    public function renderPeople():void{
        
        
    }
    
    public function renderBoltdata():void{
        
        
    }
    public function renderPeopleInf($id):void{
        
        
    }
    
    public function renderDriver($id,$day,$make):void{
        $prepay_sum = 0;
        $driver_data = $this->peopleData->peopleById($id);
        if($day == null){
          $day =  strtotime('monday this week');
        }
        bdump($driver_data);
        if($make=='prev'){
            $day = strtotime("-7 day", $day);
        }
        if($make=='next'){
            $day = strtotime("+7 day", $day);
        }
        
        $date = strtotime("+6 day", $day);
        $date_start = date('Y-m-d',$day);
        $date_end = date('Y-m-d',$date);
        $all_prepay = $this->peopleData->allPrepayDriver($id);
        foreach($all_prepay as $prepay){
            $prepay_sum = $prepay_sum + $prepay['pay'];
        }
        
        $all_crashes = $this->peopleData->getCrashDateDriver($id, $date_start, $date_end);
        $all_repairs = $this->peopleData->getRepairsDateDriver($id, $date_start, $date_end);
        $this->template->all_crashes = $all_crashes;
        $this->template->all_repairs = $all_repairs;
        $this->template->day = $day;
        $this->template->date_start = $date_start;
        $this->template->date_end = $date_end;
        $this->template->all_prepay = $all_prepay;
        $this->template->prepay_sum = $prepay_sum;
        $this->template->id = $id;
    }
}
