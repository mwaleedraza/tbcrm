<?php
    if (!defined('sugarEntry') || !sugarEntry)
        die('Not A Valid Entry Point');
        $GLOBALS['db'];
        $bean = BeanFactory::getBean('Contacts',$_REQUEST['id'] );
        if ($bean->load_relationship('aos_quotes')){
           $relatedBeans = $bean->aos_quotes->getBeans();
           print_r(count($relatedBeans));
        }
