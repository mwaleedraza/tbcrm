<?php

$id=$_REQUEST['id'];

$companybean=BeanFactory::getBean('Accounts',$id);


echo $companybean->account_type;