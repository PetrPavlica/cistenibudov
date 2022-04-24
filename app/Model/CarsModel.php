<?php

namespace App\Model;

class CarsModel extends BaseModel{
    
    public function allCars() {
       return $this->database->table('cars');
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
    
    public function addCrashes($data){
        return $this->database->table('cars_crashes')->insert($data);
    }
    
    public function addWheels($data){
        return $this->database->table('cars_wheels')->insert($data);
    }
    
    public function addRepairs($data){
        return $this->database->table('cars_repairs')->insert($data);
    }
    
    public function addCards($data){
        return $this->database->table('cars_cards')->insert($data);
    }
    
    public function carById($id){
        return $this->database->table('cars')->where('id',$id)->fetch();
    }
    
    public function allCrashes($id){
        return $this->database->table('cars_crashes')->where('car_id',$id)->fetchAll();
    }
    
    public function allWheels($id){
        return $this->database->table('cars_wheels')->where('car_id',$id)->fetchAll();
    }
    
    public function allRepairs($id){
        return $this->database->table('cars_repairs')->where('car_id',$id)->fetchAll();
    }
    
    public function allCards($id){
        return $this->database->table('cars_cards')->where('car_id',$id)->fetchAll();
    }
    
    public function getCrashDateDriver($people_id, $date_start,$date_end){
    return $this->database->table('cars_crashes')->where('people_id',$people_id)
                                                 ->where('date ?>=',$date_start)
                                                 ->where('date ?<=',$date_end);
    }
    
     public function getRepairsDateDriver($people_id, $date_start,$date_end){
    return $this->database->table('cars_crashes')->where('people_id',$people_id)
                                                 ->where('date ?>=',$date_start)
                                                 ->where('date ?<=',$date_end);
    }
    
    public function peopleSelector(){
        return $this->database->table('people')->fetchPairs('id','name');
    }
   
    public function carSelector(){
        return $this->database->table('cars')->fetchPairs('id','name');
    }
    
    public function addCarPeople($data){
        return $this->database->table('people_car')->insert($data);
    }
    
   public function allCarsPeople($id){
        return $this->database->table('people_car')->where('car_id',$id)->fetchAll();
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
   
   public function addPeoplePrepay($data){
      return $this->database->table('people_prepay')->insert($data);
   }
   
      
   public function updateCar($id,$data){
       $select = $this->database->table('cars')->where('id',$id)->fetch();
       return $select->update($data);
   } 
}