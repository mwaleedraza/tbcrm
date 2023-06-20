<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
global $sugar_config,$current_user,$app_list_strings,$beanList,$db;

$leadsArr = array();
$leads = $db->query("SELECT `id`,`first_name`,`last_name` FROM `leads` WHERE deleted = 0");
while ($rows = $db->fetchByAssoc($leads)) {
    array_push($leadsArr, $rows);
}
echo json_encode($leadsArr);