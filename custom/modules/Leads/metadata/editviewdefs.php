<?php
$viewdefs ['Leads'] = 
array (
  'EditView' => 
  array (
    'templateMeta' => 
    array (
      'includes' => 
      array (
      ),
      'form' => 
      array (
        'hidden' => 
        array (
          0 => '<input type="hidden" name="prospect_id" value="{if isset($smarty.request.prospect_id)}{$smarty.request.prospect_id}{else}{$bean->prospect_id}{/if}">',
          1 => '<input type="hidden" name="account_id" value="{if isset($smarty.request.account_id)}{$smarty.request.account_id}{else}{$bean->account_id}{/if}">',
          2 => '<input type="hidden" name="contact_id" value="{if isset($smarty.request.contact_id)}{$smarty.request.contact_id}{else}{$bean->contact_id}{/if}">',
          3 => '<input type="hidden" name="opportunity_id" value="{if isset($smarty.request.opportunity_id)}{$smarty.request.opportunity_id}{else}{$bean->opportunity_id}{/if}">',
        ),
        'buttons' => 
        array (
          0 => 'SAVE',
          1 => 'CANCEL',
        ),
        'footerTpl' => 'custom/modules/Leads/tpls/productsEditView.tpl',
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
      'javascript' => '<script type="text/javascript" language="Javascript">function copyAddressRight(form)  {ldelim} form.alt_address_street.value = form.primary_address_street.value;form.alt_address_city.value = form.primary_address_city.value;form.alt_address_state.value = form.primary_address_state.value;form.alt_address_postalcode.value = form.primary_address_postalcode.value;form.alt_address_country.value = form.primary_address_country.value;return true; {rdelim} function copyAddressLeft(form)  {ldelim} form.primary_address_street.value =form.alt_address_street.value;form.primary_address_city.value = form.alt_address_city.value;form.primary_address_state.value = form.alt_address_state.value;form.primary_address_postalcode.value =form.alt_address_postalcode.value;form.primary_address_country.value = form.alt_address_country.value;return true; {rdelim} </script>',
      'useTabs' => false,
      'tabDefs' => 
      array (
        'LBL_CONTACT_INFORMATION' => 
        array (
          'newTab' => false,
          'panelDefault' => 'expanded',
        ),
      ),
    ),
    'panels' => 
    array (
      'LBL_CONTACT_INFORMATION' => 
      array (
        0 => 
        array (
          0 => 'last_name',
          1 => 
          array (
            'name' => 'accept_status_name',
            'label' => 'LBL_LIST_ACCEPT_STATUS',
          ),
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'company_name',
            'label' => 'LBL_COMPANYNAME',
            'customCode' => '{$ACCOUNT_HTML}',
            'widths' => '100%',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'sugarfield_type',
            'label' => 'LBL_SUGARFIELD_TYPE',
          ),
          1 => 
          array (
            'name' => 'sugarfield_priority',
            'label' => 'LBL_SUGARFIELD_PRIORITY',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'maturity_percentage',
            'label' => 'LBL_MATURITY_PERCENTAGE',
          ),
          1 => 
          array (
            'name' => 'sale_amount',
            'label' => 'LBL_SALE_AMOUNT',
          ),
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'sugarfield_closuredate',
            'label' => 'LBL_SUGARFIELD_CLOSUREDATE',
          ),
          1 => 
          array (
            'name' => 'alt_address_postalcode',
            'comment' => 'Postal code for alternate address',
            'label' => 'LBL_ALT_ADDRESS_POSTALCODE',
          ),
        ),
        5 => 
        array (
          0 => 
          array (
            'name' => 'assigned_user_name',
            'label' => 'LBL_ASSIGNED_TO',
            'customCode' => '{$USER_HTML}',
            'widths' => '100%',
          ),
          1 => 
          array (
            'name' => 'sugarfield_status',
            'label' => 'LBL_SUGARFIELD_status',
          ),
        ),
        6 => 
        array (
          0 => 'lead_source',
          1 => 
          array (
            'name' => 'approx',
            'label' => 'LBL_APPROX',
          ),
        ),
        7 => 
        array (
          0 => 'description',
          1 => '',
        ),
        8 => 
        array (
          0 => 
          array (
            'name' => 'sugarfield_nextaction',
            'label' => 'LBL_SUGARFIELD_NEXTACTION',
          ),
        ),
        9 => 
        array (
          0 => 
          array (
            'name' => 'renewal',
            'label' => 'LBL_RENEWAL',
          ),
          1 => '',
        ),
      ),
    ),
  ),
);
;
?>
