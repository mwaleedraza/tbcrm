<?php

if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

class FormatEstimateFieldClass
{
    function FormatEstimateFieldMethod(&$bean, $event, $arguments)
    {
        $bean->sugarfield_amount='<div style="text-align: right;">'.number_format($bean->sugarfield_amount).'</div>';
    }
}