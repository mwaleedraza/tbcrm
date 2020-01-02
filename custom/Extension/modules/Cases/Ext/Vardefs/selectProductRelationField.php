<?php  
$dictionary['Case']['fields']['product_id'] =  array(
		    'name' => 'product_id',
		    'rname' => 'id',
		    'vname' => 'LBL_PRODUCT_ID',
		    'type' => 'id',
		    'table' => 'aos_products',
		    'isnull' => 'true',
		    'module' => 'AOS_Products',
		    'dbType' => 'id',
		    'reportable' => false,
		    'audited' => true,
		    'duplicate_merge' => 'disabled',
		    'required' => true,
        );
$dictionary['Case']['fields']['product_name'] =  array(
            'name' => 'product_name',
            'rname' => 'name',
            'id_name' => 'product_id',
            'vname' => 'LBL_PRODUCT_NAME',
            'type' => 'relate',
            'link' => 'products',
            'table' => 'aos_products',
            'isnull' => 'true',
            'module' => 'AOS_Products',
            'source' => 'non-db',
            'required' => true,
        );
$dictionary['Case']['fields']['products'] =  array(
            'name' => 'products',
            'type' => 'link',
            'relationship' => 'products_cases',
            'module' => 'AOS_Products',
            'bean_name' => 'AOS_Product',
            'source' => 'non-db',
            'vname' => 'LBL_PRODUCTS',
        );
$dictionary['Case']['relationships']['products_cases'] =  array(
		    'lhs_module' => 'AOS_Products',
		    'lhs_table' => 'aos_products',
		    'lhs_key' => 'id',
		    'rhs_module' => 'Cases',
		    'rhs_table' => 'cases',
		    'rhs_key' => 'product_id',
		    'relationship_type' => 'one-to-many'
        );

?>