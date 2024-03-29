<?php
$viewdefs ['Cases'] = 
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
      'includes' => 
      array (
        0 => 
        array (
          'file' => 'include/javascript/bindWithDelay.js',
        ),
        1 => 
        array (
          'file' => 'modules/AOK_KnowledgeBase/AOK_KnowledgeBase_SuggestionBox.js',
        ),
        2 => 
        array (
          'file' => 'include/javascript/qtip/jquery.qtip.min.js',
        ),
      ),
      'useTabs' => false,
      'tabDefs' => 
      array (
        'LBL_CASE_INFORMATION' => 
        array (
          'newTab' => false,
          'panelDefault' => 'expanded',
        ),
      ),
      'form' => 
      array (
        'enctype' => 'multipart/form-data',
      ),
    ),
    'panels' => 
    array (
      'lbl_case_information' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'name',
            'displayParams' => 
            array (
            ),
          ),
          1 => '',
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'ticket_no',
            'label' => 'LBL_TICKET_NO',
          ),
          1 => 'status',
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'account_name',
            'label' => 'LBL_ACCOUNT_NAME',
            'customCode' => '{$ACCOUNT_HTML}',
            'widths' => '100%',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'contact_name',
            'label' => 'LBL_CONTACT_NAME',
            'customCode' => '{$CONTACT_HTML}',
            'widths' => '100%',
          ),
          1 => 
          array (
            'name' => 'product_name',
            'label' => 'LBL_PRODUCT_NAME',
            'customCode' => '{$PRODUCT_HTML}',
            'widths' => '100%',
          ),
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'closure_date',
            'label' => 'LBL_CLOSURE_DATE',
          ),
          1 => 
          array (
            'name' => 'internal',
            'studio' => 'visible',
            'label' => 'LBL_INTERNAL',
          ),
        ),
        5 => 
        array (
          0 => 
          array (
            'name' => 'assigned_user_name',
            'customCode' => '{$USER_HTML}',
            'widths' => '100%',
          ),
          1 => 
          array (
            'name' => 'case_update_form',
            'studio' => 'visible',
          ),
        ),
        6 => 
        array (
          0 => 
          array (
            'name' => 'description',
          ),
          1 => '',
        ),
      ),
    ),
  ),
);
;
?>
