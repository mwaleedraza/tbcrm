<?php

if (! defined ( 'sugarEntry' )){
    define ( 'sugarEntry', true );
}
chdir ( ".." );
require_once ('include/entryPoint.php');
global $db;
// $array=[];
$productArray = array();
// Fetching Products
$product_query = "SELECT * FROM `aos_products` WHERE deleted = 0 ";
$products = $db-> query($product_query);
while($rows = $db->fetchByAssoc($products)){
    $name =  $rows['name'];
    //Pushing 'name' and 'id' into $productArr
    $productArray[] = array(
    'id' => $rows['id'],
    'name' => $name
    );
}
echo json_encode($productArray);


