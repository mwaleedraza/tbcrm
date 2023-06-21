<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
global $sugar_config,$current_user,$app_list_strings,$beanList,$db;

$parent_product_id = $_REQUEST['data'];
$productsArr = array();
$fetchAllProducts = $db->query("SELECT `id`,`name` FROM `tc_sub_products` WHERE deleted = 0 AND parent_id = '".$parent_product_id."'");
while ($rows = $db->fetchByAssoc($fetchAllProducts)) {
    array_push($productsArr, $rows);
}
echo json_encode($productsArr);