<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
global $db;

$company_id = $_REQUEST['data'];

$clientsArr = array();
$clients = $db->query("SELECT `id`,`first_name`,`last_name` FROM `contacts` WHERE deleted = 0 AND accounts_id='".$company_id."'");
while ($rows = $db->fetchByAssoc($clients)) {
    array_push($clientsArr, $rows);
}
echo json_encode($clientsArr);