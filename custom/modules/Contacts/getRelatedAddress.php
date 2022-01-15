<?php
global $db;
$id = $_REQUEST['account_id'];
$addressArray = array();

$getQuery = $db->query("SELECT * FROM accounts WHERE deleted = 0 AND id = '".$id."'");
// while($row = $db->fetchByAssoc($getQuery)){
//     array_push($addressArray, $row);
// }
$addressArray = $db->fetchByAssoc($getQuery);
echo json_encode($addressArray);