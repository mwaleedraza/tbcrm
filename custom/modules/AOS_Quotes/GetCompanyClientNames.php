<?php
if (!defined('sugarEntry') || !sugarEntry)
    die('Not A Valid Entry Point');
$GLOBALS['db'];
$data = [];
$lead_id = $_REQUEST['lead_id'];
$lead_query = "SELECT first_name, last_name, account_id,contacts_id FROM `leads` WHERE id = '$lead_id' AND deleted = 0";
$leads = $GLOBALS['db']->query($lead_query);
$rows = $GLOBALS['db']->fetchByAssoc($leads);
array_push($data, $rows);
echo json_encode($data);
