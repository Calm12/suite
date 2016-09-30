<?php

global $db;

$smarty = new Sugar_Smarty();

$sql = "SELECT * FROM `accounts` WHERE `deleted` = 0;";


$result = $db->query($sql, true);

$accounts = array();
$i=-1;
while(($row=$db->fetchByAssoc($result)) != null) {
    $i++;
    $res_row = array();
    $res_row['name'] = $row['name'];
    $res_row['date_entered'] = $row['date_entered'];
    $res_row['website'] = $row['website'];
    $res_row['billing_address_country'] = $row['billing_address_country'];
    $accounts[$i] = $res_row;
}


$smarty->assign('accounts', $accounts);

$smarty->display("modules/Accounts/tpls/AltList.tpl");