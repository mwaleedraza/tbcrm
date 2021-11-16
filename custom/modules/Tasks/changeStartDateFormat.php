<?php

if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

class changeStartDateFormat
{
    function changeStartDateFormatMethod(&$bean, $event, $arguments)
    {
        // echo "<pre>";print_r($bean->date_start);die();
        if($bean->date_start != ''){
            $start_date = date("m/d/Y", strtotime($bean->date_start) );
            $bean->date_start = $start_date;
        }
    }
}
