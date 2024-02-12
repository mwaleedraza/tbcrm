<?php

if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

require_once 'modules/AOS_Quotes/views/view.detail.php';
class customAOS_QuotesViewDetail extends AOS_QuotesViewDetail{
    public function __construct(){
        parent::__construct();
    }
    public function display(){
        unset($this->dv->defs['templateMeta']['form']['buttons'][7]);
        unset($this->dv->defs['templateMeta']['form']['buttons'][8]);
        //JD JavaScript code to hide profit calculation from sales role
        global $current_user;
        $roleName = '';
        $roleBean = new ACLRole();        
        $roles = $roleBean->getUserRoleNames($current_user->id);
        if (!empty($roles)) {
            $roleName = $roles[0];
            if ($roleName == "Sales") {
                 $jScriptToHidePanel = '
                    <script type="text/javascript">
                    $(document).ready(function () { 
                        $("a[href=#top-panel-2]").parents(".panel-default").addClass("hidden");
                    });</script> ';
                echo $jScriptToHidePanel;
            }
        }
        parent::display();
    }
}
