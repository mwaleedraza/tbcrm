<?php

if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

class changeRenewalFieldsVal
{
    function changeRenewalFieldsValMethod(&$bean, $event, $arguments)
    {
        if($bean->renewal != '' && $bean->renewal != $bean->fetched_row['renewal']){
            $bean->renewal_cron_job = '0';
        }
    }
}
