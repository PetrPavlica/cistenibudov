<?php

namespace App\Model;

class CarsModel extends BaseModel{
    
    public function allPeople() {
       return $this->database->table('people');
    }
    
    public function allPeopleActive() {
       return $this->database->table('people')->where('active',1);
   }
    
   public function updatePeople($id,$data){
       $select = $this->database->table('people')->where('id',$id)->fetch();
       return $select->update($data);
   } 
    
    public function addCar($data){
        return $this->database->table('cars')->insert($data);
    }
    
    public function peopleById($id){
        return $this->database->table('people')->where('id',$id)->fetch();
    }
    
   public function isEmailExist($email){
     $count = $this->database->table('people')->where('email',$email)->count();
     if($count == 0){
        return FALSE; 
     }else{
         return TRUE;
     }
   }
   
   public function saveBolt($data){
      return $this->database->table('bolt_week')->insert($data);
   }
}