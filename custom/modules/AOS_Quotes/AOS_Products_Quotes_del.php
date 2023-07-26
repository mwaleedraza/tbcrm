<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
global $bean;

$AOS_Products_Quotes_Id_del = $_REQUEST['AOS_Products_Quotes_Id_del'];
$respArr = array();
if($AOS_Products_Quotes_Id_del!=''){
    $AOS_Products_QuotesBEAN = BeanFactory::getBean('AOS_Products_Quotes',$AOS_Products_Quotes_Id_del);
    $AOS_Products_QuotesBEAN->deleted='1';
    if($AOS_Products_QuotesBEAN->save()){
        $respArr['status'] = '200';
        $respArr['msg'] = 'Deleted Successfully.!';
        $respArr['id'] = $AOS_Products_Quotes_Id_del;
    } else{
        $respArr['status'] = '400';
        $respArr['msg'] = 'Not Able To Delete Successfully.!!';
        $respArr['id'] = $AOS_Products_Quotes_Id_del;
    }
}
echo json_encode($respArr);