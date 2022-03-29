<?php

require_once('modules/Configurator/Configurator.php');
    $cfg = new Configurator();
    echo $cfg->config['list_max_entries_per_page'];