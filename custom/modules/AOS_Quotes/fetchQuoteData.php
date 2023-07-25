<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
global $db;
$response = [];
$id = $_REQUEST['id'];

$AOS_QuotesArr = array();
$query1 = "SELECT * FROM aos_quotes WHERE id = '$id' AND deleted='0' ";
$AOS_Quotes = $db->query($query1);
while ($AOS_QuotesRows = $db->fetchByAssoc($AOS_Quotes)) {
    array_push($AOS_QuotesArr, $AOS_QuotesRows);
}

// line items
$aos_products_quotesArr = array();
$query2 = "SELECT * FROM aos_products_quotes WHERE parent_id = '$id' AND deleted='0' ORDER BY `aos_products_quotes`.`date_entered` ASC";
$aos_products_quotes = $db->query($query2);
while ($aos_products_quotesRows = $db->fetchByAssoc($aos_products_quotes)) {
    array_push($aos_products_quotesArr, $aos_products_quotesRows);
}

// response to return
$response['AOS_Quotes'] = $AOS_QuotesArr;
$response['aos_products_quotes'] = $aos_products_quotesArr;
echo json_encode($response);