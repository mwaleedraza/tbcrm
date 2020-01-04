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
            'name' => 'case_number',
            'type' => 'readonly',
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
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'contact_name',
            'label' => 'LBL_CONTACT_NAME',
          ),
          1 => 
          array (
            'name' => 'product_name',
            'label' => 'LBL_PRODUCT_NAME',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'description',
          ),
        ),
        4 => 
        array (
          0 => 'status',
          1 => '',
        ),
        5 => 
        array (
          0 => 
          array (
            'name' => 'closure_date',
            'label' => 'LBL_CLOSURE_DATE',
          ),
          1 => '',
        ),
        6 => 
        array (
          0 => 
          array (
            'name' => 'internal',
            'studio' => 'visible',
            'label' => 'LBL_INTERNAL',
          ),
        ),
        7 => 
        array (
          0 => 
          array (
            'name' => 'case_update_form',
            'studio' => 'visible',
          ),
        ),
        8 => 
        array (
          0 => 'assigned_user_name',
        ),
      ),
    ),
  ),
);
;
?>
