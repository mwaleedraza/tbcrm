<?php
if (!defined('sugarEntry') || !sugarEntry)
    die('Not A Valid Entry Point');
global $db;

$sub_parent_id = $_REQUEST['sub_parent_id'];
$subSubProdArray = array();
$sub_sub_prod = $db->query("SELECT `id`, `name` FROM tc_sub_products WHERE parent_id = '".$sub_parent_id."' AND deleted = 0");
while ($fetchSubProd = $db->fetchByAssoc($sub_sub_prod)){
    array_push($subSubProdArray, $fetchSubProd);
}
echo json_encode($subSubProdArray);