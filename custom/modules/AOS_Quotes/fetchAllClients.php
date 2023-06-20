<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
global $sugar_config,$current_user,$app_list_strings,$beanList,$db;

$clientsArr = array();
$clients = $db->query("SELECT `id`,`first_name`,`last_name` FROM `contacts` WHERE deleted = 0");
while ($rows = $db->fetchByAssoc($clients)) {
    array_push($clientsArr, $rows);
}
echo json_encode($clientsArr);