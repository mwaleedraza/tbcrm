<?php
if (!defined('sugarEntry'))
	define('sugarEntry', true);
    require_once('include/SugarPHPMailer.php');
array_push($job_strings, 'leadRenewal');

// scheduler for lead renewal notifications
function leadRenewal(){
   
global $db;

$getLeadsData = $db -> query("SELECT * FROM leads WHERE deleted = 0 AND renewal_cron_job = 0 ");

date_default_timezone_set('Asia/Karachi');
$todayDate = date('Y-m-d');
while($row = $db -> fetchByAssoc($getLeadsData)):
    if($row['renewal'] != ''){
        $renewal_date = date('Y-m-d', strtotime($row['renewal']));
        if($todayDate==date('Y-m-d', strtotime($row['renewal']. ' - '.$row['renewal_days'].' days'))){
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

            $leadbean=BeanFactory::getBean('Leads',$row['id']);
            $renew_leadbean=BeanFactory::newBean('Leads');
            $renew_leadbean->last_name=$leadbean->last_name;
            $renew_leadbean->created_by=$leadbean->created_by;
            $renew_leadbean->description=$leadbean->description;
            $renew_leadbean->assigned_user_id=$leadbean->assigned_user_id;
            $renew_leadbean->sugarfield_closuredate=$leadbean->sugarfield_closuredate;
            $renew_leadbean->alt_address_postalcode=$leadbean->alt_address_postalcode;
            $renew_leadbean->source=$leadbean->source;
            $renew_leadbean->status='';
            $renew_leadbean->account_id=$leadbean->account_id;
            $renew_leadbean->contacts_id=$leadbean->contacts_id;
            $renew_leadbean->sugarfield_amount=$leadbean->sugarfield_amount;
            $renew_leadbean->sugarfield_status='New';
            $renew_leadbean->maturity_percentage=$leadbean->maturity_percentage;
            $renew_leadbean->sugarfield_nextaction=$leadbean->sugarfield_nextaction;
            $renew_leadbean->sugarfield_priority=$leadbean->sugarfield_priority;
            $renew_leadbean->sale_amount=$leadbean->sale_amount;
            $renew_leadbean->products_id=$leadbean->products_id;
            $renew_leadbean->singleproductname=$leadbean->singleproductname;
            $renew_leadbean->sugarfield_type=$leadbean->sugarfield_type;
            $renew_leadbean->other_source=$leadbean->other_source;
            $renew_leadbean->renewal_period=$leadbean->renewal_period;
            $renew_leadbean->renewal_days=$leadbean->renewal_days;
            $renew_leadbean->renewal_status='Renewed';
            $renew_leadbean->oldlead_id=$leadbean->id;
            $renew_leadbean->save();
            $result=$db->query('SELECT email_addresses.email_address FROM email_addresses INNER JOIN email_addr_bean_rel ON email_addresses.id=email_addr_bean_rel.email_address_id where email_addr_bean_rel.bean_id="'.$row['assigned_user_id'].'"');
            while($rows=$db->fetchByAssoc($result))
            {
                echo '<pre>';
                var_dump($rows);
                require_once('include/SugarPHPMailer.php');
                $emailObj = new Email();
                $defaults = $emailObj->getSystemDefaultEmail();
                $mail = new SugarPHPMailer();
                $mail->setMailerForSystem();
                $mail->From = $defaults['email'];
                $mail->FromName = $defaults['name'];
                $mail->Subject = 'Put the title here';
                $mail->Body = 'Put the body here';
                $mail->prepForOutbound();
                $mail->AddAddress($rows['email_address']);
                // $mail->Send();
    
                if($mail->Send())
                {
                    echo '1';
                }else{
                    echo '2';
                }
            }
        }
    }
endwhile; 
}