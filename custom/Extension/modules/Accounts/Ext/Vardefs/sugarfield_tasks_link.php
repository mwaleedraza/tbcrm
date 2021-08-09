<?php
$dictionary['Account']['fields']['account_task'] =  array(
    'name' => 'account_task',
    'type' => 'link',
    'relationship' => 'account_task_relation',
    'module' => 'Tasks',
    'bean_name' => 'Task',
    'source' => 'non-db',
    'vname' => 'LBL_ACCOUNT_TASK',
);