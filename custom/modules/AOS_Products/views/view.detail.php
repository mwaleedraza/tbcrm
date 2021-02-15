<?php

if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

require_once 'modules/AOS_Quotes/views/view.detail.php';
class customAOS_ProductsViewDetail extends ViewDetail{
    public function __construct(){
        parent::__construct();
    }
    public function display(){
        global $db;

        //Fetching SubProducts for this product 
        $subProdArr = array();
        $subProdArr2 = array();

        $parent_id = $this->bean->id;
        $getsubProd = $db->query("SELECT * FROM tc_sub_products WHERE parent_id = '".$parent_id."' AND deleted = 0 ORDER BY `tc_sub_products`.`date_entered` DESC");
        while($fetchSubProd = $db->fetchByAssoc($getsubProd)){
            array_push($subProdArr, $fetchSubProd);

            // fetching sub products of sub product IYKWIM
            $getsubProd2 = $db->query("SELECT * FROM tc_sub_products WHERE parent_id = '".$fetchSubProd['id']."' AND deleted = 0 ORDER BY `tc_sub_products`.`date_entered` DESC");
            while($fetchSubProd2 = $db->fetchByAssoc($getsubProd2)){
                array_push($subProdArr2, $fetchSubProd2);
            }
        }
        $this->ss->assign("SUB_PRODUCTS", $subProdArr);
        $this->ss->assign("SUB_PRODUCTS2", $subProdArr2);


        
        



        parent::display();
    }
}