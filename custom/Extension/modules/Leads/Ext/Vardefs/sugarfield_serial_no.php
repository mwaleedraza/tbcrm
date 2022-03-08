<?php
 $dictionary['Lead']['fields']['serial_no'] =  array(
        'name' => 'serial_no',
        'vname' => 'LBL_SERIAL_NO',
        'type' => 'int',
        'readonly' => true,
        'len' => 11,
        'auto_increment' => true,
       'disable_num_format' => true,
    );
$dictionary['Lead']['indices']['serial_no_cstm'] = array(
    'name' => 'serial_no_cstm',
    'type' => 'unique',
    'fields' => array('serial_no'),
);
?>
