<?php

if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

class highlightOverdueTask
{
    function highlightOverdueTaskMethod(&$bean, $event, $arguments)
    {
        if($bean->date_due != ''){
            $currentDate = date('Y-m-d');
            $due_date = date("Y-m-d", strtotime($bean->date_due) );
            if($due_date < $currentDate){
                $bean->date_due = '<div style="border: 1px solid red">'.$bean->date_due.'</div>';
            }
        }
    }
}
