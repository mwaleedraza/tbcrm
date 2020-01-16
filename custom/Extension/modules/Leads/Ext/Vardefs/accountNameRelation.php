<?php

$dictionary['Lead']['fields']['accounts_id'] =  array(
		    'name' => 'accounts_id',
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
$dictionary['Lead']['fields']['accounts_name'] =  array(
            'name' => 'accounts_name',
            'rname' => 'name',
            'id_name' => 'accounts_id',
            'vname' => 'LBL_ACCOUNTS_NAME',
            'type' => 'relate',
            'link' => 'accounts',
            'table' => 'accounts',
            'isnull' => 'true',
            'module' => 'Accounts',
            'source' => 'non-db',
            'required' => true,
        );
$dictionary['Lead']['fields']['accounts'] =  array(
            'name' => 'accounts',
            'type' => 'link',
            'relationship' => 'accounts_leads',
            'module' => 'Accounts',
            'bean_name' => 'Account',
            'source' => 'non-db',
            'vname' => 'LBL_ACCOUNTS',
        );
$dictionary['Lead']['relationships']['accounts_leads'] =  array(
		    'lhs_module' => 'Accounts',
		    'lhs_table' => 'accounts',
		    'lhs_key' => 'id',
		    'rhs_module' => 'Leads',
		    'rhs_table' => 'leads',
		    'rhs_key' => 'accounts_id',
		    'relationship_type' => 'one-to-many'
        );


?>
