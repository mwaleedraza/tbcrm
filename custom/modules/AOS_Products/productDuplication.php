<?php
if (!defined('sugarEntry')|| !sugarEntry){
    die('Not A Valid Entry Point');
}

class productDuplication{
	function productDuplicationMethod($bean, $argument, $event){
		global $db;
		$getRow = $db->query("SELECT * FROM `aos_products` WHERE deleted= '0' ");
			if(empty($bean->fetched_row)){
					while ($fetch = $db->fetchByAssoc($getRow)) {
						if ($bean->name == $fetch['name']) {
							SugarApplication::appendErrorMessage('<span style="font-size:20px;">Product with same name already exists, Try different name.</span>');
							SugarApplication::redirect('index.php?' . http_build_query($params) . '&module=AOS_Products&action=ListView');
						}
					}
				}
			}
			
}