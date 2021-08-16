<?php
if (!defined('sugarEntry'))
	define('sugarEntry', true);

array_push($job_strings, 'overdueAlert');

// scheduler for overdue tasks notifications
function overdueAlert(){
    global $db;

    $getTasksData = $db -> query("SELECT * FROM `tasks` WHERE `deleted` = 0 AND `status` NOT IN ('Closed', 'Cancelled') AND `overdue_cron_job` = 0 ");
    
    date_default_timezone_set('Asia/Karachi');
    $todayDate = date('Y-m-d');
    // $todayDate = date('Y-m-d', strtotime('1 day', strtotime($todayDate)));
    echo "<pre>";
    while($row = $db -> fetchByAssoc($getTasksData)):
        if($row['date_due'] != ''){
            $due_date = date('Y-m-d', strtotime($row['date_due']));
            // echo $due_date." -- ".$row['name']." -- ".$todayDate."<br>";
            if($due_date == $todayDate){
                $alertBean = BeanFactory::newBean('Alerts');
                $alertBean->name = $row['name'];
                $alertBean->description = "Today is due date of this task";
                $alertBean->target_module = 'Tasks';
                $alertBean->type = 'info';
                $alertBean->reminder_id = $row['assigned_user_id'];
                $alertBean->assigned_user_id = $row['assigned_user_id'];
                $alertBean->is_read = '0';
                $alertBean->url_redirect = 'index.php?action=DetailView&module=Tasks&record=' . $row['id'];
                $alertBean->save();
                $updateTasks = $db->query("UPDATE `tasks` SET `overdue_cron_job` = '1' WHERE `id` = '".$row['id']."'");
            }
        }
    endwhile;
}