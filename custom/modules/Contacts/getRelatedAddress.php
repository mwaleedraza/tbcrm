<?php
global $db;
$id = $_REQUEST['account_id'];
$addressArray = array();

$getQuery = $db->query("SELECT billing_address_street AS address_street, billing_address_city AS address_city, billing_address_state AS address_state, billing_address_postalcode AS address_postalcode, billing_address_country AS address_country FROM accounts WHERE deleted = 0 AND id = '".$id."'");
while($row = $db->fetchByAssoc($getQuery)){
    array_push($addressArray, $row);
}

echo json_encode($addressArray);