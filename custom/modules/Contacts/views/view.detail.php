<?php

if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
class ContactsViewDetail extends ViewDetail{
    public function display(){
        unset($this->dv->defs['templateMeta']['form']['buttons'][4])
        parent::display();
    }
}
