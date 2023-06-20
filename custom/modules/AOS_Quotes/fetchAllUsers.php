<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
global $sugar_config,$current_user,$app_list_strings,$beanList,$db;

$userArr = array();
$users = $db->query("SELECT id,last_name FROM users WHERE deleted = 0 ORDER BY last_name ASC");
while ($rows = $db->fetchByAssoc($users)) {
    array_push($userArr, $rows);
}
echo json_encode($userArr);