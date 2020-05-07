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

        /*
           Getting all products to assign to tpl
       */
        $leadProduct = $db->query("SELECT aos_product_id FROM tc_leads_products WHERE lead_id='".$this->bean->id."' ");
        while($row = $db->fetchByAssoc($leadProduct)){
            $lineItmensRS = $db->query("SELECT id,name FROM aos_products WHERE id='".$row['aos_product_id']."' ");
            $row = $db->fetchByAssoc($lineItmensRS);
            $lineItmensArray[] = $row;
        }
        $this->ss->assign("PRODUCTLIST_DETAILS", $lineItmensArray );

        /*
            Getting all accounts to assign to tpl
        */
        $accountsArr=array();
        $account = $db->query("SELECT `id`,`name` FROM `accounts` WHERE deleted = 0");
        while($rows = $db->fetchByAssoc($account)){
            array_push($accountsArr,$rows);
        }

        
        $this->ss->assign("ACCOUNTS_DATA", $accountsArr );
        $this->ss->assign("BEAN", $this->bean );
        $accountTPL = $this->ss->fetch("custom/modules/Leads/tpls/searchCompanyField.tpl");
        $this->ss->assign("ACCOUNT_HTML", $accountTPL );


        $contacts_id=$this->bean->contacts_id;
        echo "<script>
			$(document).ready(function() {
				CurrentContactId='$contacts_id';
			}); 
		</script>";
        parent::display();
    }
}
