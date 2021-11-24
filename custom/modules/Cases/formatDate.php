<?php

if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

class FormatDate
{
    function formatDateMethod(&$bean, $event, $arguments)
    {
        $bean->date_entered = dateFormatter($bean->date_entered);
        $bean->date_modified = dateFormatter($bean->date_modified);
    }
}
