<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
//ID
$dictionary['Task']['fields']['users_id'] = array(
    'name' => 'users_id',
    'rname' => 'id',
    'vname' => 'LBL_USERS_ID',
    'type' => 'id',
    'table' => 'users',
    'isnull' => 'true',
    'module' => 'Users',
    'dbType' => 'id',
    'reportable' => false,
    'audited' => true,
    'duplicate_merge' => 'disabled',
    'required' => false
);
//Name
$dictionary['Task']['fields']['users_name'] = array(
    'name' => 'users_name',
    'rname' => 'name',
    'id_name' => 'users_id',
    'vname' => 'LBL_USERS_NAME',
    'type' => 'relate',
    'link' => 'users_link',
    'table' => 'users',
    'isnull' => 'true',
    'module' => 'Users',
    'source' => 'non-db',
    'required' => false,
);

//Link
$dictionary['Task']['fields']['users_link'] = array(
    'name'  =>  'users_link',
    'type'  =>  'link',
    'relationship'  =>  'users_rel',
    'module' => 'Users',
    'bean_name' => 'User',
    'source' => 'non-db',
    'vname' => 'LBL_USERS_LINK',
);
//Relationship
$dictionary["Task"]["relationships"]["users_rel"] = array(
    'lhs_module' => 'Users',
    'lhs_table' =>  'users',
    'lhs_key' => 'id',
    'rhs_module' => 'Tasks',
    'rhs_table' =>  'tasks',
    'rhs_key' =>  'users_id',
    'relationship_type' =>  'one-to-many'
);
