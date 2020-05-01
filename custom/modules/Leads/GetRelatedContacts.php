<?php
include_once('include/database/DBManagerFactory.php');  
    if (!defined('sugarEntry') || !sugarEntry)
        die('Not A Valid Entry Point');
        $GLOBALS['db'];
        $id = $_REQUEST['id'];
        // $array=[];
        $array = array();
        // $bean = BeanFactory::getBean('Contacts',$_REQUEST['id']);
        // echo"<pre>";
        // SELECT * FROM `contacts` WHERE `accounts_id`="5d118a4d-6a89-977e-a444-5e58f545d8bd"
        $lead_query = "SELECT * FROM `contacts` WHERE `accounts_id`= '$id'";
        $leads = $GLOBALS['db']-> query($lead_query);
        while($rows = $GLOBALS['db']->fetchByAssoc($leads)){
        $first_name = $rows['first_name'];
        $last_name = $rows['last_name'];
        $full_name =  $first_name." ".$last_name;
        // print_r($full_name);
        // print_r($product_id);
        // $return_arr[] = array("last_name" =>$last_name);
        // array_push($array,$rows);
        $array[] = array(
            'id' => $rows['id'],
            'first_name' => $rows['first_name'],
            'last_name' => $rows['last_name']
        );
        // array_push($array,$full_name);
        // print_r($rows);
        // echo json_encode($array, JSON_FORCE_OBJECT);
        echo "{\"ResultSet\":" .json_encode($array). "}";

        }
        // $dictionary['Lead']['fields']['contact_dropdown']['default']=$product_id;
       