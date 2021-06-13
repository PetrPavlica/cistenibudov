<?php

use Nette\Application\UI;

class AmazonApiForm extends Nette\Application\UI\Control
{
    private $ordersData;
    
    private $factory;
    
    protected $dir;
    
    public $onAmazonApiSave;
               
    public function __construct(App\Model\OrdersModel $ordersData,\App\Forms\FormFactory $factory,$dir)
    {
        $this->ordersData = $ordersData;
        $this->factory = $factory;
        $this->dir = $dir;
    }
    
    public function handleedit($id){
        $article = $this->articleData->articleById($id);
        $this['articleForm']->setDefaults($article);
    }
    
    public function createComponentAmazonApiForm() 

    {
        
        $form = $this->factory->create();
         $form->addUpload('csv')
                 ->setRequired('Musíte vybrat nějaké CSV!')
                        ->setAttribute('class', 'form-control')
                        ;
                
        $form->addSubmit('send', 'Uložit')
        ->setAttribute('class', 'btn btn-info btn-sm');   

       
        $form->onSuccess[] = [$this, 'processForm'];
        return $form;
    }
    
    public function zasilkovnaSend($orders){
        
    }
    
    public function processForm($form)
    {   $data = array();
        $header = NULL;
        $delimiter = "\t";
        $i = 0;
        $values = $form->getValues();
        $file = $form['csv']->getValue();
        bdump($file);
        $file_ext=strtolower(mb_substr($file->getSanitizedName(), strrpos($file->getSanitizedName(), ".")));
        $file_name = uniqid(rand(0,20), TRUE).$file_ext;
        $path = $this->dir.'/csv/amazon'.$file_name;
        $values->csv->move($path);
        if (($handle = fopen($path, 'r')) == !FALSE)
        {
            while (($row = fgetcsv($handle, 10000,"\t")) !== FALSE)
            {   bdump($i); 
                $data[] = $row;
                if($i > 0){
                $order_id = $row[0];    
                bdump($row[0]);   
                $save = array('order_id'=>$row[0],
                              'order_item_id'=>$row[1],
                              'purchase_date'=>$row[2],
                              'payments_date'=>$row[3],
                              'buyer_email'=>$row[4],
                              'buyer_name'=>$row[5],
                              'payment_method_details'=>$row[6],
                              'buyer_phone_number'=>$row[7],
                              'sku'=>$row[8],
                              'number_of_items'=>$row[9],
                              'product_name'=>$row[10],
                              'quantity_purchased'=>$row[11],
                              'currency'=>$row[12],
                              'item_price'=>$row[13],
                              'item_tax'=>$row[14],
                              'shipping_price'=>$row[15],
                              'shipping_tax'=>$row[16],
                              'ship_service_level'=>$row[17],
                              'recipient_name'=>$row[18],
                              'ship_address_1'=>$row[19],
                              'ship_address_2'=>$row[20],
                              'ship_address_3'=>$row[21],
                              'ship_city'=>$row[22],
                              'ship_state'=>$row[23],
                              'ship_postal_code'=>$row[24],
                              'ship_country'=>$row[25],
                              'ship_phone_number'=>$row[26],
                              'bill_address_1'=>$row[27],
                              'bill_address_2'=>$row[28],
                              'bill_address_3'=>$row[29],
                              'bill_city'=>$row[30],
                              'bill_state'=>$row[31],
                              'bill_postal_code'=>$row[32],
                              'bill_country'=>$row[33],
                              'item_promotion_discount'=>$row[34],
                              'item_promotion_id'=>$row[35],
                              'ship_promotion_discount'=>$row[36],
                              'ship_promotion_id'=>$row[37],
                              'delivery_start_date'=>$row[38],
                              'delivery_end_date'=>$row[39],
                              'delivery_time_zone'=>$row[40],
                              'delivery_Instructions'=>$row[41],
                              'sales_channel'=>$row[42],
                              'is_business_order'=>$row[43],
                              'purchase_order_number'=>$row[44],
                              'price_designation'=>$row[45],
                              'customized_url'=>$row[46],
                              'customized_page'=>$row[47],
                              'buyer_company_name'=>$row[48],
                              'buyer_cst_number'=>$row[49],
                              'buyer_vat_number'=>$row[50],
                              'is_amazon_invoiced'=>$row[51],
                              'vat_exclusive_item_price'=>$row[52],
                              'vat_exclusive_shipping_price'=>$row[53],
                              'vat_exclusive_giftwrap_price'=>$row[54],
                              'fa'=>''
                              );
                $last = $this->ordersData->saveOrderAmazon($save,$order_id);
                $name = explode(" ",$row[18]);
               /* $data_zasilkovna = array('number' => "$row[0]",
                                         'name' => "$name[0]",
                                         'surname' => "$name[1]",
                                         'email' => "$row[4]",
                                         //'phone' => "+". $phoneCode . $phone,
                                         'addressId' => $zasilkovnaId,
                                         'cod' => $orderValue,
                                         'value' => $orderValue,
                                         'eshop' => "test.cz");
                */
                }
                $i++;
            }
            
            fclose($handle);
            $import_data = array('file_name_before'=>$file,
                                'file_name_now'=>$file_name,
                                'goods_num'=>$i-1);
            $this->ordersData->saveImportAmazon($import_data);
        } 
        bdump($data);
        //$this->onDphSave($this, $save);

    }
    
    public function render(){
       $this->template->render(__DIR__ .'/amazonapi.latte');
       //$this->template->render();
    }
}

/** rozhranní pro generovanou továrničku */
interface IAmazonApiFormFactory
{
    /** @return \AmazonApiForm */
    function create($dir);
}
