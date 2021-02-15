<?php
if (!defined('sugarEntry')|| !sugarEntry){
  die('Not A Valid Entry Point');
}
class Save{
  public function SaveAll(&$bean, $event, $arguments){
    global $db;
    $productArr = $_REQUEST['product_id'];
    $subProducts = $_REQUEST['sub_product_id'];
    $sub_subProducts = $_REQUEST['sub_sub_product_id'];

    // Check if bean exists
    $lead_id = $db->query("SELECT count(id) as count FROM tc_leads_products WHERE deleted = 0 AND lead_id = '".$bean->id."' ");
    $row = $db->fetchByAssoc($lead_id);

    
    if($row['count'] >= 1){
      $db->query("DELETE FROM tc_leads_products WHERE lead_id = '".$bean->id."' ");
      for($i=0;$i<count($productArr);$i++){
        $productBean = BeanFactory::newBean('tc_leads_products');
        $productBean->aos_product_id = $productArr[$i];
        $productBean->sub_product_id = $subProducts[$i];
        $productBean->sub_sub_product_id = $sub_subProducts[$i];
        $productBean->lead_id = $bean->id;
        $productBean->save();
      }
    }
    else{
      for($i=0;$i<count($productArr);$i++){
        $productBean = BeanFactory::newBean('tc_leads_products');
        $productBean->aos_product_id = $productArr[$i];
        $productBean->sub_product_id = $subProducts[$i];
        $productBean->sub_sub_product_id = $sub_subProducts[$i];
        $productBean->lead_id = $bean->id;
        $productBean->save();
      }
    }
      
      

    }
  

}
?>
