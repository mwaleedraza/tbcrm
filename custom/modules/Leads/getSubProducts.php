<?php
// session_start();

if (! defined ( 'sugarEntry' )){
    define ( 'sugarEntry', true );
}

global $db;
$subProductArray = array();
$parent_id = $_REQUEST['id'];
$getSubProduct_query = "SELECT * FROM `tc_sub_products` WHERE parent_id = '".$parent_id."' AND deleted = 0 ";
$subProducts = $db-> query($getSubProduct_query);
while($fetchProducts = $db->fetchByAssoc($subProducts)){
    array_push($subProductArray, $fetchProducts);
}
echo json_encode($subProductArray);