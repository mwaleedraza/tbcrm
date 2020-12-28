<?php
if (!defined('sugarEntry') || !sugarEntry)
die('Not A Valid Entry Point');

$data= [];
$GLOBALS['db'];
$lead_id= $_REQUEST['lead_id'];
$lead_query = "SELECT aos_product_id FROM `tc_leads_products` WHERE lead_id = '$lead_id' AND deleted = 0";
$leads = $GLOBALS['db']-> query($lead_query);
while($rows = $GLOBALS['db']->fetchByAssoc($leads)){
  $product_id = $rows['aos_product_id'];
  $product_query = "SELECT id, name, price FROM `aos_products` WHERE id= '$product_id' AND deleted=0";
  $product = $GLOBALS['db']-> query($product_query);
  $product_rows = $GLOBALS['db']->fetchByAssoc($product);
  array_push($data,array("id" => $product_rows['id'], "name" => $product_rows['name']));
  // $data['status'] = $product_rows['name'];
}
echo json_encode($data);
