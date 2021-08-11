<?php
// Do not store anything in this file that is not part of the array or the hook version.  This file will
// be automatically rebuilt in the future.
$hook_version = 1;
$hook_array = Array();
// position, file, function
$hook_array['before_save'] = Array();
$hook_array['before_save'][] = Array(1, 'CommentBShook', 'custom/modules/Tasks/CommentBShook.php','CommentBShook', 'main');
$hook_array['after_save'][] = Array(2, 'assignment alert', 'custom/modules/Tasks/assignAlert.php','assignAlert', 'assignAlertMethod');

$hook_array['process_record'] = Array();
$hook_array['process_record'][] = Array(2, 'Highlight overdue tasks', 'custom/modules/Tasks/highlightOverdueTask.php','highlightOverdueTask', 'highlightOverdueTaskMethod');

