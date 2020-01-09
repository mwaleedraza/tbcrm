<?php  
$dictionary['AOS_Quotes']['fields']['lead_id'] =  array(
		    'name' => 'lead_id',
		    'rname' => 'id',
		    'vname' => 'LBL_LEAD_ID',
		    'type' => 'id',
		    'table' => 'leads',
		    'isnull' => 'true',
		    'module' => 'Leads',
		    'dbType' => 'id',
		    'reportable' => false,
		    'audited' => true,
		    'duplicate_merge' => 'disabled',
        );
$dictionary['AOS_Quotes']['fields']['lead_name'] =  array(
            'name' => 'lead_name',
            'rname' => 'name',
            'id_name' => 'lead_id',
            'vname' => 'LBL_LEAD_NAME',
            'type' => 'relate',
            'link' => 'leads',
            'table' => 'leads',
            'isnull' => 'true',
            'module' => 'Leads',
            'source' => 'non-db',
            'required' => true,
        );
$dictionary['AOS_Quotes']['fields']['leads'] =  array(
            'name' => 'leads',
            'type' => 'link',
            'relationship' => 'leads_quotes',
            'module' => 'Leads',
            'bean_name' => 'Lead',
            'source' => 'non-db',
            'vname' => 'LBL_LEADS',
        );
$dictionary['AOS_Quotes']['relationships']['leads_quotes'] =  array(
		    'lhs_module' => 'Leads',
		    'lhs_table' => 'leads',
		    'lhs_key' => 'id',
		    'rhs_module' => 'AOS_Quotes',
		    'rhs_table' => 'aos_quotes',
		    'rhs_key' => 'lead_id',
		    'relationship_type' => 'one-to-many'
        );

?>