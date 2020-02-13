<?php
    if (!defined('sugarEntry') || !sugarEntry)
        die('Not A Valid Entry Point');
        $GLOBALS['db'];
        global $db;
        global $timedate;
        $id = $_REQUEST['id'];
        $bean = BeanFactory::getBean('Contacts',$_REQUEST['id']);
        if ($bean->load_relationship('aos_quotes')){
           $relatedBeans = $bean->aos_quotes->getBeans();
           $result = $bean->quotenumber;
           $count = count($relatedBeans);
           if($result == 0){
               $result=$result;
           }
           else {
               $result = $result+1;
           }
           $newbean = BeanFactory::getBean('Contacts');
           $newbean->load_relationship('leads');
           $contact_leads = $newbean->leads->getBeans();
           $sales_count = count($contact_leads);
           date_default_timezone_set('Asia/Karachi');
           $date = date('dmY', time());
           print_r($result."-XYZ-".$date."-".$sales_count);
           $bean->quotenumber = $result;
           $bean->save();

            
        }
       