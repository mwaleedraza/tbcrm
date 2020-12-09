<?php
if (!defined('sugarEntry') || !sugarEntry) {
  die('Not A Valid Entry Point');
}
require_once('modules/Leads/views/view.detail.php');
class customLeadsViewDetail extends LeadsViewDetail
{
  public function __construct(){
      parent::__construct();
      $this->useForSubpanel = true;
      $this->useModuleQuickCreateTemplate = true;
  }
  public function display(){
    unset($this->dv->defs['templateMeta']['form']['buttons'][3]);
    unset($this->dv->defs['templateMeta']['form']['buttons'][4]);
    unset($this->dv->defs['templateMeta']['form']['buttons'][5]);
    global $db;
    // $lineItmensArray = array();
    // $leadProduct = $db->query("SELECT aos_product_id FROM tc_leads_products WHERE lead_id='".$this->bean->id."'");
    // while($row = $db->fetchByAssoc($leadProduct)){
    //   $lineItems = $db->query("SELECT id,name FROM aos_products WHERE id = '".$row['aos_product_id']."'  ");
    //   $products = $db->fetchByAssoc($lineItems);
    //   array_push($lineItmensArray, $row['aos_product_id']);
    // }

    $productArr = array();
    $lead_id = $this->bean->id;
        $leadProductId = $db->query("SELECT * FROM `tc_leads_products`  WHERE lead_id ='".$lead_id."' AND  deleted = 0");
        while($ProductId = $db->fetchByAssoc($leadProductId)){
            $relatedProducts = $db->query("SELECT `name`,`id` FROM `aos_products` WHERE id = '".$ProductId['aos_product_id']."' ");
            $products = $db->fetchByAssoc($relatedProducts);
            array_push($productArr, $products);
            
        }
     


      $this->ss->assign("PRODUCTLIST_DETAILS", $productArr);
      parent::display();
  }
}
