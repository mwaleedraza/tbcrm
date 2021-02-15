<?php
if (!defined('sugarEntry') || !sugarEntry)
    die('Not A Valid Entry Point');
$GLOBALS['db'];
global $db;
global $timedate;
$id = $_REQUEST['id'];
$resArr = array();
$quoteVersion = 1;
$bean = BeanFactory::getBean('Contacts', $_REQUEST['id']);
if ($bean->load_relationship('aos_quotes')) {
    $relatedBeans = $bean->aos_quotes->getBeans();
    $result = $bean->quotenumber;
    $count = count($relatedBeans);
    $prevResult = $count;
    if ($count == 0 || $count == null) {
        $result = 0;
    } else {
        $result = $count + 1;
    }
    $newbean = BeanFactory::getBean('Contacts');
    $newbean->load_relationship('leads');
    $contact_leads = $newbean->leads->getBeans();
    $sales_count = count($contact_leads);
    date_default_timezone_set('Asia/Karachi');
    $date = date('ymd', time());
    $refNum = $result . " - XYZ - " . $date ." - V ".$quoteVersion;
    $resArr[] = array(
        'refNum' => $refNum,
        'prevQuote' => $prevResult,
        'version' => $quoteVersion
        );
    $bean->quotenumber = $result;

    echo json_encode($resArr);
    $bean->save();
}
