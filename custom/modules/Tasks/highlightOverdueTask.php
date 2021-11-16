<?php

if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

class highlightOverdueTask
{
    function highlightOverdueTaskMethod(&$bean, $event, $arguments)
    {
        if($bean->date_due != ''){
            $currentDate = date('m/d/Y');
            $due_date = date("m/d/Y", strtotime($bean->date_due) );
            if($due_date < $currentDate){
                $bean->date_due = '<div style="border: 1px solid red">'.$due_date.'</div>';
            }
        }
    }
}
