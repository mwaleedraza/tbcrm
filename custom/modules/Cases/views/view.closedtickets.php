<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
require_once('include/MVC/View/views/view.list.php');

class CasesViewClosedTickets extends ViewList
{
	var $type ='closedtickets';
	
	public function __construct(){
        parent::__construct();
	}
	public function processSearchForm(){

		global $current_user;
		
        $this->params['custom_where'] .= ' AND cases.status = "Closed"';
        
		parent::processSearchForm();
		
	}	
	function listViewPrepare() {
		if(!empty($_REQUEST['orderBy'])) {
			$_REQUEST['orderBy'] = 'cases.date_entered DESC';
		}
		parent::listViewPrepare();
	}
}

