<?php
// session_start();

if (! defined ( 'sugarEntry' )){
    define ( 'sugarEntry', true );
}
chdir ( ".." );
require_once ('include/entryPoint.php');
global $db;
$id = $_REQUEST['id'];
// $array=[];
$array = array();

$getProduct_query = "SELECT * FROM `aos_products` WHERE accounts_id= '".$id."' AND deleted = 0 ";
$products = $db-> query($getProduct_query);
while($fetchProducts = $db->fetchByAssoc($products)){
    // $name = $fetchProducts['name'];
    $array[] = array(
    'id' => $fetchProducts['id'],
    'name' => $fetchProducts['name']
    );
// array_push($array,$full_name);
// print_r($rows);
// echo json_encode($array, JSON_FORCE_OBJECT);

}
echo json_encode($array);
// session_write_close ();


