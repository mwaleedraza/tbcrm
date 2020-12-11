<?php  
$dictionary['AOS_Products']['fields']['accounts_id'] =  array(
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
$dictionary['AOS_Products']['fields']['accounts_name'] =  array(
        'name' => 'accounts_name',
        'rname' => 'name',
        'id_name' => 'accounts_id',
        'vname' => 'LBL_ACCOUNTS_NAME',
        'type' => 'relate',
        'link' => 'accounts_product_link',
        'table' => 'accounts',
        'isnull' => 'true',
        'module' => 'Accounts',
        'source' => 'non-db',
        );
$dictionary['AOS_Products']['fields']['accounts_product_link'] =  array(
        'name' => 'accounts_product_link',
        'type' => 'link',
        'relationship' => 'accounts_product',
        'module' => 'Accounts',
        'bean_name' => 'Account',
        'source' => 'non-db',
        'vname' => 'LBL_ACCOUNTS_PRODUCT_LINK',
        );
$dictionary['AOS_Products']['relationships']['accounts_product'] =  array(
        'lhs_module' => 'Accounts',
        'lhs_table' => 'accounts',
        'lhs_key' => 'id',
        'rhs_module' => 'AOS_Products',
        'rhs_table' => 'aos_products',
        'rhs_key' => 'accounts_id',
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