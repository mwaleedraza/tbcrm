<?php

if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

class assignAlert
{
    function assignAlertMethod(&$bean, $event, $arguments)
    {
        if($bean->fetched_row['assigned_user_id'] != $bean->assigned_user_id){
            $alertBean = BeanFactory::newBean('Alerts');
            $alertBean->name = $bean->name;
            $alertBean->description = "Task is assigned to you";
            $alertBean->target_module = 'Tasks';
            $alertBean->type = 'info';
            $alertBean->reminder_id = $bean->assigned_user_id;
            $alertBean->assigned_user_id = $bean->assigned_user_id;
            $alertBean->is_read = '0';
            $alertBean->url_redirect = 'index.php?action=DetailView&module=Tasks&record=' . $bean->id;
            $alertBean->save();
        }
    }
}
