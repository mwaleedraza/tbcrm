<?php
 $dictionary['Contact']['fields']['serial_no'] =  array(
        'name' => 'serial_no',
        'vname' => 'LBL_SERIAL_NO',
        'type' => 'int',
        'readonly' => true,
        'len' => 11,
        'auto_increment' => true,
        'disable_num_format' => true,
    );
$dictionary['Contact']['indices']['serial_no_cstm'] = array(
        'name' => 'serial_no_cstm',
        'type' => 'unique',
        'fields' => array('serial_no'),
);
?>
