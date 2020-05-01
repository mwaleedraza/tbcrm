<?php
session_start();

if (! defined ( 'sugarEntry' )){
    define ( 'sugarEntry', true );
}
chdir ( ".." );
require_once ('include/entryPoint.php');
        global $db;
        $id = $_REQUEST['id'];
        // $array=[];
        $array = array();

        $lead_query = "SELECT * FROM `contacts` WHERE accounts_id= '".$id."' ";
        $leads = $db-> query($lead_query);
        while($rows = $db->fetchByAssoc($leads)){
        $first_name = $rows['first_name'];
        $last_name = $rows['last_name'];
        $full_name =  $first_name." ".$last_name;
        // print_r($full_name);
        // print_r($product_id);
        // $return_arr[] = array("last_name" =>$last_name);
        // array_push($array,$rows);
        $array[] = array(
            'id' => $rows['id'],
            'name' => $full_name
        );
        // array_push($array,$full_name);
        // print_r($rows);
        // echo json_encode($array, JSON_FORCE_OBJECT);

        }
echo json_encode($array);
session_write_close ();


