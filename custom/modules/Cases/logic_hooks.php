<?php
// Do not store anything in this file that is not part of the array or the hook version.  This file will	
// be automatically rebuilt in the future. 
 $hook_version = 1; 
$hook_array = Array(); 
// position, file, function 
$hook_array['before_save'] = Array(); 
$hook_array['before_save'][] = Array(1, 'Cases push feed', 'modules/Cases/SugarFeeds/CaseFeed.php','CaseFeed', 'pushFeed'); 
$hook_array['before_save'][] = Array(10, 'Save case updates', 'modules/AOP_Case_Updates/CaseUpdatesHook.php','CaseUpdatesHook', 'saveUpdate'); 
$hook_array['before_save'][] = Array(11, 'Save case events', 'modules/AOP_Case_Events/CaseEventsHook.php','CaseEventsHook', 'saveUpdate'); 
$hook_array['before_save'][] = Array(12, 'Case closure prep', 'modules/AOP_Case_Updates/CaseUpdatesHook.php','CaseUpdatesHook', 'closureNotifyPrep'); 
$hook_array['before_save'][] = Array(77, 'updateGeocodeInfo', 'modules/Cases/CasesJjwg_MapsLogicHook.php','CasesJjwg_MapsLogicHook', 'updateGeocodeInfo'); 
$hook_array['after_save'] = Array(); 
$hook_array['after_save'][] = Array(10, 'Send contact case closure email', 'modules/AOP_Case_Updates/CaseUpdatesHook.php','CaseUpdatesHook', 'closureNotify'); 
$hook_array['after_save'][] = Array(77, 'updateRelatedMeetingsGeocodeInfo', 'modules/Cases/CasesJjwg_MapsLogicHook.php','CasesJjwg_MapsLogicHook', 'updateRelatedMeetingsGeocodeInfo'); 
$hook_array['after_save'][] = Array(82, 'assignment alert', 'custom/modules/Cases/assignAlert.php','assignAlert', 'assignAlertMethod');

$hook_array['after_relationship_add'] = Array(); 
$hook_array['after_relationship_add'][] = Array(9, 'Assign account', 'modules/AOP_Case_Updates/CaseUpdatesHook.php','CaseUpdatesHook', 'assignAccount'); 
$hook_array['after_relationship_add'][] = Array(10, 'Send contact case email', 'modules/AOP_Case_Updates/CaseUpdatesHook.php','CaseUpdatesHook', 'creationNotify'); 
$hook_array['after_relationship_add'][] = Array(77, 'addRelationship', 'modules/Cases/CasesJjwg_MapsLogicHook.php','CasesJjwg_MapsLogicHook', 'addRelationship'); 
$hook_array['after_retrieve'] = Array(); 
$hook_array['after_retrieve'][] = Array(10, 'Filter HTML', 'modules/AOP_Case_Updates/CaseUpdatesHook.php','CaseUpdatesHook', 'filterHTML'); 
$hook_array['after_relationship_delete'] = Array(); 
$hook_array['after_relationship_delete'][] = Array(77, 'deleteRelationship', 'modules/Cases/CasesJjwg_MapsLogicHook.php','CasesJjwg_MapsLogicHook', 'deleteRelationship'); 

$hook_array['process_record'] = Array(); 
$hook_array['process_record'][] = Array(78, 'htmlToText', 'custom/modules/Cases/htmlToText.php','htmlToText', 'htmlToTextMethod'); 
$hook_array['process_record'][] = Array(79, 'Highlight overdue tickets', 'custom/modules/Cases/highlightOverdueTickets.php','highlightOverdueTickets', 'highlightOverdueTicketsMethod');
$hook_array['process_record'][] = Array(80, 'Date Format in ListView', 'custom/modules/Cases/formatDate.php','FormatDate', 'formatDateMethod');
$hook_array['process_record'][] = Array(89, 'change ticket number to detailview link', 'custom/modules/Cases/detailViewOnTicket.php','detailViewOnTicket', 'detailViewOnTicketMethod');

?>