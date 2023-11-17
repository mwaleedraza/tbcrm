<?php
if (!defined('sugarEntry'))
    define('sugarEntry', true);

class autoRefNoClass{
    function autoRefNoMethod($bean, $event, $arguments){
		if(empty($bean->fetched_row)){
            $date = $bean->date_entered;
            $date = date("ymd", strtotime($date));
            $textBox = '_____';
            $version = 'V1';
            $refNo = $bean->number . '-' . $textBox . '-' . $date . '-' . $version;
            $bean->referencenumber = $refNo;
        }
    }
}