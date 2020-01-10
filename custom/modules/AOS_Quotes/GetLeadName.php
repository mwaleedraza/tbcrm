<?php
    if (!defined('sugarEntry') || !sugarEntry)
        die('Not A Valid Entry Point');
        $GLOBALS['db'];
        $data=[];
        $lead_id= $_REQUEST['lead_id'];
        $lead_query = "SELECT id, first_name, last_name FROM `leads` WHERE id = '$lead_id'";
        $leads = $GLOBALS['db']-> query($lead_query);
        $rows = $GLOBALS['db']->fetchByAssoc($leads);
        array_push($data,$rows);
        echo json_encode($data);
