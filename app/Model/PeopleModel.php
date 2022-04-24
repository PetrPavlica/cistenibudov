<?php

namespace App\Model;

class PeopleModel extends BaseModel{
    
    public function allPeople() {
       return $this->database->table('people');
    }
    
    public function allPeopleActive() {
       return $this->database->table('people')->where('active',1);
   }
   
     public function allBonusPeople() {
     return $this->database->table('people_bonus')->fetchAll();
   }
   
     public function allPrepayPeople() {
     return $this->database->table('people_prepay')->fetchAll();
   }
   
     public function allBolt() {
     return $this->database->table('bolt_week')->fetchAll();
   }
    
   public function updatePeople($id,$data){
       $select = $this->database->table('people')->where('id',$id)->fetch();
       return $select->update($data);
   } 
   
     
    public function addPeople($data){
        return $this->database->table('people')->insert($data);
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
   
   public function getCrashDateDriver($people_id, $date_start,$date_end){
    return $this->database->table('cars_crashes')->where('people_id',$people_id)
   ->where('date >= ?',$date_start)
   ->where('date <=?',$date_end)->fetchAll();
    }
    public function getRepairsDateDriver($people_id, $date_start,$date_end){
    bdump($date_start);    
    return $this->database->table('cars_repairs')->where('people_id',$people_id)
                                                 ->where('date >=?',$date_start)
                                                 ->where('date <=?',$date_end);
    } 
     public function peopleSelector(){
        return $this->database->table('people')->fetchPairs('id','name');
    }
    
    public function driverSelector(){
        return $this->database->table('people')
                ->where('pozition',2)
                ->fetchPairs('id','name');
    }
    
    public function addPeopleBonus($data){
      return $this->database->table('people_bonus')->insert($data);
   }
   
    public function addPeoplePrepay($data){
      return $this->database->table('people_prepay')->insert($data);
   }
   
     public function allPrepayDriver($people_id) {
     return $this->database->table('people_prepay')->where('people_id',$people_id)->fetchAll();
   }
}