<?php

if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

class detailViewOnTicket
{
    function detailViewOnTicketMethod(&$bean, $event, $arguments)
    {
        $bean->ticket_no = '<b><a href="index.php?module=Cases&action=DetailView&record='.$bean->id.'">'.$bean->ticket_no.'</a></b>';
    }
}
