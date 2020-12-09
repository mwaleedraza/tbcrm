<?php  
$dictionary['AOS_Products']['fields']['contacts_id'] =  array(
        'name' => 'contacts_id',
        'rname' => 'id',
        'vname' => 'LBL_CONTACTS_ID',
        'type' => 'id',
        'table' => 'contacts',
        'isnull' => 'true',
        'module' => 'Contacts',
        'dbType' => 'id',
        'reportable' => false,
        'audited' => true,
        'duplicate_merge' => 'disabled',
        );
$dictionary['AOS_Products']['fields']['contacts_name'] =  array(
        'name' => 'contacts_name',
        'rname' => 'name',
        'id_name' => 'contacts_id',
        'vname' => 'LBL_CONTACTS_NAME',
        'type' => 'relate',
        'link' => 'contacts',
        'table' => 'contacts',
        'isnull' => 'true',
        'module' => 'Contacts',
        'source' => 'non-db',
        );
$dictionary['AOS_Products']['fields']['contacts_product_link'] =  array(
        'name' => 'contacts_product_link',
        'type' => 'link',
        'relationship' => 'contacts_product',
        'module' => 'Contacts',
        'bean_name' => 'Contact',
        'source' => 'non-db',
        'vname' => 'LBL_CONTACTS_PRODUCT_LINK',
        );
$dictionary['AOS_Products']['relationships']['contacts_product'] =  array(
        'lhs_module' => 'Contacts',
        'lhs_table' => 'contacts',
        'lhs_key' => 'id',
        'rhs_module' => 'AOS_Products',
        'rhs_table' => 'aos_products',
        'rhs_key' => 'contacts_id',
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