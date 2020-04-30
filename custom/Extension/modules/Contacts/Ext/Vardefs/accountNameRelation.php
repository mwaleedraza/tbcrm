<?php

$dictionary['Contact']['fields']['accounts_id'] =  array(
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
$dictionary['Contact']['fields']['accounts_name'] =  array(
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
$dictionary['Contact']['fields']['accounts'] =  array(
            'name' => 'accounts',
            'type' => 'link',
            'relationship' => 'accounts_contacts',
            'module' => 'Accounts',
            'bean_name' => 'Account',
            'source' => 'non-db',
            'vname' => 'LBL_ACCOUNTS',
        );
$dictionary['Contact']['relationships']['accounts_contacts'] =  array(
		    'lhs_module' => 'Accounts',
		    'lhs_table' => 'accounts',
		    'lhs_key' => 'id',
		    'rhs_module' => 'Contact',
		    'rhs_table' => 'contacts',
		    'rhs_key' => 'accounts_id',
		    'relationship_type' => 'one-to-many'
        );


?>
