<?php
if (!defined('sugarEntry')|| !sugarEntry){
    die('Not A Valid Entry Point');
}

class productDuplication{
	function productDuplicationMethod($bean, $argument, $event){
		global $db;
		$getRow = $db->query("SELECT * FROM `aos_products` WHERE deleted= '0' ");
				
		while ($fetch = $db->fetchByAssoc($getRow)) {
			if ($bean->name == $fetch['name']) {
				SugarApplication::appendErrorMessage('<br><br> <strong>Product with same name can not be added more than once</strong>');
                SugarApplication::redirect('index.php?' . http_build_query($params) . '&module=AOS_Products&action=ListView');
			}
		}
	}
}