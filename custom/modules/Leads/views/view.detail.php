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
    
    // $productArr = array();
    // $subProductArr = array();
    // $sub_subProductArr = array();
    $lead_id = $this->bean->id;
    $allProducts = array();
    $lead_query = "SELECT aos_product_id, sub_product_id, sub_sub_product_id FROM `tc_leads_products` WHERE lead_id = '$lead_id' AND deleted = 0";
    $leads = $db-> query($lead_query);
    while($rows = $db->fetchByAssoc($leads)){
      
      $product_id = $rows['aos_product_id'];
      $sub_product_id = $rows['sub_product_id'];
      $sub_sub_product_id = $rows['sub_sub_product_id'];

      // Fetching Products
      $product_query = "SELECT `id`, `name` FROM `aos_products` WHERE id= '$product_id' AND deleted=0";
      $product = $db-> query($product_query);
      $product_rows = $db->fetchByAssoc($product);

      // Fetching Sub Products
      $subQuery = $db->query("SELECT `name` FROM tc_sub_products WHERE `id` = '".$sub_product_id."'  AND deleted=0");
      $subProducts = $db->fetchByAssoc($subQuery);

      // Fetching Sub Sub Products
      $sub_subQuery = $db->query("SELECT `name` FROM tc_sub_products WHERE `id` = '".$sub_sub_product_id."'  AND deleted=0");
      $sub_subProducts = $db->fetchByAssoc($sub_subQuery);

      array_push($allProducts,array("id" => $product_rows['id'], "product" => $product_rows['name'], "sub_product" => $subProducts['name'], "sub_sub_product" => $sub_subProducts['name']));
    }
    $this->ss->assign("PRODUCTLIST_DETAILS", $allProducts);

    parent::display();
  }
}
