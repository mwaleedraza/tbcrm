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
 	    $roleBean=new ACLRole();
        $roles = $roleBean->getUserRoleNames($current_user->id);
        $this->params['custom_where'] .= ' AND tasks.status != "Completed"';
        if($current_user->is_admin==0)
        {
            if($roles[0]=='Manager')
            {
                require_once 'modules/SecurityGroups/SecurityGroup.php';
                $group_where = SecurityGroup::getGroupUsersWhere($current_user->id);
                $group_where= 'SELECT id from users WHERE '.$group_where;
    
                $this->params['custom_where'] .= ' AND tasks.assigned_user_id IN (' . $group_where . ') AND tasks.deleted=0 ';
            }else{
                $this->params['custom_where'] .= ' AND tasks.assigned_user_id = "'.$current_user->id.'" ';
                $this->params['custom_where'] .= ' AND tasks.deleted = "0" ';
            }
        }
        // also to show records to participient 
        $this->params['custom_where'] .= ' OR tasks.users_id = "'. $current_user->id .'" AND tasks.status != "Completed"';
        parent::processSearchForm();
    }
     function listViewPrepare()
    {
        $_REQUEST['orderBy'] = 'date_entered';
        $_REQUEST['sortOrder'] = 'DESC';

        parent::listViewPrepare();
    }
}
