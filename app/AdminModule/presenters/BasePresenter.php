<?php
namespace AdminModule;
use Nette;
use Nette\Security\User;

class BasePresenter extends \Nette\Application\UI\Presenter {
   
       
   public function startup() {
        parent::startup();
           if(!$this->user->isLoggedIn()){
               $this->redirect('Start:default');
           }
   }   
   public function beforeRender() {
        $this->setLayout('layoutSignAdmin');
              
   }
   
   public function __construct()
        {
            
            
        }  
}     

