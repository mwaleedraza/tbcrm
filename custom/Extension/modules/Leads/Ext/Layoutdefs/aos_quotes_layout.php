<?php
$layout_defs["Leads"]["subpanel_setup"]["aos_quotes_layout"] = array (
    'order' => 100,
    'module' => 'AOS_Quotes',
    'subpanel_name' => 'default',
    'sort_order' => 'asc',
    'sort_by' => 'id',
    'title_key' => 'LBL_AOS_QUOTES',
    'get_subpanel_data' => 'aos_quotes',
    'top_buttons' => array (
    // 0 => array (
        // 'widget_class' => 'SubPanelTopButtonQuickCreate',
    // ),
        0 => array (
             'widget_class' => 'SubPanelTopSelectButton',
             'mode' => 'MultiSelect',
        ),
    ),
);

 ?>
