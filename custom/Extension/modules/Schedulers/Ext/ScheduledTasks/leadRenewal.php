<?php
if (!defined('sugarEntry'))
	define('sugarEntry', true);

array_push($job_strings, 'leadRenewal');

// scheduler for lead renewal notifications
function leadRenewal(){
    global $db;

    $getLeadsData = $db -> query("SELECT * FROM `leads` WHERE `deleted` = 0 AND `renewal_cron_job` = 0");
    
    date_default_timezone_set('Asia/Karachi');
    $todayDate = date('Y-m-d');
    while($row = $db -> fetchByAssoc($getLeadsData)):
        if($row['renewal'] != ''){
            $renewal_date = date('Y-m-d', strtotime($row['renewal']));
            if($renewal_date == $todayDate){

                $updateLead = $db->query("UPDATE `leads` SET `renewal_cron_job` = '1', `sugarfield_status` = 'New' WHERE `id` = '".$row['id']."'");
                $alertBean = BeanFactory::newBean('Alerts');
                $alertBean->name = $row['last_name'];
                $alertBean->description = "This lead is renewed";
                $alertBean->target_module = 'Leads';
                $alertBean->type = 'info';
                $alertBean->reminder_id = $row['assigned_user_id'];
                $alertBean->assigned_user_id = $row['assigned_user_id'];
                $alertBean->is_read = '0';
                $alertBean->url_redirect = 'index.php?action=DetailView&module=Leads&record=' . $row['id'];
                $alertBean->save();
            }
        }
    endwhile;
}