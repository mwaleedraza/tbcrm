<?php

if (!defined('sugarEntry') || !sugarEntry) {
die('Not A Valid Entry Point');
}

class changeProductIdToNameClass{
	function changeProductIdToNameMethod(&$bean, $event, $arguments){
        global $db;
        $parentId = $bean->id;
        
        // fetching row from AOS_Products_Quotes
        $lead_query = "SELECT * FROM `aos_products_quotes` WHERE parent_id = '".$parentId."' AND deleted = 0";
        $leads = $db-> query($lead_query);
        while($rows = $db->fetchByAssoc($leads)){
            $product_id = $rows['product_id'];
            //Fetching 'id' and 'name' from AOS_Products where id = product_id of aos_products_quotes table
            $product_query = "SELECT id, name FROM `aos_products` WHERE id= '".$product_id."' AND deleted = 0";
            $product = $db-> query($product_query);
            $product_rows = $db->fetchByAssoc($product);
            
            //Updating name field value from id to name
            $updateProductsName ="UPDATE `aos_products_quotes` SET `name`= '".$product_rows["name"]."' WHERE `product_id` = '".$product_rows["id"]."' ";
            $db->query($updateProductsName);
        }
        
	}
}
?>