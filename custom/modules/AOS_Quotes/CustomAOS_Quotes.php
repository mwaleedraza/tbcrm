<?php
if (!defined('sugarEntry') || !sugarEntry) {
die('Not A Valid Entry Point');
}

require_once 'modules/AOS_Quotes/AOS_Quotes.php';


class CustomAOS_Quotes extends AOS_Quotes
{
	public function deleteAttachment($isduplicate = "false")
    {
        $removeFile = null;
        
        if ($this->ACLAccess('edit')) {
            if ($isduplicate == "true") {
                return true;
            }
            $removeFile = "upload://{$this->id}";
        }

        if (file_exists($removeFile)) {
            if (!unlink($removeFile)) {
                $GLOBALS['log']->error("*** Could not unlink() file: [ {$removeFile} ]");
            } else {
                $this->uploadfile = '';
                $this->filename = '';
                $this->file_mime_type = '';
                $this->file = '';
                $this->save();

                return true;
            }
        } else {
            $this->uploadfile = '';
            $this->filename = '';
            $this->file_mime_type = '';
            $this->file = '';
            $this->save();

            return true;
        }

        return false;
    }
}