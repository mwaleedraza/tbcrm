<?php

function dateFormatter($date){
    return date("m/d/Y", strtotime($date));
}