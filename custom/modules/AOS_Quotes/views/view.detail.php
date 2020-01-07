<?php

if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}


class AOS_QuotesViewDetail extends ViewDetail
{



    public function display()
    {
        unset($this->dv->defs['templateMeta']['form']['buttons'][7]);
        unset($this->dv->defs['templateMeta']['form']['buttons'][8]);

        parent::display();
    }




}
