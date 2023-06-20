<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
global $sugar_config,$current_user,$app_list_strings,$beanList,$db;

$accountsArr = array();
$accounts = $db->query("SELECT `id`,`name` FROM `accounts` WHERE deleted = 0");
while ($rows = $db->fetchByAssoc($accounts)) {
    array_push($accountsArr, $rows);
}
echo json_encode($accountsArr);