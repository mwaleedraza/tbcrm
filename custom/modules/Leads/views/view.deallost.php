<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
require_once('include/MVC/View/views/view.list.php');

class LeadsViewDealLost extends ViewList
{
	var $type ='deallost';
	public function __construct(){
        parent::__construct();
	}
	public function processSearchForm(){
        global $current_user;
        
        $this->params['custom_where'] .= ' AND leads.status in ("Deal Lost")';
        
		parent::processSearchForm();
	}	
	function listViewPrepare() {
		if(!empty($_REQUEST['orderBy'])) {
			$_REQUEST['orderBy'] = 'leads.date_entered DESC';
		}
		parent::listViewPrepare();
	}
}

