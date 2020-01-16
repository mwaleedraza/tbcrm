<?php
    if (!defined('sugarEntry') || !sugarEntry)
        die('Not A Valid Entry Point');
        $GLOBALS['db'];
        global $timedate;
        $bean = BeanFactory::getBean('Contacts',$_REQUEST['id'] );
        if ($bean->load_relationship('aos_quotes')){
           $relatedBeans = $bean->aos_quotes->getBeans();
           $count=count($relatedBeans);
           $newbean = BeanFactory::getBean('Contacts');
           $newbean->load_relationship('leads');
           $contact_leads = $newbean->leads->getBeans();
           $sales_count = count($contact_leads);
           date_default_timezone_set('Asia/Karachi');
           $date = date('d/m/Y h:i:s a', time());
            print_r($count."-XYZ- ".$date." - ".$sales_count);
        }
