<?php

$id=$_REQUEST['id'];

$leadbean=BeanFactory::getBean('Leads',$id);
// $accountbean=BeanFactory::getBean('Accounts',$leadbean->account_id);
// $contactbean=BeanFactory::getBean('Contacts',$leadbean->contacts_id);
$leaddata=[
    'title'=>$leadbean->last_name,
    'contact'=>$leadbean->contacts_id,
    'account'=>$leadbean->account_id,
    'type'=>$leadbean->sugarfield_type,
    'description'=>$leadbean->description,
];

echo json_encode($leaddata);