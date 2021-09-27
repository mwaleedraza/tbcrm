<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
require_once('include/MVC/View/views/view.list.php');

class TasksViewClosedTasks extends ViewList
{
	
	var $type ='closedtasks';
	public function __construct(){
        parent::__construct();
	}
	public function processSearchForm(){
        global $current_user, $db;
        
        $this->params['custom_where'] .= ' AND tasks.status = "Completed"';
        
		parent::processSearchForm();
	}	
	function listViewPrepare() {
		if(!empty($_REQUEST['orderBy'])) {
			$_REQUEST['orderBy'] = 'tasks.date_entered DESC';
		}
		parent::listViewPrepare();
	}
}

