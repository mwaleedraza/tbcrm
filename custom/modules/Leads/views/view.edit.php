
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
        global $db, $current_user;

       


        /*
            Getting all accounts to assign to tpl
        */
        $accountsArr=array();
        $account = $db->query("SELECT `id`,`name` FROM `accounts` WHERE deleted = 0");
        while($accountrows = $db->fetchByAssoc($account)){
            array_push($accountsArr,$accountrows);
        }

        
        $this->ss->assign("ACCOUNTS_DATA", $accountsArr );
        $this->ss->assign("BEAN", $this->bean );
        $accountTPL = $this->ss->fetch("custom/modules/Leads/tpls/searchCompanyField.tpl");
        $this->ss->assign("ACCOUNT_HTML", $accountTPL );

        /*
           Getting all products to assign to tpl
       */

        $vendorsArr = array();
        $vendors = $db->query("SELECT `id`, `first_name`, `last_name` FROM `contacts` WHERE deleted = 0 AND type_drop_down = 'Vendor'");
        while($fetchVendors = $db->fetchByAssoc($vendors)){
            array_push($vendorsArr, $fetchVendors);
        }
        $this->ss->assign("VENDOR_DATA", $vendorsArr);
        $product_id=$this->bean->products_id;
        
        $productArr = array();
        $lead_id = $this->bean->id;
            $leadProductId = $db->query("SELECT aos_product_id FROM `tc_leads_products`  WHERE  deleted = 0 AND lead_id= '".$lead_id."' ");
            while($ProductId = $db->fetchByAssoc($leadProductId)){
                $relatedProducts = $db->query("SELECT `id` FROM `aos_products` WHERE id = '".$ProductId['aos_product_id']."' ");
                $products = $db->fetchByAssoc($relatedProducts);
                array_push($productArr, $products);
            }
            $this->ss->assign("PRODUCT_ARRAY", $products);
            $productArr = json_encode($productArr);
        echo "<script>
			$(document).ready(function() {
                CurrentProductId= JSON.parse('".$productArr."'); //ProductObject
                
			}); 
		</script>";
        $this->ss->assign("BEAN", $this->bean);
////////////////////
        $contacts_id=$this->bean->contacts_id;
        echo "<script>
			$(document).ready(function() {
				CurrentContactId='$contacts_id';
			}); 
		</script>";
        /*
            Getting all users to assign to tpl
        */
        $usersArr = array();
        $user = $db->query("SELECT `id`,`first_name`,`last_name` FROM `users` WHERE deleted = 0");
        while ($userrows = $db->fetchByAssoc($user)) {
            array_push($usersArr, $userrows);
        }

        $this->ss->assign("USERS_DATA", $usersArr);
        $this->ss->assign("BEAN", $this->bean);
        $userTPL = $this->ss->fetch("custom/modules/Leads/tpls/searchAssignedUserField.tpl");
        $this->ss->assign("USER_HTML", $userTPL);

        $leadArr = array();
        $leads = $db->query("SELECT `id`,`first_name`,`last_name` FROM `leads` WHERE deleted = 0");
        while ($leadsrows = $db->fetchByAssoc($leads)) {  
            array_push($leadArr, $leadsrows);
        }
        $this->ss->assign("LEAD_DATA", $leadArr);

        if (!empty($this->bean->fetched_row) && $current_user->is_admin!=1 ) {
          echo "<script>
            $(document).ready(function() {
                document.getElementById(\"approx\").readOnly = true;
            }); 
        </script>";  
        }


        $contactArr = array();
        $contact = $db->query("SELECT `id`,`first_name`,`last_name` FROM `contacts` WHERE deleted = 0 AND type_drop_down = 'Vendor' ");
        while ($contactrows = $db->fetchByAssoc($contact)) {
            array_push($contactArr, $contactrows);
        }

        $this->ss->assign("CONTACT_DATA", $contactArr);
        $this->ss->assign("BEAN", $this->bean);
        $addProductTPL = $this->ss->fetch("custom/modules/Leads/tpls/searchVendor.tpl");
        $this->ss->assign("PRODUCT_HTML", $addProductTPL);
        parent::display();

    }
}
