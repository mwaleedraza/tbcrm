<?php

$dictionary['Lead']['fields']['company_id'] =  array(
		    'name' => 'company_id',
		    'rname' => 'id',
		    'vname' => 'LBL_ACCOUNTS_ID',
		    'type' => 'id',
		    'table' => 'accounts',
		    'isnull' => 'true',
		    'module' => 'Accounts',
		    'dbType' => 'id',
		    'reportable' => false,
		    'audited' => true,
		    'duplicate_merge' => 'disabled',
        );
$dictionary['Lead']['fields']['company_name'] =  array(
            'name' => 'company_name',
            'rname' => 'name',
            'id_name' => 'company_id',
            'vname' => 'LBL_ACCOUNTS_NAME',
            'type' => 'relate',
            'link' => 'company',
            'table' => 'accounts',
            'isnull' => 'true',
            'module' => 'Accounts',
            'source' => 'non-db',
            'required' => true,
        );
$dictionary['Lead']['fields']['company'] =  array(
            'name' => 'company',
            'type' => 'link',
            'relationship' => 'company_leads',
            'module' => 'Accounts',
            'bean_name' => 'Account',
            'source' => 'non-db',
            'vname' => 'LBL_ACCOUNTS',
        );
$dictionary['Lead']['relationships']['company_leads'] =  array(
		    'lhs_module' => 'Accounts',
		    'lhs_table' => 'accounts',
		    'lhs_key' => 'id',
		    'rhs_module' => 'Leads',
		    'rhs_table' => 'leads',
		    'rhs_key' => 'company_id',
		    'relationship_type' => 'one-to-many'
        );


?>
