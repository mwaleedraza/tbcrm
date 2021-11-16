<?php

if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

class highlightOverdueTickets
{
    function highlightOverdueTicketsMethod(&$bean, $event, $arguments)
    {
        if($bean->closure_date != ''){
            $currentDate = date('m/d/Y');
            $due_date = date("m/d/Y", strtotime($bean->closure_date) );
            if($due_date < $currentDate){
                $bean->closure_date = '<div style="border: 1px solid red">'.$due_date.'</div>';
            }
            else {
                $bean->closure_date = $due_date;
            }
        }
    }
}
