<?php
$layout_defs["Contacts"]["subpanel_setup"]["contact_aos_invoices"] = array (
    'order' => 102,
    'module' => 'AOS_Invoices',
    'subpanel_name' => 'default',
    'sort_order' => 'asc',
    'sort_by' => 'id',
    'title_key' => 'AOS_Invoices',
    'get_subpanel_data' => 'aos_invoices',
    'top_buttons' => array (
        0 => array (
            'widget_class' => 'SubPanelTopSelectButton',
            'mode' => 'MultiSelect',
        ),
    ),
);
