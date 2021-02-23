<?php
if (!defined('sugarEntry') || !sugarEntry)
die('Not A Valid Entry Point');

$data= [];
$GLOBALS['db'];
$lead_id= $_REQUEST['lead_id'];
$lead_query = "SELECT aos_product_id, sub_product_id, sub_sub_product_id FROM `tc_leads_products` WHERE lead_id = '$lead_id' AND deleted = 0 ORDER BY `tc_leads_products`.`date_entered` DESC";
$leads = $GLOBALS['db']-> query($lead_query);
while($rows = $GLOBALS['db']->fetchByAssoc($leads)){
  
  $product_id = $rows['aos_product_id'];
  $sub_product_id = $rows['sub_product_id'];
  $sub_sub_product_id = $rows['sub_sub_product_id'];

  // Fetching Products
  $product_query = "SELECT id, name, price FROM `aos_products` WHERE id= '$product_id' AND deleted=0";
  $product = $GLOBALS['db']-> query($product_query);
  $product_rows = $GLOBALS['db']->fetchByAssoc($product);

  // Fetching Sub Products
  $subQuery = $GLOBALS['db']->query("SELECT `id` FROM tc_sub_products WHERE `id` = '".$sub_product_id."'  AND deleted=0");
  $subProducts = $GLOBALS['db']->fetchByAssoc($subQuery);

  // Fetching Sub Sub Products
  $sub_subQuery = $GLOBALS['db']->query("SELECT `id` FROM tc_sub_products WHERE `id` = '".$sub_sub_product_id."'  AND deleted=0");
  $sub_subProducts = $GLOBALS['db']->fetchByAssoc($sub_subQuery);

  array_push($data,array("id" => $product_rows['id'], "product" => $product_rows['name'], "sub_product" => $subProducts['id'], "sub_sub_product" => $sub_subProducts['id']));

}
echo json_encode($data);
