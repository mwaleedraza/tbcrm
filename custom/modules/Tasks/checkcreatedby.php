
<?php

global $current_user;

$taskbean=BeanFactory::getBean('Tasks',$_REQUEST['record_id']);
if($current_user->id==$taskbean->created_by ||$current_user->is_admin==1)
{
    echo 1;
}else{
    echo 0;
}