<?php
$module_name = 'AOS_Products_Quotes';
$viewdefs [$module_name] = 
array (
  'EditView' => 
  array (
    'templateMeta' => 
    array (
      'maxColumns' => '2',
      'widths' => 
      array (
        0 => 
        array (
          'label' => '10',
          'field' => '30',
        ),
        1 => 
        array (
          'label' => '10',
          'field' => '30',
        ),
      ),
      'useTabs' => false,
      'tabDefs' => 
      array (
        'DEFAULT' => 
        array (
          'newTab' => false,
          'panelDefault' => 'expanded',
        ),
      ),
    ),
    'panels' => 
    array (
      'default' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'name',
            'label' => 'LBL_NAME',
          ),
          1 => 
          array (
            'name' => 'product_qty',
            'label' => 'LBL_PRODUCT_QTY',
          ),
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'sub_products',
            'label' => 'LBL_SUB_PRODUCTS',
          ),
          1 => '',
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'product_cost_price',
            'label' => 'LBL_PRODUCT_COST_PRICE',
          ),
          1 => 
          array (
            'name' => 'product_list_price',
            'label' => 'LBL_PRODUCT_LIST_PRICE',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'product_unit_price',
            'label' => 'LBL_PRODUCT_UNIT_PRICE',
          ),
          1 => 
          array (
            'name' => 'vat',
            'label' => 'LBL_VAT',
          ),
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'product_tax_type',
            'label' => 'LBL_PRODUCT_TAX_TYPE',
          ),
          1 => 
          array (
            'name' => 'gst_percentage',
            'label' => 'LBL_GST_PERCENTAGE',
          ),
        ),
        5 => 
        array (
          0 => 
          array (
            'name' => 'pra_percentage',
            'label' => 'LBL_PRA_PERCENTAGE',
          ),
          1 => 
          array (
            'name' => 'vat_amt',
            'label' => 'LBL_VAT_AMT',
          ),
        ),
        6 => 
        array (
          0 => 
          array (
            'name' => 'product_total_price',
            'label' => 'LBL_PRODUCT_TOTAL_PRICE',
          ),
          1 => '',
        ),
        7 => 
        array (
          0 => 
          array (
            'name' => 'product',
            'label' => 'LBL_PRODUCT',
          ),
          1 => 
          array (
            'name' => 'parent_name',
            'label' => 'LBL_FLEX_RELATE',
          ),
        ),
        8 => 
        array (
          0 => 
          array (
            'name' => 'description',
            'label' => 'LBL_DESCRIPTION',
          ),
        ),
        9 => 
        array (
          0 => 
          array (
            'name' => 'service_pra_percentage',
            'label' => 'LBL_SERVICE_PRA_PERCENTAGE',
          ),
          1 => 
          array (
            'name' => 'service_pra_custom_percentage',
            'label' => 'LBL_SERVICE_PRA_CUSTOM_PERCENTAGE',
          ),
        ),
      ),
    ),
  ),
);
;
?>
