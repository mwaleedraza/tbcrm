<?php  
$dictionary['Lead']['fields']['oldlead_id'] =  array(
        'name' => 'oldlead_id',
        'rname' => 'id',
        'vname' => 'LBL_OLDLEADS_ID',
        'type' => 'id',
        'table' => 'leads',
        'isnull' => 'true',
        'module' => 'Leads',
        'dbType' => 'id',
        'reportable' => false,
        'audited' => true,
        'duplicate_merge' => 'disabled',
        );
$dictionary['Lead']['fields']['oldlead_name'] =  array(
        'name' => 'oldlead_name',
        'rname' => 'name',
        'id_name' => 'oldlead_id',
        'vname' => 'LBL_OLDLEAD_NAME',
        'type' => 'relate',
        'link' => 'leads',
        'table' => 'leads',
        'isnull' => 'true',
        'module' => 'Leads',
        'source' => 'non-db',
        'required' => true,
        );
$dictionary['Lead']['fields']['leads'] =  array(
        'name' => 'leads',
        'type' => 'link',
        'relationship' => 'leads_leads',
        'module' => 'Leads',
        'bean_name' => 'Lead',
        'source' => 'non-db',
        'vname' => 'LBL_OLDLEADS_LINK',
        );
$dictionary['Lead']['relationships']['leads_leads'] =  array(
        'lhs_module' => 'Leads',
        'lhs_table' => 'leads',
        'lhs_key' => 'id',
        'rhs_module' => 'Leads',
        'rhs_table' => 'leads',
        'rhs_key' => 'oldlead_id',
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