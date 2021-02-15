<?php
// session_start();

if (! defined ( 'sugarEntry' )){
    define ( 'sugarEntry', true );
}

global $db;
$vendorsArr = array();
$vendors = $db->query("SELECT `id`, `name` FROM `accounts` WHERE deleted = 0 AND account_type = 'Vendor'");
while($fetchVendors = $db->fetchByAssoc($vendors)){
    array_push($vendorsArr, $fetchVendors);
}
echo json_encode($vendorsArr);