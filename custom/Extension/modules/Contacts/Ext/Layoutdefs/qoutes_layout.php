<?php
$layout_defs["Contacts"]["subpanel_setup"]["contact_aos_quotes"] = array (
    'order' => 101,
    'module' => 'AOS_Quotes',
    'subpanel_name' => 'default',
    'sort_order' => 'asc',
    'sort_by' => 'id',
    'title_key' => 'AOS_Quotes',
    'get_subpanel_data' => 'aos_quotes',
    'top_buttons' => array (
        0 => array (
            'widget_class' => 'SubPanelTopSelectButton',
            'mode' => 'MultiSelect',
        ),
    ),
);