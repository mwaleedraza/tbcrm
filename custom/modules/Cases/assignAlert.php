
<?php

if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

class assignAlert
{
    function assignAlertMethod(&$bean, $event, $arguments)
    {
        global $db, $sugar_config;
        $baseUrl = $sugar_config['baseUrl'];
        // if(!empty($bean->fetched_row))
        // {

            //alerts and emails for assigned user change
            if($bean->fetched_row['assigned_user_id'] != $bean->assigned_user_id){
                $assigneduserBean = BeanFactory::getBean('Users', $bean->assigned_user_id);
                $assignedbyuserBean = BeanFactory::getBean('Users', $bean->assignedby_id);
                $alertBean = BeanFactory::newBean('Alerts');
                $alertBean->name = $bean->name;
                $alertBean->description = "Ticket:$bean->name is assigned to you";
                $alertBean->target_module = 'Cases';
                $alertBean->type = 'info';
                $alertBean->reminder_id = $bean->assigned_user_id;
                $alertBean->assigned_user_id = $bean->assigned_user_id;
                $alertBean->is_read = '0';
                $alertBean->url_redirect = 'index.php?action=DetailView&module=Cases&record=' . $bean->id;
                $alertBean->save();
                $alertBean = BeanFactory::newBean('Alerts');
                $alertBean->name = $bean->name;
                $alertBean->description = "Ticket:$bean->name You Created is Assigned to ".$assigneduserBean->username;
                $alertBean->target_module = 'Cases';
                $alertBean->type = 'info';
                $alertBean->reminder_id = $bean->created_by;
                $alertBean->assigned_user_id = $bean->created_by;
                $alertBean->is_read = '0';
                $alertBean->url_redirect = 'index.php?action=DetailView&module=Cases&record=' . $bean->id;
                $alertBean->save();
                $alertBean = BeanFactory::newBean('Alerts');
                $alertBean->name = $bean->name;
                $alertBean->description = "You Have Assigned a Ticket:$bean->name to ".$assigneduserBean->username;
                $alertBean->target_module = 'Cases';
                $alertBean->type = 'info';
                $alertBean->reminder_id = $bean->assignedby_id;
                $alertBean->assigned_user_id = $bean->assignedby_id;
                $alertBean->is_read = '0';
                $alertBean->url_redirect = 'index.php?action=DetailView&module=Cases&record=' . $bean->id;
                $alertBean->save();
    
                if($assigneduserBean->email1 != '' || $assigneduserBean->email1 != null){
                    $receiverEmail = $assigneduserBean->email1;
                    $taskUrl = $baseUrl."index.php?module=Cases&action=DetailView&record=$bean->id";
                    $body = '<h3>Hi '.$assigneduserBean->last_name.',</h3>
                                <p>You are responsible person for a new Ticket <strong><a href="'.$taskUrl.'">"'.$bean->name.'"</a></strong></p>';
                    $subject = 'Ticket Assignment | TBCRM';
                    
                    $emailObj = new Email();
                    $defaults = $emailObj->getSystemDefaultEmail();
                    $mail = new SugarPHPMailer();
                    $mail->setMailerForSystem();
                    $mail->From = $defaults['email'];
                    $mail->FromName = $defaults['name'];
                    $mail->Subject = $subject;
                    $mail->Body = $body;
                    $mail->prepForOutbound();
                    $mail->IsHTML(true);
                    $mail->AddAddress($receiverEmail);
                    if($mail->Send()){
                            return true;
                    }
                    else{
                            return false;
                    }
                }
                $createduserBean = BeanFactory::getBean('Users', $bean->created_by);
                if($createduserBean->email1 != '' || $createduserBean->email1 != null){
                    $receiverEmail = $createduserBean->email1;
                    $taskUrl = $baseUrl."index.php?module=Cases&action=DetailView&record=$bean->id";
                    $body = '<h3>Hi '.$createduserBean->last_name.',</h3>
                                <p>You Created a Ticket and it has now been reassigned to '.$createduserBean->last_name.' <strong><a   href="'.$taskUrl.'">"'.$bean->name.'"</a></strong></p>';
                    $subject = 'Ticket Assignment | TBCRM';
                    
                    $emailObj = new Email();
                    $defaults = $emailObj->getSystemDefaultEmail();
                    $mail = new SugarPHPMailer();
                    $mail->setMailerForSystem();
                    $mail->From = $defaults['email'];
                    $mail->FromName = $defaults['name'];
                    $mail->Subject = $subject;
                    $mail->Body = $body;
                    $mail->prepForOutbound();
                    $mail->IsHTML(true);
                    $mail->AddAddress($receiverEmail);
                    if($mail->Send()){
                            echo true;
                    }
                    else{
                            echo false;
                    }
                }
    
                if($assignedbyuserBean->email1 != '' || $assignedbyuserBean->email1 != null){
                    $receiverEmail = $assignedbyuserBean->email1;
                    $taskUrl = $baseUrl."index.php?module=Cases&action=DetailView&record=$bean->id";
                    $body = '<h3>Hi '.$assignedbyuserBean->last_name.',</h3>
                                <p>You have assigned a Ticket to '.$assigneduserBean->last_name.' Ticket Link: <strong><a href="'.$taskUrl.'">"'.$bean->name.'"</a></strong></p>';
                    $subject = 'Ticket Assignment | TBCRM';
                    
                    $emailObj = new Email();
                    $defaults = $emailObj->getSystemDefaultEmail();
                    $mail = new SugarPHPMailer();
                    $mail->setMailerForSystem();
                    $mail->From = $defaults['email'];
                    $mail->FromName = $defaults['name'];
                    $mail->Subject = $subject;
                    $mail->Body = $body;
                    $mail->prepForOutbound();
                    $mail->IsHTML(true);
                    $mail->AddAddress($receiverEmail);
                    if($mail->Send()){
                            echo true;
                    }
                    else{
                            echo false;
                    }
                }
                
            }

            //alerts and emails for status change
            if($bean->fetched_row['status'] != $bean->status){
                $alertBean = BeanFactory::newBean('Alerts');
                $alertBean->name = $bean->name;
                $alertBean->description = "Ticket:$bean->name status has been changed";
                $alertBean->target_module = 'Cases';
                $alertBean->type = 'info';
                $alertBean->reminder_id = $bean->assigned_user_id;
                $alertBean->assigned_user_id = $bean->assigned_user_id;
                $alertBean->is_read = '0';
                $alertBean->url_redirect = 'index.php?action=DetailView&module=Cases&record=' . $bean->id;
                $alertBean->save();
                $alertBean = BeanFactory::newBean('Alerts');
                $alertBean->name = $bean->name;
                $alertBean->description = "Status Changed for Ticket:$bean->name you Created";
                $alertBean->target_module = 'Cases';
                $alertBean->type = 'info';
                $alertBean->reminder_id = $bean->created_by;
                $alertBean->assigned_user_id = $bean->created_by;
                $alertBean->is_read = '0';
                $alertBean->url_redirect = 'index.php?action=DetailView&module=Cases&record=' . $bean->id;
                $alertBean->save();
                $alertBean = BeanFactory::newBean('Alerts');
                $alertBean->name = $bean->name;
                $alertBean->description = "Ticket:$bean->name Status has been changed";
                $alertBean->target_module = 'Cases';
                $alertBean->type = 'info';
                $alertBean->reminder_id = $bean->assignedby_id;
                $alertBean->assigned_user_id = $bean->assignedby_id;
                $alertBean->is_read = '0';
                $alertBean->url_redirect = 'index.php?action=DetailView&module=Cases&record=' . $bean->id;
                $alertBean->save();
    
                $assigneduserBean = BeanFactory::getBean('Users', $bean->assigned_user_id);
                if($assigneduserBean->email1 != '' || $assigneduserBean->email1 != null){
                    $receiverEmail = $assigneduserBean->email1;
                    $taskUrl = $baseUrl."index.php?module=Cases&action=DetailView&record=$bean->id";
                    $body = '<h3>Hi '.$assigneduserBean->last_name.',</h3>
                                <p>You are responsible person for this Ticket its status has been changed <strong><a href="'.$taskUrl.'">"'.$bean->name.'"</a></strong></p>';
                    $subject = 'Status Change | TBCRM';
                    
                    $emailObj = new Email();
                    $defaults = $emailObj->getSystemDefaultEmail();
                    $mail = new SugarPHPMailer();
                    $mail->setMailerForSystem();
                    $mail->From = $defaults['email'];
                    $mail->FromName = $defaults['name'];
                    $mail->Subject = $subject;
                    $mail->Body = $body;
                    $mail->prepForOutbound();
                    $mail->IsHTML(true);
                    $mail->AddAddress($receiverEmail);
                    if($mail->Send()){
                            return true;
                    }
                    else{
                            return false;
                    }
                }
                $createduserBean = BeanFactory::getBean('Users', $bean->created_by);
                if($createduserBean->email1 != '' || $createduserBean->email1 != null){
                    $receiverEmail = $createduserBean->email1;
                    $taskUrl = $baseUrl."index.php?module=Cases&action=DetailView&record=$bean->id";
                    $body = '<h3>Hi '.$createduserBean->last_name.',</h3>
                                <p>You Created a Ticket and its status has been changed <strong><a   href="'.$taskUrl.'">"'.$bean->name.'"</a></strong></p>';
                    $subject = 'Status Change | TBCRM';
                    
                    $emailObj = new Email();
                    $defaults = $emailObj->getSystemDefaultEmail();
                    $mail = new SugarPHPMailer();
                    $mail->setMailerForSystem();
                    $mail->From = $defaults['email'];
                    $mail->FromName = $defaults['name'];
                    $mail->Subject = $subject;
                    $mail->Body = $body;
                    $mail->prepForOutbound();
                    $mail->IsHTML(true);
                    $mail->AddAddress($receiverEmail);
                    if($mail->Send()){
                            echo true;
                    }
                    else{
                            echo false;
                    }
                }
    
                $assignedbyuserBean = BeanFactory::getBean('Users', $bean->assignedby_id);
                if($assignedbyuserBean->email1 != '' || $assignedbyuserBean->email1 != null){
                    $receiverEmail = $assignedbyuserBean->email1;
                    $taskUrl = $baseUrl."index.php?module=Cases&action=DetailView&record=$bean->id";
                    $body = '<h3>Hi '.$assignedbyuserBean->last_name.',</h3>
                                <p>You have assigned a Ticket to '.$assigneduserBean->last_name.' its status has been changed Ticket Link: <strong><a href="'.$taskUrl.'">"'.$bean->name.'"</a></strong></p>';
                    $subject = 'Status Change | TBCRM';
                    
                    $emailObj = new Email();
                    $defaults = $emailObj->getSystemDefaultEmail();
                    $mail = new SugarPHPMailer();
                    $mail->setMailerForSystem();
                    $mail->From = $defaults['email'];
                    $mail->FromName = $defaults['name'];
                    $mail->Subject = $subject;
                    $mail->Body = $body;
                    $mail->prepForOutbound();
                    $mail->IsHTML(true);
                    $mail->AddAddress($receiverEmail);
                    if($mail->Send()){
                            echo true;
                    }
                    else{
                            echo false;
                    }
                }
                
            }
            //alerts and emails for description change
            if($bean->fetched_row['description'] != $bean->description){
                $alertBean = BeanFactory::newBean('Alerts');
                $alertBean->name = $bean->name;
                $alertBean->description = "Description change for Ticket:$bean->name";
                $alertBean->target_module = 'Cases';
                $alertBean->type = 'info';
                $alertBean->reminder_id = $bean->assigned_user_id;
                $alertBean->assigned_user_id = $bean->assigned_user_id;
                $alertBean->is_read = '0';
                $alertBean->url_redirect = 'index.php?action=DetailView&module=Cases&record=' . $bean->id;
                $alertBean->save();
                $alertBean = BeanFactory::newBean('Alerts');
                $alertBean->name = $bean->name;
                $alertBean->description = "Description change for Ticket:$bean->name that you created";
                $alertBean->target_module = 'Cases';
                $alertBean->type = 'info';
                $alertBean->reminder_id = $bean->created_by;
                $alertBean->assigned_user_id = $bean->created_by;
                $alertBean->is_read = '0';
                $alertBean->url_redirect = 'index.php?action=DetailView&module=Cases&record=' . $bean->id;
                $alertBean->save();
                $alertBean = BeanFactory::newBean('Alerts');
                $alertBean->name = $bean->name;
                $alertBean->description = "Description change for this Ticket:$bean->name";
                $alertBean->target_module = 'Cases';
                $alertBean->type = 'info';
                $alertBean->reminder_id = $bean->assignedby_id;
                $alertBean->assigned_user_id = $bean->assignedby_id;
                $alertBean->is_read = '0';
                $alertBean->url_redirect = 'index.php?action=DetailView&module=Cases&record=' . $bean->id;
                $alertBean->save();
    
                $assigneduserBean = BeanFactory::getBean('Users', $bean->assigned_user_id);
                if($assigneduserBean->email1 != '' || $assigneduserBean->email1 != null){
                    $receiverEmail = $assigneduserBean->email1;
                    $taskUrl = $baseUrl."index.php?module=Cases&action=DetailView&record=$bean->id";
                    $body = '<h3>Hi '.$assigneduserBean->last_name.',</h3>
                                <p>You are responsible person for this Ticket its Description has been changed <strong><a href="'.$taskUrl.'">"'.$bean->name.'"</a></strong></p>';
                    $subject = 'Description Change | TBCRM';
                    
                    $emailObj = new Email();
                    $defaults = $emailObj->getSystemDefaultEmail();
                    $mail = new SugarPHPMailer();
                    $mail->setMailerForSystem();
                    $mail->From = $defaults['email'];
                    $mail->FromName = $defaults['name'];
                    $mail->Subject = $subject;
                    $mail->Body = $body;
                    $mail->prepForOutbound();
                    $mail->IsHTML(true);
                    $mail->AddAddress($receiverEmail);
                    if($mail->Send()){
                            return true;
                    }
                    else{
                            return false;
                    }
                }
                $createduserBean = BeanFactory::getBean('Users', $bean->created_by);
                if($createduserBean->email1 != '' || $createduserBean->email1 != null){
                    $receiverEmail = $createduserBean->email1;
                    $taskUrl = $baseUrl."index.php?module=Cases&action=DetailView&record=$bean->id";
                    $body = '<h3>Hi '.$createduserBean->last_name.',</h3>
                                <p>You Created a Ticket and its Description has been changed <strong><a   href="'.$taskUrl.'">"'.$bean->name.'"</a></strong></p>';
                    $subject = 'Description Change | TBCRM';
                    
                    $emailObj = new Email();
                    $defaults = $emailObj->getSystemDefaultEmail();
                    $mail = new SugarPHPMailer();
                    $mail->setMailerForSystem();
                    $mail->From = $defaults['email'];
                    $mail->FromName = $defaults['name'];
                    $mail->Subject = $subject;
                    $mail->Body = $body;
                    $mail->prepForOutbound();
                    $mail->IsHTML(true);
                    $mail->AddAddress($receiverEmail);
                    if($mail->Send()){
                            echo true;
                    }
                    else{
                            echo false;
                    }
                }
    
                $assignedbyuserBean = BeanFactory::getBean('Users', $bean->assignedby_id);
                if($assignedbyuserBean->email1 != '' || $assignedbyuserBean->email1 != null){
                    $receiverEmail = $assignedbyuserBean->email1;
                    $parent_type = $bean->parent_type;
                    $parent_id = $bean->parent_id;
                    $taskUrl = $baseUrl."index.php?module=Cases&action=DetailView&record=$bean->id";
                    $body = '<h3>Hi '.$assignedbyuserBean->last_name.',</h3>
                                <p>You have assigned a Ticket to '.$assigneduserBean->last_name.' its Description has been changed Ticket Link: <strong><a href="'.$taskUrl.'">"'.$bean->name.'"</a></strong></p>';
                    $subject = 'Description Change | TBCRM';
                    
                    $emailObj = new Email();
                    $defaults = $emailObj->getSystemDefaultEmail();
                    $mail = new SugarPHPMailer();
                    $mail->setMailerForSystem();
                    $mail->From = $defaults['email'];
                    $mail->FromName = $defaults['name'];
                    $mail->Subject = $subject;
                    $mail->Body = $body;
                    $mail->prepForOutbound();
                    $mail->IsHTML(true);
                    $mail->AddAddress($receiverEmail);
                    if($mail->Send()){
                            echo true;
                    }
                    else{
                            echo false;
                    }
                }
                
            }
     //}
    }
}
