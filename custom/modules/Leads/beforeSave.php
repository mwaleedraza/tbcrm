<?php
if (!defined('sugarEntry')|| !sugarEntry){
  die('Not A Valid Entry Point');
}
class Save{
  public function SaveAll(&$bean, $event, $arguments){
	 global $db;
	$db->query('delete from tc_leads_products where lead_id="'.$bean->id.'"');
    $product_count = $_REQUEST['product_count'];
    for($i=0; $i<$product_count; $i++){
      if($product_count == '1'){
        $product_id = $_REQUEST['pro_id_'.$i];
        $bean->singleproductname=$product_id;
        }
      $module='tc_leads_products';
      $bean1 = BeanFactory::newBean($module);
      $bean1->lead_id=$bean->id;
      $bean1->aos_product_id=$_REQUEST['pro_id_'.$i];
	    if($_REQUEST['pro_id_'.$i]!=''){
		    $bean1->save();
        }
    }
  }
}
?>
