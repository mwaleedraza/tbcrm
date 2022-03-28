<?php

global $sugar_config;
require_once('modules/Configurator/Configurator.php');
    $cfg = new Configurator();
    $cfg->config['list_max_entries_per_page']=$_REQUEST['row'];

    echo $cfg->config['list_max_entries_per_page'];
    
   return $cfg->handleOverride();
