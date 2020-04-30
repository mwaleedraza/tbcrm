<?php
include_once('include/database/DBManagerFactory.php');  
    if (!defined('sugarEntry') || !sugarEntry)
        die('Not A Valid Entry Point');
        $GLOBALS['db'];
        // $id = $_REQUEST['id'];
        // $array=array();
        // $bean = BeanFactory::getBean('Contacts',$_REQUEST['id']);
        // // echo"<pre>";
        // // SELECT * FROM `contacts` WHERE `accounts_id`="5d118a4d-6a89-977e-a444-5e58f545d8bd"
        // $lead_query = "SELECT * FROM `contacts` WHERE `accounts_id`= '$id'";
        // $leads = $GLOBALS['db']-> query($lead_query);
        // while($rows = $GLOBALS['db']->fetchByAssoc($leads)){
        // $first_name = $rows['first_name'];
        // $last_name = $rows['last_name'];
        // $full_name =  $first_name." ".$last_name;
        // // print_r($full_name);
        // // print_r($product_id);
        // $return_arr[] = array("last_name" =>$last_name);
        // // array_push($array,$full_name);
        // // print_r($rows);
        // echo json_encode($return_arr);
        // }
        // // $dictionary['Lead']['fields']['contact_dropdown']['default']=$product_id;
        // $app_list_strings['contact_dropdown'] = "aa";
        // $GLOBALS['app_list_strings']['contact_dropdown'] ="asdsad";
        $query = "SELECT `id`,`name` FROM `accounts` WHERE deleted = 0";
		
		$result = $GLOBALS['db']->query($query, false);
 
		$companyname = array();
		$companyname[''] = '';
 
		while (($row = $GLOBALS['db']->fetchByAssoc($result)) != null) {
            $companyname[$row['id']] = $row['name'];
        }
        print_r($companyname);