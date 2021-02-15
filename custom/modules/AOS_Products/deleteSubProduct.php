<?php
if (!defined('sugarEntry') || !sugarEntry)
    die('Not A Valid Entry Point');
global $db;

$delId = $_REQUEST['delId'];
$del = $db->query("UPDATE tc_sub_products SET deleted = 1 WHERE id = '".$delId."' ");
if($del){
    echo "Hola";
}