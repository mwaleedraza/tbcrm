<?php 

global $module_menu;
// unset original create quote button
unset($module_menu['0']);
// custom create quote button
$module_menu['0']=Array("index.php?module=AOS_Quotes&action=jd_customQuote&return_module=AOS_Quotes&return_action=DetailView", "Create Quote", "Create", "AOS_Quotes");

?>