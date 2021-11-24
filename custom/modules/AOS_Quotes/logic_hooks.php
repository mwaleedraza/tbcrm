<?php
// Do not store anything in this file that is not part of the array or the hook version.  This file will	
// be automatically rebuilt in the future. 
 $hook_version = 1; 
$hook_array = Array(); 

// position, file, function 
$hook_array['process_record'] = Array();
$hook_array['process_record'][] = Array(1, 'changeProductIdToName', 'custom/modules/AOS_Quotes/changeProductIdToName.php','changeProductIdToNameClass', 'changeProductIdToNameMethod'); 
$hook_array['process_record'][] = Array(80, 'Date Format in ListView', 'custom/modules/AOS_Quotes/formatDate.php','FormatDate', 'formatDateMethod');
?>