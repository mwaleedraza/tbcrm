<?php
$dictionary['Task']['fields']['accounts_id'] =  array(
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
		    'required' => false,
        );
$dictionary['Task']['fields']['accounts_name'] =  array(
            'name' => 'accounts_name',
            'rname' => 'name',
            'id_name' => 'accounts_id',
            'vname' => 'LBL_ACCOUNTS_NAME',
            'type' => 'relate',
            'link' => 'account_task',
            'table' => 'accounts',
            'isnull' => 'true',
            'module' => 'Accounts',
            'source' => 'non-db',
            'required' => false,
        );
$dictionary['Task']['fields']['account_task'] =  array(
            'name' => 'account_task',
            'type' => 'link',
            'relationship' => 'account_task_relation',
            'module' => 'Accounts',
            'bean_name' => 'Account',
            'source' => 'non-db',
            'vname' => 'LBL_ACCOUNT_TASK',
        );
$dictionary['Task']['relationships']['account_task_relation'] =  array(
		    'lhs_module' => 'Accounts',
		    'lhs_table' => 'accounts',
		    'lhs_key' => 'id',
		    'rhs_module' => 'Tasks',
		    'rhs_table' => 'tasks',
		    'rhs_key' => 'user_id',
		    'relationship_type' => 'one-to-many'
        );

?>
