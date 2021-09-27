<?php
require_once('include/MVC/Controller/SugarController.php');
class TasksController extends SugarController{

    function action_closedtasks(){
        $this->view = 'closedtasks';
        return true;
    }
}
?>