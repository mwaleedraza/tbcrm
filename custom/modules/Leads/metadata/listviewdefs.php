<?php
$listViewDefs ['Leads'] = 
array (
  'SERIAL_NO' => 
  array (
    'type' => 'int',
    'label' => 'LBL_SERIAL_NO',
    'width' => '10%',
    'default' => true,
  ),
  'SUGARFIELD_PRIORITY' => 
  array (
    'type' => 'enum',
    'label' => 'LBL_SUGARFIELD_PRIORITY',
    'width' => '10%',
    'default' => true,
  ),
  'NAME' => 
  array (
    'width' => '10%',
    'label' => 'LBL_LIST_NAME',
    'link' => true,
    'orderBy' => 'name',
    'default' => true,
    'related_fields' => 
    array (
      0 => 'first_name',
      1 => 'last_name',
      2 => 'salutation',
    ),
  ),
  'COMPANY_NAME' => 
  array (
    'type' => 'relate',
    'link' => true,
    'label' => 'LBL_ACCOUNTS_NAME',
    'id' => 'COMPANY_ID',
    'width' => '10%',
    'default' => true,
  ),
  'ASSIGNED_USER_NAME' => 
  array (
    'width' => '5%',
    'label' => 'LBL_LIST_ASSIGNED_USER',
    'module' => 'Employees',
    'id' => 'ASSIGNED_USER_ID',
    'default' => true,
  ),
  'SUGARFIELD_AMOUNT' => 
  array (
    'type' => 'number',
    'label' => 'LBL_SUGARFIELD_AMOUNT',
    'width' => '10%',
    'default' => true,
  ),
  'SUGARFIELD_CLOSUREDATE' => 
  array (
    'type' => 'datetimecombo',
    'label' => 'LBL_SUGARFIELD_CLOSUREDATE',
    'width' => '10%',
    'default' => true,
  ),
  'STATUS' => 
  array (
    'width' => '7%',
    'label' => 'LBL_LIST_STATUS',
    'default' => true,
  ),
  'SUGARFIELD_TYPE' => 
  array (
    'type' => 'enum',
    'label' => 'LBL_SUGARFIELD_TYPE',
    'width' => '10%',
    'default' => true,
  ),
  'DATE_ENTERED' => 
  array (
    'width' => '10%',
    'label' => 'LBL_DATE_ENTERED',
    'default' => true,
  ),
  'PRIMARY_ADDRESS_STREET' => 
  array (
    'width' => '10%',
    'label' => 'LBL_PRIMARY_ADDRESS_STREET',
    'default' => false,
  ),
  'PRIMARY_ADDRESS_POSTALCODE' => 
  array (
    'width' => '10%',
    'label' => 'LBL_PRIMARY_ADDRESS_POSTALCODE',
    'default' => false,
  ),
  'ALT_ADDRESS_COUNTRY' => 
  array (
    'width' => '10%',
    'label' => 'LBL_ALT_ADDRESS_COUNTRY',
    'default' => false,
  ),
  'ACCOUNT_NAME' => 
  array (
    'width' => '15%',
    'label' => 'LBL_LIST_ACCOUNT_NAME',
    'default' => false,
    'related_fields' => 
    array (
      0 => 'account_id',
    ),
  ),
  'CONTACTS_NAME' => 
  array (
    'type' => 'relate',
    'link' => true,
    'label' => 'LBL_CONTACTS_NAME',
    'id' => 'CONTACTS_ID',
    'width' => '10%',
    'default' => false,
  ),
  'ALT_ADDRESS_STREET' => 
  array (
    'width' => '10%',
    'label' => 'LBL_ALT_ADDRESS_STREET',
    'default' => false,
  ),
  'ALT_ADDRESS_CITY' => 
  array (
    'width' => '10%',
    'label' => 'LBL_ALT_ADDRESS_CITY',
    'default' => false,
  ),
  'ALT_ADDRESS_STATE' => 
  array (
    'width' => '10%',
    'label' => 'LBL_ALT_ADDRESS_STATE',
    'default' => false,
  ),
  'ALT_ADDRESS_POSTALCODE' => 
  array (
    'width' => '10%',
    'label' => 'LBL_ALT_ADDRESS_POSTALCODE',
    'default' => false,
  ),
  'CREATED_BY' => 
  array (
    'width' => '10%',
    'label' => 'LBL_CREATED',
    'default' => false,
  ),
  'MODIFIED_BY_NAME' => 
  array (
    'width' => '5%',
    'label' => 'LBL_MODIFIED',
    'default' => false,
  ),
);
;
?>
