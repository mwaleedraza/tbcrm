
<?php

global $current_user;

$taskbean=BeanFactory::getBean('Tasks',$_REQUEST['record_id']);
if($current_user->id==$taskbean->created_by)
{
    echo 1;
}else{
    echo 0;
}