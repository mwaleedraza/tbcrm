<?php

if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

class highlightOverdueSales
{
    function highlightOverdueSalesMethod(&$bean, $event, $arguments)
    {
        if($bean->sugarfield_closuredate != ''){
            $currentDate = date('m/d/Y');
            $due_date = date("m/d/Y", strtotime($bean->sugarfield_closuredate) );
            if($due_date < $currentDate){
                $bean->sugarfield_closuredate = '<div style="border: 1px solid red">'.$due_date.'</div>';
            }
            else {
                $bean->sugarfield_closuredate = $due_date;
            }
        }
    }
}
