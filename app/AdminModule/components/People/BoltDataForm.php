<?php


use Nette\Utils\Image;

class BoltDataForm extends Nette\Application\UI\Control
{
    private $peopleData;
    
    private $factory;
    
    private $dir;
    private $passwords;        
    public $onBoltDataSave;
    
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
    
    public function createComponentBoltDataForm() 

    {
        $form = $this->factory->create();
        
        $form->addUpload('file','Soubor:')
                        ->setRequired('Vyberte soubor');
               
        $form->addSubmit('send', 'Uložit')
        ->setAttribute('class', 'btn btn-info btn-sm');   

       
        $form->onSuccess[] = [$this, 'processForm'];
        return $form;
    }

    public function processForm($form)
    {
        
        $data = array();
        $header = NULL;
        $delimiter = "\t";
        $i = 0;
        $values = $form->getValues();
        $file = $form['file']->getValue();
        bdump('jelo');
        //$file_ext=strtolower(mb_substr($file->getSanitizedName(), strrpos($file->getSanitizedName(), ".")));
        $file_name = uniqid(rand(0,20), TRUE).'csv';
        $path = $this->dir.'/csv/amazon'.$file_name;
        $values->file->move($path);
        if (($handle = fopen($path, 'r')) == !FALSE)
        {
            while (($row = fgetcsv($handle, 10000,"\t")) !== FALSE)
            {   bdump($i); 
                $data[] = $row;
                if($i > 0){
                $r = explode(",",$row[0]);
                $driver = $r[0];
                if($driver != ""){
                  $phone_number=$r[1];
                  $date=$r[2];
                  if($phone_number == '""'){
                      $date_r = explode(" ",$date);
                  }
                 bdump($r);
                  $save = array('driver'=>$driver,
                                'phone_number' => $phone_number,
                                'date_from'=>$date_r[1],
                                'date_to'=>$date_r[3],
                                'pay'=>str_replace('"','',$r[3].'.'.$r[4]),
                                'storno' => str_replace('"','',$r[5].'.'.$r[6]),
                                'rezervation_pay'=>str_replace('"','',$r[7].'.'.$r[8]),
                                'rezervation_diferent'=>str_replace('"','',$r[9].'.'.$r[10]),
                                'pay_plus'=>str_replace('"','',$r[11].'.'.$r[12]),
                                'drive_money'=>str_replace('"','',$r[13].'.'.$r[14]),
                                'drive_money_bolt'=>str_replace('"','',$r[15].'.'.$r[16]),
                                'bonus'=>str_replace('"','',$r[17].'.'.$r[18]),
                                'compenzation'=>str_replace('"','',$r[19].'.'.$r[20]),
                                'refundation'=>str_replace('"','',$r[21].'.'.$r[22]),
                                'gratuity'=>str_replace('"','',$r[23].'.'.$r[24]),
                                'week_balance'=>str_replace('"','',$r[25].'.'.$r[26])
                            );
                  
                  $last = $this->peopleData->saveBolt($save);
                }
                
                }
                $i++;
            }
            
            fclose($handle);
           /* $import_data = array('file_name_before'=>$file,
                                'file_name_now'=>$file_name,
                                'goods_num'=>$i-1);
            $this->ordersData->saveImportAmazon($import_data);*/
        } 
        bdump($last);
        //$this->onDphSave($this, $save);

    }
    
    public function render(){
       $this->template->render(__DIR__ .'/boltdataform.latte');
       //$this->template->render();
    }
}

/** rozhrannĂ­ pro generovanou tovĂˇrniÄŤku */
interface IBoltDataFormFactory
{
    /** @return \BoltDataForm */
    function create($dir);
}
