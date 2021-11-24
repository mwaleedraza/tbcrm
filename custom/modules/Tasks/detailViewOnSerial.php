<?php

if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

class detailViewOnSerial
{
    function detailViewOnSerialMethod(&$bean, $event, $arguments)
    {
        $bean->serial_no = '<b><a href="index.php?module=Tasks&action=DetailView&record='.$bean->id.'">'.$bean->serial_no.'</a></b>';
    }
}
