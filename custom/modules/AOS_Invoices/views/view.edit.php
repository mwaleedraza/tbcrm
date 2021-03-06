<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

/**
 *
 * SugarCRM Community Edition is a customer relationship management program developed by
 * SugarCRM, Inc. Copyright (C) 2004-2013 SugarCRM Inc.
 *
 * SuiteCRM is an extension to SugarCRM Community Edition developed by SalesAgility Ltd.
 * Copyright (C) 2011 - 2018 SalesAgility Ltd.
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Affero General Public License version 3 as published by the
 * Free Software Foundation with the addition of the following permission added
 * to Section 15 as permitted in Section 7(a): FOR ANY PART OF THE COVERED WORK
 * IN WHICH THE COPYRIGHT IS OWNED BY SUGARCRM, SUGARCRM DISCLAIMS THE WARRANTY
 * OF NON INFRINGEMENT OF THIRD PARTY RIGHTS.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Affero General Public License along with
 * this program; if not, see http://www.gnu.org/licenses or write to the Free
 * Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301 USA.
 *
 * You can contact SugarCRM, Inc. headquarters at 10050 North Wolfe Road,
 * SW2-130, Cupertino, CA 95014, USA. or at email address contact@sugarcrm.com.
 *
 * The interactive user interfaces in modified source and object code versions
 * of this program must display Appropriate Legal Notices, as required under
 * Section 5 of the GNU Affero General Public License version 3.
 *
 * In accordance with Section 7(b) of the GNU Affero General Public License version 3,
 * these Appropriate Legal Notices must retain the display of the "Powered by
 * SugarCRM" logo and "Supercharged by SuiteCRM" logo. If the display of the logos is not
 * reasonably feasible for technical reasons, the Appropriate Legal Notices must
 * display the words "Powered by SugarCRM" and "Supercharged by SuiteCRM".
 */


class AOS_InvoicesViewEdit extends ViewEdit
{
    public function __construct()
    {
        parent::__construct();
        $this->useForSubpanel = true;
        $this->useModuleQuickCreateTemplate = true;
    }

    /**
     * @see SugarView::display()
     *
     * We are overridding the display method to manipulate the sectionPanels.
     * If portal is not enabled then don't show the Portal Information panel.
     */
    public function display()
    {
        global $db;
        $this->ev->process();
        /*
            Getting all accounts to assign to tpl
        */

        $accountsArr = array();
        $account = $db->query("SELECT `id`,`name` FROM `accounts` WHERE deleted = 0");
        while ($rows = $db->fetchByAssoc($account)) {
            array_push($accountsArr, $rows);
        }

        $this->ss->assign("ACCOUNTS_DATA", $accountsArr);
        $this->ss->assign("BEAN", $this->bean);
        $accountTPL = $this->ss->fetch("custom/modules/AOS_Invoices/tpls/searchCompanyField.tpl");
        $this->ss->assign("ACCOUNT_HTML", $accountTPL);
        /*
            Getting all contacts/clients to assign to tpl
        */
        $contactsArr = array();
        $contact = $db->query("SELECT `id`,`last_name`,`first_name` FROM `contacts` WHERE deleted = 0");
        while ($rows = $db->fetchByAssoc($contact)) {
            array_push($contactsArr, $rows);
        }

        $this->ss->assign("CONTACTS_DATA", $contactsArr);
        $this->ss->assign("BEAN", $this->bean);
        $contactTPL = $this->ss->fetch("custom/modules/AOS_Invoices/tpls/searchContactField.tpl");
        $this->ss->assign("CONTACT_HTML", $contactTPL);
        /*
            Getting all users to assign to tpl
        */
        $usersArr = array();
        $user = $db->query("SELECT `id`,`first_name`,`last_name` FROM `users` WHERE deleted = 0");
        while ($rows = $db->fetchByAssoc($user)) {
            array_push($usersArr, $rows);
        }

        $this->ss->assign("USERS_DATA", $usersArr);
        $this->ss->assign("BEAN", $this->bean);
        $userTPL = $this->ss->fetch("custom/modules/AOS_Invoices/tpls/searchAssignedUserField.tpl");
        $this->ss->assign("USER_HTML", $userTPL);
        /*
            Getting all users verified by to assign to tpl
        */
        $usersVerifiedArr = array();
        $userVerified = $db->query("SELECT `id`,`first_name`,`last_name` FROM `users` WHERE deleted = 0");
        while ($rows = $db->fetchByAssoc($userVerified)) {
            array_push($usersVerifiedArr, $rows);
        }

        $this->ss->assign("USERSVERIFIED_DATA", $usersVerifiedArr);
        $this->ss->assign("BEAN", $this->bean);
        $userVerifiedTPL = $this->ss->fetch("custom/modules/AOS_Invoices/tpls/searchAssignedUserVerifiedField.tpl");
        $this->ss->assign("USERVERIFIED_HTML", $userVerifiedTPL);
        // echo $this->ev->display($this->showTitle);

        $productParentId = $this->bean->id;
        $productArr = array();
        $products = $db->query("SELECT * FROM `aos_products_quotes` WHERE parent_id = '".$productParentId."' AND deleted = 0");
        while ($rows = $db->fetchByAssoc($products)) {
            array_push($productArr, $rows);
        }
        $productArr = json_encode($productArr);
        echo "<script>
        productIdInvoices= JSON.parse('".$productArr."'); 
        </script>";

        // Setting Tax Values
        $parent_id = $_REQUEST['record'];
        $moduleName = $_REQUEST['module'];
        echo "<script>
                parentId = '".$parent_id."';
                moduleName = '".$moduleName."';
            </script>";

        parent::display();
    }
}
