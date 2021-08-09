<?php
global $db;
$account_id = $_REQUEST['account'];
$contactArr = array();

$getContact = $db->query("SELECT `id`, `first_name`, `last_name` FROM contacts WHERE deleted = 0 AND accounts_id = '".$account_id."'");
while ($rows = $db->fetchByAssoc($getContact)){
    array_push($contactArr, $rows);
}

echo json_encode($contactArr);