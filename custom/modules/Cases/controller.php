<?php
require_once('modules/Cases/controller.php');
class CustomCasesController extends CasesController{

    function action_closedtickets(){
        $this->view = 'closedtickets';
        return true;
    }
}
?>