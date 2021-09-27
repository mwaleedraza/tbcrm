<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
require_once('include/MVC/View/views/view.list.php');

class TasksViewList extends ViewList
{
    public function __construct()
    {
        parent::__construct();
    }
    public function processSearchForm()
    {
    
        global $current_user, $db;

        $this->params['custom_where'] .= ' AND tasks.status != "Completed"';
        
        parent::processSearchForm();
    }
     function listViewPrepare()
    {
        $_REQUEST['orderBy'] = 'date_entered';
        $_REQUEST['sortOrder'] = 'DESC';

        parent::listViewPrepare();
    }
}
