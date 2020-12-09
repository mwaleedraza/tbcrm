<?php
$dictionary['AOS_Products']['fields']['vendor_id'] = array(
	'name' => 'vendor_dropdown',
	'vname' => 'LBL_VENDOR_DROPDOWN',
    'type' => 'enum',
    'options' => 'vendor_dropdown_list',
    'required' => false,
	'massupdate' => 0,
	'no_default' => false,
	'importable' => 'true',
	'duplicate_merge' => 'disabled',
	'duplicate_merge_dom_value' => '0',
	'audited' => false,
	'reportable' => true,
	'unified_search' => false,
	'merge_filter' => 'disabled',
	'inline_edit' => '1',
);