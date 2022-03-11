<<<<<<< HEAD
<?php

class assignedbyclass{
    public function assignedbymethod(&$bean, $event, $arguments)
    {
        global $current_user;
        if($bean->fetched_row['assigned_user_id']!=$bean->assigned_user_id)
        {
            $bean->assignedby_id=$current_user->id;
        }elseif(empty($bean->fetched_row)){
            $bean->assignedby_id=$current_user->id;
        }
    }
=======
<?php

class assignedbyclass{
    public function assignedbymethod(&$bean, $event, $arguments)
    {
        global $current_user;
        if($bean->fetched_row['assigned_user_id']!=$bean->assigned_user_id)
        {
            $bean->assignedby_id=$current_user->id;
        }elseif(empty($bean->fetched_row)){
            $bean->assignedby_id=$current_user->id;
        }
    }
>>>>>>> f76da31ca3d45dc2af3729a157f7904548c77879
}