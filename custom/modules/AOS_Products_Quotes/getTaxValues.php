<?php

if (! defined ( 'sugarEntry' )){
    define ( 'sugarEntry', true );
}
chdir ( ".." );
require_once ('include/entryPoint.php');
global $db;
$parentId = $_REQUEST['id'];
$taxArr = array();
$taxQuery = $db->query("SELECT `product_id`, `product_tax_type`, `gst_percentage`, `pra_percentage`, `gst_custom_percentage`, `pra_custom_percentage`
FROM `aos_products_quotes` WHERE parent_id = '".$parentId."' AND deleted = 0");
while ($fetchTaxRow = $db -> fetchByAssoc($taxQuery)) {
    array_push($taxArr, $fetchTaxRow);
}
echo json_encode($taxArr);