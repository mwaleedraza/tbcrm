<?php
$viewdefs ['Leads'] = 
array (
  'EditView' => 
  array (
    'templateMeta' => 
    array (
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
            'name' => 'accounts_name',
            'label' => 'LBL_ACCOUNTS_NAME',
          ),
          1 => 
          array (
            'name' => 'contacts_name',
            'label' => 'LBL_CONTACTS_NAME',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'sugarfield_amount',
            'label' => 'LBL_SUGARFIELD_AMOUNT',
          ),
          1 => 
          array (
            'name' => 'sugarfield_type',
            'label' => 'LBL_SUGARFIELD_TYPE',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'sugarfield_priority',
            'label' => 'LBL_SUGARFIELD_PRIORITY',
          ),
          1 => 
          array (
            'name' => 'sugarfield_closuredate',
            'label' => 'LBL_SUGARFIELD_CLOSUREDATE',
          ),
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'alt_address_postalcode',
            'comment' => 'Postal code for alternate address',
            'label' => 'LBL_ALT_ADDRESS_POSTALCODE',
          ),
          1 => 
          array (
            'name' => 'assigned_user_name',
            'label' => 'LBL_ASSIGNED_TO',
          ),
        ),
        5 => 
        array (
          0 => 
          array (
            'name' => 'sugarfield_status',
            'label' => 'LBL_SUGARFIELD_status',
          ),
          1 => 'lead_source',
        ),
        6 => 
        array (
          0 => 'description',
          1 => 
          array (
            'name' => 'sugarfield_nextaction',
            'label' => 'LBL_SUGARFIELD_NEXTACTION',
          ),
        ),
      ),
    ),
  ),
);
;
?>
