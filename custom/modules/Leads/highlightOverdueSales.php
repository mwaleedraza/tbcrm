<?php

if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

class highlightOverdueSales
{
    function highlightOverdueSalesMethod(&$bean, $event, $arguments)
    {
        if($bean->sugarfield_closuredate != ''){
            $currentDate = date('Y-m-d');
            $due_date = date("Y-m-d", strtotime($bean->sugarfield_closuredate) );
            if($due_date < $currentDate){
                $bean->sugarfield_closuredate = '<div style="border: 1px solid red">'.$bean->sugarfield_closuredate.'</div>';
            }
        }
    }
}
