<?php
require_once('include/MVC/View/views/view.list.php');

class CasesViewList extends ViewList
{
    public function __construct()
    {
        parent::__construct();
    }
    public function processSearchForm()
    {

        global $current_user, $db;

        $this->params['custom_where'] .= ' AND cases.status != "Closed"';

        parent::processSearchForm();
    }
     function listViewPrepare()
    {
        if (empty($userPreferenceOrder['orderBy'])) {
            $_REQUEST['orderBy'] = 'date_entered';
            $_REQUEST['sortOrder'] = 'DESC';
        }
        parent::listViewPrepare();
    }
}
