<?php
if (!defined('sugarEntry'))
    define('sugarEntry', true);

class autoRefNoClass{
    function autoRefNoMethod($bean, $event, $arguments){
		// if(empty($bean->fetched_row)){
            $product_short_code = $bean->product_short_code;
            $date = $bean->date_entered;
            $date = date("ymd", strtotime($date));
            $version = 'V1';
            $refNo = $bean->number . '-' . $product_short_code . '-' . $date . '-' . $version;
            $bean->referencenumber = $refNo;
        // }
    }
}