<?php
$layout_defs["Accounts"]["subpanel_setup"]["company"] = array (
    'order' => 100,
    'module' => 'Leads',
    'subpanel_name' => 'default',
    'sort_order' => 'asc',
    'sort_by' => 'id',
    'title_key' => 'LBL_LEADS',
    'get_subpanel_data' => 'company',
    'top_buttons' => array (
        0 => array (
             'widget_class' => 'SubPanelTopSelectButton',
             'mode' => 'MultiSelect',
        ),
    ),
);

 ?>
