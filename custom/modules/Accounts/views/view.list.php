<?php
require_once('include/MVC/View/views/view.list.php');

class AccountsViewList extends ViewList
{
    public function __construct()
    {
        parent::__construct();
    }
     function listViewPrepare()
    {
        if (empty($userPreferenceOrder['orderBy'])) {
            $_REQUEST['orderBy'] = 'name';
            $_REQUEST['sortOrder'] = 'ASC';
        }
        parent::listViewPrepare();
    }
}
