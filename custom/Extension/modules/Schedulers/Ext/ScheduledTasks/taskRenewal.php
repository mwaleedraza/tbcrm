<?php
if (!defined('sugarEntry'))
	define('sugarEntry', true);

array_push($job_strings, 'taskRenewal');

// scheduler for task renewal notifications
function taskRenewal(){
    global $db;

    $getTasksData = $db -> query("SELECT * FROM `tasks` WHERE `deleted` = 0 AND `renewal_cron_job` = 0");
    
    date_default_timezone_set('Asia/Karachi');
    $todayDate = date('Y-m-d');
    while($row = $db -> fetchByAssoc($getTasksData)):
        if($row['renewal'] != ''){
            $renewal_date = date('Y-m-d', strtotime($row['renewal']));
            if($renewal_date == $todayDate){

                $updateLead = $db->query("UPDATE `tasks` SET `renewal_cron_job` = '1', `status` = 'New' WHERE `id` = '".$row['id']."'");
                $alertBean = BeanFactory::newBean('Alerts');
                $alertBean->name = $row['name'];
                $alertBean->description = "This task is renewed";
                $alertBean->target_module = 'Tasks';
                $alertBean->type = 'info';
                $alertBean->reminder_id = $row['assigned_user_id'];
                $alertBean->assigned_user_id = $row['assigned_user_id'];
                $alertBean->is_read = '0';
                $alertBean->url_redirect = 'index.php?action=DetailView&module=Tasks&record=' . $row['id'];
                $alertBean->save();
            }
        }
    endwhile;
}