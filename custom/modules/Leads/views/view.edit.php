<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
require_once('modules/Leads/views/view.edit.php');
class customLeadsViewEdit extends LeadsViewEdit{
    public function __construct(){
        parent::__construct();
        $this->useForSubpanel = true;
        $this->useModuleQuickCreateTemplate = true;
        
    }
    public function display(){
      global $db;
      $companynameArray=array();
      $leadProduct = $db->query("SELECT aos_product_id FROM tc_leads_products WHERE lead_id='".$this->bean->id."' ");
      while($row = $db->fetchByAssoc($leadProduct)){
        $lineItmensRS = $db->query("SELECT id,name FROM aos_products WHERE id='".$row['aos_product_id']."' ");
      	$row = $db->fetchByAssoc($lineItmensRS);
      	$lineItmensArray[] = $row;
      }
      $account = $db->query("SELECT `id`,`name` FROM `accounts` WHERE deleted = 0");
      while($rows = $db->fetchByAssoc($account)){
        array_push($companynameArray,$rows);
        // $companynameArray[] = $rows;
      }
     
    // $companyname = array();
        $searchCompany = $this->ss->fetch("custom/modules/Leads/tpls/searchCompanyField.tpl");		
        $this->ss->assign("PRODUCTLIST_DETAILS", $lineItmensArray ); // this will assign data to a tpl 
       
		    $this->ss->assign("SEARCHCOMPANY_HTML", $searchCompany );
        parent::display();
    }
}
