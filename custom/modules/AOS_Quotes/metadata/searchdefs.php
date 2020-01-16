<?php
$module_name = 'AOS_Quotes';
$_module_name = 'aos_quotes';
$searchdefs [$module_name] = 
array (
  'layout' => 
  array (
    'basic_search' => 
    array (
      'name' => 
      array (
        'name' => 'name',
        'default' => true,
        'width' => '10%',
      ),
      'billing_contact' => 
      array (
        'type' => 'relate',
        'studio' => 'visible',
        'label' => 'LBL_BILLING_CONTACT',
        'id' => 'BILLING_CONTACT_ID',
        'link' => true,
        'width' => '10%',
        'default' => true,
        'name' => 'billing_contact',
      ),
      'referencenumber' => 
      array (
        'type' => 'varchar',
        'label' => 'LBL_REFERENCE_NUMBER',
        'width' => '10%',
        'default' => true,
        'name' => 'referencenumber',
      ),
      'number' => 
      array (
        'type' => 'int',
        'label' => 'LBL_QUOTE_NUMBER',
        'width' => '10%',
        'default' => true,
        'name' => 'number',
      ),
      'lead_name' => 
      array (
        'type' => 'relate',
        'link' => true,
        'label' => 'LBL_LEAD_NAME',
        'id' => 'LEAD_ID',
        'width' => '10%',
        'default' => true,
        'name' => 'lead_name',
      ),
    ),
    'advanced_search' => 
    array (
      'name' => 
      array (
        'name' => 'name',
        'default' => true,
        'width' => '10%',
      ),
      'billing_contact' => 
      array (
        'name' => 'billing_contact',
        'default' => true,
        'width' => '10%',
      ),
      'referencenumber' => 
      array (
        'type' => 'varchar',
        'label' => 'LBL_REFERENCE_NUMBER',
        'width' => '10%',
        'default' => true,
        'name' => 'referencenumber',
      ),
      'billing_account' => 
      array (
        'name' => 'billing_account',
        'default' => true,
        'width' => '10%',
      ),
      'number' => 
      array (
        'name' => 'number',
        'default' => true,
        'width' => '10%',
      ),
      'total_amount' => 
      array (
        'name' => 'total_amount',
        'default' => true,
        'width' => '10%',
      ),
      'expiration' => 
      array (
        'name' => 'expiration',
        'default' => true,
        'width' => '10%',
      ),
      'stage' => 
      array (
        'name' => 'stage',
        'default' => true,
        'width' => '10%',
      ),
      'term' => 
      array (
        'name' => 'term',
        'default' => true,
        'width' => '10%',
      ),
      'assigned_user_id' => 
      array (
        'name' => 'assigned_user_id',
        'type' => 'enum',
        'label' => 'LBL_ASSIGNED_TO',
        'function' => 
        array (
          'name' => 'get_user_array',
          'params' => 
          array (
            0 => false,
          ),
        ),
        'default' => true,
        'width' => '10%',
      ),
    ),
  ),
  'templateMeta' => 
  array (
    'maxColumns' => '3',
    'widths' => 
    array (
      'label' => '10',
      'field' => '30',
    ),
  ),
);
;
?>
