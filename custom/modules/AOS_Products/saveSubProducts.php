<?php
if (!defined('sugarEntry') || !sugarEntry)
    die('Not A Valid Entry Point');
global $db;


date_default_timezone_set("Asia/Karachi");
$date_entered = date("Y/m/d h:i:sa");
$parent_id = $_REQUEST['parent_id'];
$name = $_REQUEST['sub_product_name'];
$sub_product_description = $_REQUEST['sub_product_description'];
$sub_product_sku = $_REQUEST['sub_product_sku'];
$sub_product_type = $_REQUEST['sub_product_type'];
$subProductCount = count($name);

if($subProductCount > 1){    
    for ($i=0; $i < $subProductCount; $i++) { 
        $saveSubProd = $db->query("INSERT INTO tc_sub_products(`id`, `name`,  `date_entered`, `parent_id`, `has_sub_products`, `deleted`, `sub_product_description`, `sub_product_sku`, `sub_product_type`) 
        VALUES(UUID(), '".$name[$i]."', '".$date_entered."', '".$parent_id."', 0, 0, '".$sub_product_description[$i]."', '".$sub_product_sku[$i]."', '".$sub_product_type[$i]."')");   
    }
}
else{
    $saveSubProd = $db->query("INSERT INTO tc_sub_products(`id`, `name`,  `date_entered`, `parent_id`, `has_sub_products`, `deleted`, `sub_product_description`, `sub_product_sku`, `sub_product_type`) 
        VALUES(UUID(), '".$name."', '".$date_entered."', '".$parent_id."', 0, 0, '".$sub_product_description."', '".$sub_product_sku."', '".$sub_product_type."')");   
}
