<?php
require_once('include/MVC/View/views/view.list.php');

class LeadsViewList extends ViewList
{
    public function __construct()
    {
        parent::__construct();
    }
    public function processSearchForm()
    {

        global $current_user, $db;

        $this->params['custom_where'] .= ' AND leads.status not in ("PO Won", "Dead", "Deal Lost")';
 	    $roleBean=new ACLRole();
        $roles = $roleBean->getUserRoleNames($current_user->id);
        if($current_user->is_admin==0)
        {
            if($roles[0]=='Manager')
            {
                require_once 'modules/SecurityGroups/SecurityGroup.php';
                $group_where = SecurityGroup::getGroupUsersWhere($current_user->id);
                $group_where= 'SELECT id from users WHERE '.$group_where;
    
                $this->params['custom_where'] .= ' AND leads.assigned_user_id IN (' . $group_where . ') AND leads.deleted=0 ';
            }else{
                $this->params['custom_where'] .= ' AND leads.assigned_user_id = "'.$current_user->id.'" ';
                $this->params['custom_where'] .= ' AND leads.deleted = "0" ';
            }
        }

        parent::processSearchForm();
    }
     function listViewPrepare()
    {
        // // if (empty($userPreferenceOrder['orderBy'])) {
        // if (!empty($_REQUEST['orderBy'])) {
        //     $_REQUEST['orderBy'] = 'date_entered';
        // //     $_REQUEST['sortOrder'] = 'DESC';
        // }
        // after testing from live
        echo $_REQUEST['orderBy'];
        if (empty($_REQUEST['orderBy'])) {
        $_REQUEST['orderBy'] = 'date_entered';
        $_REQUEST['sortOrder'] = 'ASC';
    }
        parent::listViewPrepare();
    }
}
