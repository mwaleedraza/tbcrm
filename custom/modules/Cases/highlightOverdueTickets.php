<?php

if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

class highlightOverdueTickets
{
    function highlightOverdueTicketsMethod(&$bean, $event, $arguments)
    {
        $currentDate = date('Y-m-d');
        $due_date = date("Y-m-d", strtotime($bean->closure_date) );
        if($due_date < $currentDate){
            $bean->closure_date = '<div style="border: 1px solid red">'.$bean->closure_date.'</div>';
        }
    }
}
