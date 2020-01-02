<?php

if (!defined('sugarEntry') || !sugarEntry) die('Not a Valid Entry');

class CommentBsHook
{
    function main($bean)
    {
        global $current_user;
        $new = '';
        $old = '';

        /*
            If new record is being saved save new comment only
        */
        if (empty($bean->fetched_row)) {
            $new = ($bean->comment . ('  ') . 'by' . ('  ') . $current_user->user_name);
            $bean->comment = $new;
        }

        /*
          if comment box is empty put old comment value
        */
        if (empty($bean->comment)) {
            $bean->comment = $bean->fetched_row['comment'];
        }


        /*
           If old record is being saved save new comment and old as well
        */
        if (!empty($bean->fetched_row) && !empty($_REQUEST['comment'])) {
            $new = ($bean->comment . ('  ') . 'by' . ('  ') . $current_user->user_name);
            $old = $bean->fetched_row['comment'];
            $com = "$old\n$new";
            nl2br($com);
            $bean->comment = $com;
        }
    }
}