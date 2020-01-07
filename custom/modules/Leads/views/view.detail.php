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
    $leadProduct = $db->query("SELECT aos_product_id FROM tc_leads_products WHERE lead_id='".$this->bean->id."' ");
    while($row = $db->fetchByAssoc($leadProduct)){
      $lineItmensRS = $db->query("SELECT id,name FROM aos_products WHERE id='".$row['aos_product_id']."' ");
      $row = $db->fetchByAssoc($lineItmensRS);
      $lineItmensArray[] = $row;
    }
      $this->ss->assign("PRODUCTLIST_DETAILS", $lineItmensArray );
      parent::display();
  }
}
