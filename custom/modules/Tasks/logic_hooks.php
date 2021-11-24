<?php
// Do not store anything in this file that is not part of the array or the hook version.  This file will
// be automatically rebuilt in the future.
$hook_version = 1;
$hook_array = Array();
// position, file, function
$hook_array['before_save'] = Array();
$hook_array['after_save'] = Array();
$hook_array['before_save'][] = Array(1, 'CommentBShook', 'custom/modules/Tasks/CommentBShook.php','CommentBShook', 'main');
$hook_array['before_save'][] = Array(5, 'update scheduler bit on renewal date change', 'custom/modules/Tasks/changeRenewalFieldsVal.php','changeRenewalFieldsVal', 'changeRenewalFieldsValMethod');

$hook_array['after_save'][] = Array(2, 'assignment alert', 'custom/modules/Tasks/assignAlert.php','assignAlert', 'assignAlertMethod');

$hook_array['process_record'] = Array();
$hook_array['process_record'][] = Array(2, 'Highlight overdue tasks', 'custom/modules/Tasks/highlightOverdueTask.php','highlightOverdueTask', 'highlightOverdueTaskMethod');
$hook_array['process_record'][] = Array(3, 'Change Start Date Format', 'custom/modules/Tasks/changeStartDateFormat.php','changeStartDateFormat', 'changeStartDateFormatMethod');
$hook_array['process_record'][] = Array(5, 'Date Format in ListView', 'custom/modules/Tasks/formatDate.php','FormatDate', 'formatDateMethod');
$hook_array['process_record'][] = Array(6, 'change serial number to detailview link', 'custom/modules/Tasks/detailViewOnSerial.php','detailViewOnSerial', 'detailViewOnSerialMethod');

