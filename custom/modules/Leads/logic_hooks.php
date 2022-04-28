<?php
// Do not store anything in this file that is not part of the array or the hook version.  This file will
// be automatically rebuilt in the future.
 $hook_version = 1;
$hook_array = Array();
// position, file, function
$hook_array['before_save'] = Array();
$hook_array['before_save'][] = Array(1, 'Leads push feed', 'modules/Leads/SugarFeeds/LeadFeed.php','LeadFeed', 'pushFeed');
$hook_array['before_save'][] = Array(77, 'updateGeocodeInfo', 'modules/Leads/LeadsJjwg_MapsLogicHook.php','LeadsJjwg_MapsLogicHook', 'updateGeocodeInfo');
$hook_array['before_save'][] = Array(79, 'update scheduler bit on renewal date change', 'custom/modules/Leads/changeRenewalFieldsVal.php','changeRenewalFieldsVal', 'changeRenewalFieldsValMethod');

$hook_array['after_save'] = Array();
$hook_array['after_save'][] = Array(77, 'updateRelatedMeetingsGeocodeInfo', 'modules/Leads/LeadsJjwg_MapsLogicHook.php','LeadsJjwg_MapsLogicHook', 'updateRelatedMeetingsGeocodeInfo');
$hook_array['after_save'][] = Array(78, 'save','custom/modules/Leads/beforeSave.php','Save','SaveAll');

$hook_array['process_record'] = Array();
$hook_array['process_record'][] = Array(79, 'Format Estimate Field', 'custom/modules/Leads/FromatEstimateField.php','FormatEstimateFieldClass', 'FormatEstimateFieldMethod');
$hook_array['process_record'][] = Array(79, 'Highlight overdue sales', 'custom/modules/Leads/highlightOverdueSales.php','highlightOverdueSales', 'highlightOverdueSalesMethod');
$hook_array['process_record'][] = Array(80, 'Date Format in ListView', 'custom/modules/Leads/formatDate.php','FormatDate', 'formatDateMethod');
?>
