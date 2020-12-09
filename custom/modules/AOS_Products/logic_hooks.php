<?php

 $hook_version = 1; 
$hook_array = Array(); 
// position, file, function 
$hook_array['before_save'] = Array(); 
$hook_array['before_save'][] = Array(77, 'checking duplication products name','custom/modules/AOS_Products/productDuplication.php','productDuplication', 'productDuplicationMethod');

?>