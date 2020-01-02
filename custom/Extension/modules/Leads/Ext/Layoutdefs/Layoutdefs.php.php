<?php
$layout_defs["Leads"]["subpanel_setup"]['Products'] = array (
          'order' => 100,
          'module' => 'Products',
          'subpanel_name' => 'Products',
          'sort_order' => 'asc',
          'sort_by' => 'id',
          'title_key' => 'SOLUTION_SERVICES',
          'get_subpanel_data' => 'Product Name',
          'top_buttons' => array (
            0 => array (
                'widget_class' => 'SubPanelTopButtonQuickCreate',
              ),
            1 => array (
                 'widget_class' => 'SubPanelTopSelectButton',
                 'mode' => 'MultiSelect',
                   ),
                ),
         );

 ?>
