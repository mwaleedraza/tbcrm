<?php  
$dictionary['Task']['fields']['assignedby_id'] =  array(
        'name' => 'assignedby_id',
        'rname' => 'id',
        'vname' => 'LBL_ASSIGNEDBY_ID',
        'type' => 'id',
        'table' => 'users',
        'isnull' => 'true',
        'module' => 'Users',
        'dbType' => 'id',
        'reportable' => false,
        'audited' => true,
        'duplicate_merge' => 'disabled',
        );
$dictionary['Task']['fields']['assignedby_name'] =  array(
        'name' => 'assignedby_name',
        'rname' => 'name',
        'id_name' => 'assignedby_id',
        'vname' => 'LBL_ASSIGNEDBY_NAME',
        'type' => 'relate',
        'link' => 'users_tasks',
        'table' => 'users',
        'isnull' => 'true',
        'module' => 'Users',
        'source' => 'non-db',
        'required' => true,
        );
$dictionary['Task']['fields']['users_tasks'] =  array(
        'name' => 'users_tasks',
        'type' => 'link',
        'relationship' => 'users_tasks_rel',
        'module' => 'Users',
        'bean_name' => 'User',
        'source' => 'non-db',
        'vname' => 'LBL_USERS',
        );
$dictionary['Task']['relationships']['users_tasks_rel'] =  array(
        'lhs_module' => 'Users',
        'lhs_table' => 'users',
        'lhs_key' => 'id',
        'rhs_module' => 'Tasks',
        'rhs_table' => 'tasks',
        'rhs_key' => 'assignedby_id',
        'relationship_type' => 'one-to-many'
        );


// $dictionary['Lead']['fields']['related_contacts'] = array (
//         'name' => 'related_contacts',
//         'vname' => 'LBL_RELATED_CONTACTS',
//         'function' => 'getcontacts',
//         'type' => 'enum',
//         'len' => '100',
        // 'comment' => 'The template that the project was created from.',
// );

?>