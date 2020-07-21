<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
require_once('modules/AOS_Quotes/views/view.edit.php');
class customAOS_QuotesViewEdit extends AOS_QuotesViewEdit
{
    public function __construct()
    {
        parent::__construct();
        $this->useForSubpanel = true;
        $this->useModuleQuickCreateTemplate = true;
    }
    public function display()
    {
        global $db;
        /*
            Getting all leads to assign to tpl
        */
        $leadArr = array();
        $lead = $db->query("SELECT `id`,`first_name`,`last_name` FROM `leads` WHERE deleted = 0");
        while ($rows = $db->fetchByAssoc($lead)) {
            array_push($leadArr, $rows);
        }
        $this->ss->assign("LEAD_DATA", $leadArr);
        $this->ss->assign("BEAN", $this->bean);
        $leadTPL = $this->ss->fetch("custom/modules/AOS_Quotes/tpls/searchLeadField.tpl");
        $this->ss->assign("LEAD_HTML", $leadTPL);

        $lead_id = $this->bean->lead_id;
        echo "<script>
			$(document).ready(function() {
                CurrentLeadId='$lead_id';
			}); 
        </script>";

        /*
            Getting all users to assign to tpl
        */
        $userArr = array();
        $users = $db->query("SELECT `id`,`first_name`,`last_name` FROM `users` WHERE deleted = 0");
        while ($rows = $db->fetchByAssoc($users)) {
            array_push($userArr, $rows);
        }
        $this->ss->assign("USER_DATA", $userArr);
        // $this->ss->assign("BEAN", $this->bean);
        $userTPL = $this->ss->fetch("custom/modules/AOS_Quotes/tpls/searchUserField.tpl");
        $this->ss->assign("USER_HTML", $userTPL);

        /*
            Getting all assigned User to assign to tpl
        */

        $assignedUser = array();
        $assignUser = $db->query("SELECT `id`,`first_name`,`last_name` FROM `users` WHERE deleted = 0");
        while ($rows = $db->fetchByAssoc($assignUser)) {
            array_push($assignedUser, $rows);
        }
        $this->ss->assign("ASSIGNEDUSER_DATA", $assignedUser);
        // $this->ss->assign("BEAN", $this->bean);
        $userTPL = $this->ss->fetch("custom/modules/AOS_Quotes/tpls/searchAssignedUserField.tpl");
        $this->ss->assign("ASSIGNEDUSER_HTML", $userTPL);

        /*
            Getting all accounts to assign to tpl
        */
        $accountsArr = array();
        $account = $db->query("SELECT `id`,`name` FROM `accounts` WHERE deleted = 0");
        while ($rows = $db->fetchByAssoc($account)) {
            array_push($accountsArr, $rows);
        }


        $this->ss->assign("BILLING_ACCOUNT_DATA", $accountsArr);
        $this->ss->assign("BEAN", $this->bean);
        $accountTPL = $this->ss->fetch("custom/modules/AOS_Quotes/tpls/searchCompanyField.tpl");
        $this->ss->assign("BILLING_ACCOUNT_HTML", $accountTPL);

        $billing_contact_id = $this->bean->billing_contact_id;
        echo "<script>
			$(document).ready(function() {
                CurrentBillingContactId='$billing_contact_id';
			}); 
        </script>";

        parent::display();
    }
}
