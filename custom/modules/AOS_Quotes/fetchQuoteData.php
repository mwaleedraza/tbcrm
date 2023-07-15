<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
global $db;
$response = [];
$id = $_REQUEST['id'];

$AOS_QuotesArr = array();
$query1 = "SELECT * FROM aos_quotes WHERE id = '$id'";
$AOS_Quotes = $db->query($query1);
while ($rows = $db->fetchByAssoc($AOS_Quotes)) {
    array_push($AOS_QuotesArr, $rows);
}

// line items
$aos_products_quotesArr = array();
$query2 = "SELECT * FROM aos_products_quotes WHERE parent_id = '$id'";
$aos_products_quotes = $db->query($query2);
while ($rows = $db->fetchByAssoc($aos_products_quotes)) {
    array_push($aos_products_quotesArr, $rows);
}

// response to return
$response['AOS_Quotes'] = $AOS_QuotesArr;
$response['aos_products_quotes'] = $aos_products_quotesArr;
echo json_encode($response);