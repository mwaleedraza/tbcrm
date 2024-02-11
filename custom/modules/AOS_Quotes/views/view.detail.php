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
        parent::display();
    }
}
