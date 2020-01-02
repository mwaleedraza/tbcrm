<?php
$dictionary['AOS_Invoices']['fields']['user_id'] =  array(
		    'name' => 'user_id',
		    'rname' => 'id',
		    'vname' => 'LBL_USER_ID',
		    'type' => 'id',
		    'table' => 'users',
		    'isnull' => 'true',
		    'module' => 'Users',
		    'dbType' => 'id',
		    'reportable' => false,
		    'audited' => true,
		    'duplicate_merge' => 'disabled',
		    'required' => true,
        );
$dictionary['AOS_Invoices']['fields']['user_name'] =  array(
            'name' => 'user_name',
            'rname' => 'name',
            'id_name' => 'user_id',
            'vname' => 'LBL_USER_NAME',
            'type' => 'relate',
            'link' => 'users',
            'table' => 'users',
            'isnull' => 'true',
            'module' => 'Users',
            'source' => 'non-db',
            'required' => true,
        );
$dictionary['AOS_Invoices']['fields']['users'] =  array(
            'name' => 'users',
            'type' => 'link',
            'relationship' => 'invoice_users',
            'module' => 'Users',
            'bean_name' => 'User',
            'source' => 'non-db',
            'vname' => 'LBL_USERS',
        );
$dictionary['AOS_Invoices']['relationships']['invoice_users'] =  array(
		    'lhs_module' => 'Users',
		    'lhs_table' => 'users',
		    'lhs_key' => 'id',
		    'rhs_module' => 'AOS_Invoices',
		    'rhs_table' => 'aos_invoices',
		    'rhs_key' => 'user_id',
		    'relationship_type' => 'one-to-many'
        );

?>
