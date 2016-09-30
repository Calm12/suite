<?php

global $db;

$smarty = new Sugar_Smarty();

$sql = "SELECT * FROM `contacts` WHERE `deleted` = 0;";


$result = $db->query($sql, true);

$contacts = array();
$i=-1;
while(($row=$db->fetchByAssoc($result)) != null) {
    $i++;
    $res_row = array();
    $res_row['first_name'] = $row['first_name'];
    $res_row['last_name'] = $row['last_name'];
    $res_row['date_entered'] = $row['date_entered'];
    $res_row['title'] = $row['title'];
    $res_row['birthdate'] = $row['birthdate'];
    $res_row['primary_address_country'] = $row['primary_address_country'];

    if(hasBdate($row['birthdate'])){
        $res_row['bdate'] = 1;
    }

    $contacts[$i] = $res_row;
}


$smarty->assign('contacts', $contacts);

$smarty->display("modules/Contacts/tpls/AltList.tpl");

function hasBdate($bdate){
    $date = date('Y-m-d');
    if(substr($date, 5) == substr($bdate, 5)){
        return true;
    }
    return false;
}