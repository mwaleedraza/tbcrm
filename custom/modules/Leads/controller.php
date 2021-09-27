<?php
require_once('modules/Leads/controller.php');
class CustomLeadsController extends LeadsController{

    function action_wonleads(){
        $this->view = 'wonleads';
        return true;
    }
}
?>