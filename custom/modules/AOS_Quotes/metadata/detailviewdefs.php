<?php
$module_name = 'AOS_Quotes';
$_object_name = 'aos_quotes';
$viewdefs [$module_name] = 
array (
  'DetailView' => 
  array (
    'templateMeta' => 
    array (
      'form' => 
      array (
        'buttons' => 
        array (
          0 => 'EDIT',
          1 => 'DUPLICATE',
          2 => 'DELETE',
          3 => 'FIND_DUPLICATES',
          4 => 
          array (
            'customCode' => '<input type="button" class="button" onClick="showPopup(\'pdf\');" value="{$MOD.LBL_PRINT_AS_PDF}">',
          ),
          5 => 
          array (
            'customCode' => '<input type="button" class="button" onClick="showPopup(\'emailpdf\');" value="{$MOD.LBL_EMAIL_PDF}">',
          ),
          6 => 
          array (
            'customCode' => '<input type="button" class="button" onClick="showPopup(\'email\');return false;" value="{$MOD.LBL_EMAIL_QUOTE}">',
          ),
          7 => 
          array (
            'customCode' => '<input type="submit" class="button" onClick="this.form.action.value=\'createOpportunity\';" value="{$MOD.LBL_CREATE_OPPORTUNITY}">',
            'sugar_html' => 
            array (
              'type' => 'submit',
              'value' => '{$MOD.LBL_CREATE_OPPORTUNITY}',
              'htmlOptions' => 
              array (
                'class' => 'button',
                'id' => 'create_contract_button',
                'title' => '{$MOD.LBL_CREATE_OPPORTUNITY}',
                'onclick' => 'this.form.action.value=\'createOpportunity\';',
                'name' => 'Create Opportunity',
              ),
            ),
          ),
          8 => 
          array (
            'customCode' => '<input type="submit" class="button" onClick="this.form.action.value=\'createContract\';" value="{$MOD.LBL_CREATE_CONTRACT}">',
            'sugar_html' => 
            array (
              'type' => 'submit',
              'value' => '{$MOD.LBL_CREATE_CONTRACT}',
              'htmlOptions' => 
              array (
                'class' => 'button',
                'id' => 'create_contract_button',
                'title' => '{$MOD.LBL_CREATE_CONTRACT}',
                'onclick' => 'this.form.action.value=\'createContract\';',
                'name' => 'Create Contract',
              ),
            ),
          ),
          9 => 
          array (
            'customCode' => '<input type="submit" class="button" onClick="this.form.action.value=\'converToInvoice\';" value="{$MOD.LBL_CONVERT_TO_INVOICE}">',
            'sugar_html' => 
            array (
              'type' => 'submit',
              'value' => '{$MOD.LBL_CONVERT_TO_INVOICE}',
              'htmlOptions' => 
              array (
                'class' => 'button',
                'id' => 'convert_to_invoice_button',
                'title' => '{$MOD.LBL_CONVERT_TO_INVOICE}',
                'onclick' => 'this.form.action.value=\'converToInvoice\';',
                'name' => 'Convert to Invoice',
              ),
            ),
          ),
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
      'useTabs' => true,
      'tabDefs' => 
      array (
        'LBL_PANEL_OVERVIEW' => 
        array (
          'newTab' => true,
          'panelDefault' => 'expanded',
        ),
        'LBL_QUOTE_TO' => 
        array (
          'newTab' => true,
          'panelDefault' => 'expanded',
        ),
        'LBL_LINE_ITEMS' => 
        array (
          'newTab' => true,
          'panelDefault' => 'expanded',
        ),
        'LBL_DETAILVIEW_PANEL1' => 
        array (
          'newTab' => false,
          'panelDefault' => 'expanded',
        ),
        'LBL_PANEL_ASSIGNMENT' => 
        array (
          'newTab' => true,
          'panelDefault' => 'expanded',
        ),
      ),
    ),
    'panels' => 
    array (
      'LBL_PANEL_OVERVIEW' => 
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
            'name' => 'number',
            'label' => 'LBL_QUOTE_NUMBER',
          ),
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'stage',
            'label' => 'LBL_STAGE',
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
            'name' => 'expiration',
            'label' => 'LBL_EXPIRATION',
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
        4 => 
        array (
          0 => 
          array (
            'name' => 'assigned_user_name',
            'label' => 'LBL_ASSIGNED_TO',
          ),
          1 => '',
        ),
      ),
      'LBL_QUOTE_TO' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'billing_account',
            'label' => 'LBL_BILLING_ACCOUNT',
          ),
          1 => 
          array (
            'name' => 'billing_contact',
            'label' => 'LBL_BILLING_CONTACT',
          ),
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'medium',
            'comment' => '',
            'label' => 'LBL_MEDIUM',
          ),
          1 => 
          array (
            'name' => 'lead_name',
            'label' => 'LBL_LEAD_NAME',
          ),
        ),
        2 => 
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
        3 => 
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
        4 => 
        array (
          0 => 
          array (
            'name' => 'user_name',
            'label' => 'LBL_USER_NAME',
          ),
          1 => 
          array (
            'name' => 'rfq_ref',
            'label' => 'LBL_RFQ',
          ),
        ),
        5 => 
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
        6 => 
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
      ),
      'lbl_detailview_panel1' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'tc_total_product_cost_to_company',
            'label' => 'LBL_TC_TOTAL_PRODUCT_COST_TO_COMPANY',
          ),
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'tc_product_price_after_tax',
            'label' => 'LBL_TC_PRODUCT_PRICE_AFTER_TAX',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'tc_product_margin',
            'label' => 'LBL_TC_PRODUCT_MARGIN',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'tc_service_margin',
            'label' => 'LBL_TC_SERVICE_MARGIN',
          ),
          1 => '',
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'tc_total_margin',
            'label' => 'LBL_TC_TOTAL_MARGIN',
          ),
          1 => '',
        ),
      ),
      'LBL_PANEL_ASSIGNMENT' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'date_entered',
            'customCode' => '{$fields.date_entered.value} {$APP.LBL_BY} {$fields.created_by_name.value}',
          ),
          1 => 
          array (
            'name' => 'date_modified',
            'label' => 'LBL_DATE_MODIFIED',
            'customCode' => '{$fields.date_modified.value} {$APP.LBL_BY} {$fields.modified_by_name.value}',
          ),
        ),
      ),
    ),
  ),
);
;
// // hide profit calculation from sales role
// global $current_user;
// // $roleName = '';
// $roleBean=new ACLRole();        
// $roles = $roleBean->getUserRoleNames($current_user->id);
// if(!empty($roles))
// $roleName=$roles['0'];
// var_dump($roleName);
// if(!empty($roleName)){
//   if($roleName == 'Sales'){
//     unset($viewdefs['AOS_Quotes']['DetailView']['panels']['lbl_detailview_panel1']);
//   }
// }
?>
