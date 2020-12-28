<?php
$module_name = 'AOS_Quotes';
$_object_name = 'aos_quotes';
$viewdefs [$module_name] = 
array (
  'EditView' => 
  array (
    'templateMeta' => 
    array (
      'includes' => 
      array (
        0 => 
        array (
          'file' => 'custom/modules/AOS_Quotes/quotes.js',
        ),
        1 => 
        array (
          'file' => 'custom/modules/AOS_Quotes/fetchLeadProduct.js',
        ),
        2 => 
        array (
          'file' => 'custom/modules/AOS_Quotes/lead_name.js',
        ),
        3 => 
        array (
          'file' => 'custom/modules/AOS_Quotes/companyClient.js',
        ),
      ),
      'form' => 
      array (
        'buttons' => 
        array (
          0 => 'SAVE',
          1 => 'CANCEL',
        ),
      ),
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
        'LBL_ACCOUNT_INFORMATION' => 
        array (
          'newTab' => false,
          'panelDefault' => 'expanded',
        ),
        'LBL_ADDRESS_INFORMATION' => 
        array (
          'newTab' => false,
          'panelDefault' => 'expanded',
        ),
        'LBL_LINE_ITEMS' => 
        array (
          'newTab' => false,
          'panelDefault' => 'expanded',
        ),
      ),
    ),
    'panels' => 
    array (
      'lbl_account_information' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'name',
            'displayParams' => 
            array (
              'required' => true,
            ),
            'label' => 'LBL_NAME',
          ),
          1 => 
          array (
            'name' => 'stage',
            'label' => 'LBL_STAGE',
          ),
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'expiration',
            'label' => 'LBL_EXPIRATION',
          ),
          1 => 
          array (
            'name' => 'invoice_status',
            'label' => 'LBL_INVOICE_STATUS',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'assigned_user_name',
            'label' => 'LBL_ASSIGNED_TO_NAME',
            'customCode' => '{$ASSIGNEDUSER_HTML}',
            'widths' => '100%',
          ),
          1 => 
          array (
            'name' => 'term',
            'label' => 'LBL_TERM',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'approval_status',
            'label' => 'LBL_APPROVAL_STATUS',
          ),
          1 => 
          array (
            'name' => 'approval_issue',
            'label' => 'LBL_APPROVAL_ISSUE',
          ),
        ),
      ),
      'lbl_address_information' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'billing_account',
            'label' => 'LBL_BILLING_ACCOUNT',
            'customCode' => '{$BILLING_ACCOUNT_HTML}',
            'widths' => '100%',
            'displayParams' => 
            array (
              'key' => 
              array (
                0 => 'billing',
                1 => 'shipping',
              ),
              'copy' => 
              array (
                0 => 'billing',
                1 => 'shipping',
              ),
              'billingKey' => 'billing',
              'shippingKey' => 'shipping',
            ),
          ),
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'lead_name',
            'label' => 'LBL_LEAD_NAME',
            'customCode' => '{$LEAD_HTML}',
            'widths' => '100%',
          ),
          1 => '',
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'rfq_ref',
            'label' => 'LBL_RFQ',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'payment',
            'comment' => '',
            'label' => 'LBL_PAYMENT',
          ),
          1 => 
          array (
            'name' => 'po_to_v',
            'label' => 'LBL_PO_TO_V',
          ),
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'status',
            'comment' => '',
            'label' => 'LBL_STATUS',
          ),
          1 => 
          array (
            'name' => 'condition_c',
            'label' => 'LBL_CONDITION',
          ),
        ),
        5 => 
        array (
          0 => 
          array (
            'name' => 'user_name',
            'label' => 'LBL_USER_NAME',
            'customCode' => '{$USER_HTML}',
            'widths' => '100%',
          ),
          1 => 
          array (
            'name' => 'medium',
            'comment' => '',
            'label' => 'LBL_MEDIUM',
          ),
        ),
        6 => 
        array (
          0 => 
          array (
            'name' => 'referencenumber',
            'label' => 'LBL_REFERENCE_NUMBER',
          ),
          1 => 
          array (
            'name' => 'yourreferencenumber',
            'label' => 'LBL_YOUR_REFERENCE_NUMBER',
          ),
        ),
        7 => 
        array (
          0 => 
          array (
            'name' => 'pdftext',
            'label' => 'LBL_PDFTEXT',
          ),
          1 => 
          array (
            'name' => 'ourfirm',
            'comment' => '',
            'label' => 'LBL_OURFIRM',
          ),
        ),
      ),
      'lbl_line_items' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'line_items',
            'label' => 'LBL_LINE_ITEMS',
          ),
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'currency_id',
            'studio' => 'visible',
            'label' => 'LBL_CURRENCY',
          ),
          1 => '',
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'total_amt',
            'label' => 'LBL_TOTAL_AMT',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'discount_amount',
            'label' => 'LBL_DISCOUNT_AMOUNT',
          ),
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'per_unit_cost',
            'label' => 'LBL_PER_UNIT_COST',
          ),
        ),
        5 => 
        array (
          0 => 
          array (
            'name' => 'subtotal_amount',
            'label' => 'LBL_SUBTOTAL_AMOUNT',
          ),
        ),
        6 => 
        array (
          0 => 
          array (
            'name' => 'shipping_amount',
            'label' => 'LBL_SHIPPING_AMOUNT',
            'displayParams' => 
            array (
              'field' => 
              array (
                'onblur' => 'calculateTotal(\'lineItems\');',
              ),
            ),
          ),
        ),
        7 => 
        array (
          0 => 
          array (
            'name' => 'shipping_tax_amt',
            'label' => 'LBL_SHIPPING_TAX_AMT',
          ),
        ),
        8 => 
        array (
          0 => 
          array (
            'name' => 'pra_tax',
            'label' => 'LBL_PRA_TAX',
          ),
          1 => '',
        ),
        9 => 
        array (
          0 => 
          array (
            'name' => 'tax_amount',
            'label' => 'LBL_TAX_AMOUNT',
          ),
        ),
        10 => 
        array (
          0 => 
          array (
            'name' => 'total_amount',
            'label' => 'LBL_GRAND_TOTAL',
          ),
        ),
      ),
    ),
  ),
);
;
?>
