<?php  
$dictionary['Case']['fields']['contact_id'] =  array(
		    'name' => 'contact_id',
		    'rname' => 'id',
		    'vname' => 'LBL_CONTACT_ID',
		    'type' => 'id',
		    'table' => 'contacts',
		    'isnull' => 'true',
		    'module' => 'Contacts',
		    'dbType' => 'id',
		    'reportable' => false,
		    'audited' => true,
		    'duplicate_merge' => 'disabled',
		    'required' => true,
        );
$dictionary['Case']['fields']['contact_name'] =  array(
            'name' => 'contact_name',
            'rname' => 'name',
            'id_name' => 'contact_id',
            'vname' => 'LBL_CONTACT_NAME',
            'type' => 'relate',
            'link' => 'contacts',
            'table' => 'contacts',
            'isnull' => 'true',
            'module' => 'Contacts',
            'source' => 'non-db',
            'required' => true,
        );
$dictionary['Case']['fields']['contacts'] =  array(
            'name' => 'contacts',
            'type' => 'link',
            'relationship' => 'contacts_cases',
            'module' => 'Contacts',
            'bean_name' => 'Contact',
            'source' => 'non-db',
            'vname' => 'LBL_CONTACTS',
        );
$dictionary['Case']['relationships']['contacts_cases'] =  array(
		    'lhs_module' => 'Contacts',
		    'lhs_table' => 'contacts',
		    'lhs_key' => 'id',
		    'rhs_module' => 'Cases',
		    'rhs_table' => 'cases',
		    'rhs_key' => 'contact_id',
		    'relationship_type' => 'one-to-many'
        );

?>