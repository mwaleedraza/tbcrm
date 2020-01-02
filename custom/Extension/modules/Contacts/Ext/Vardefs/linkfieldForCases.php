<?php

$dictionary["Contact"]["fields"]["cases"] =array (
			'required' => false,
            'name' => 'cases',
            'type' => 'link',
            'relationship' => 'contacts_cases',
            'module' => 'cases',
            'bean_name' => 'cases',
            'source' => 'non-db',
            'vname' => 'LBL_CONTACT',
        );


?>