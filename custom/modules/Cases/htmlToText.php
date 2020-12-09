<?php

if (!defined('sugarEntry') || !sugarEntry) {
die('Not A Valid Entry Point');
}

class htmlToText{
	function htmlToTextMethod(&$bean, $event, $arguments){
		$bean->description = htmlspecialchars_decode($bean->description);

	}
}
?>