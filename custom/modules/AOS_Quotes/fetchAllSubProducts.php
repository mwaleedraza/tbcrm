<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
global $sugar_config,$current_user,$app_list_strings,$beanList,$db;

$productsArr = array();
$fetchAllProducts = $db->query("SELECT `id`,`name` FROM `tc_sub_products` WHERE deleted = 0");
while ($rows = $db->fetchByAssoc($fetchAllProducts)) {
    array_push($productsArr, $rows);
}
echo json_encode($productsArr);