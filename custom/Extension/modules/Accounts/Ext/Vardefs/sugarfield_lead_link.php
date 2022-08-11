<?php
$dictionary['Account']['fields']['company'] =  array(
    'name' => 'company',
    'type' => 'link',
    'relationship' => 'company_leads',
    'module' => 'Leads',
    'bean_name' => 'Lead',
    'source' => 'non-db',
    'vname' => 'LBL_LEAD_LINK',
    );