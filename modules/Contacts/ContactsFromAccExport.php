<?php

    global $db;

    $sql = "SELECT * FROM contacts WHERE id IN (
              SELECT contact_id FROM accounts_contacts WHERE account_id = '" . $_GET['acc_id'] . "' AND deleted = 0
            );";

    $result = $db->query($sql, true);

    $fname = "Download/Human contacts from " . $_GET['acc_name'] . ".txt";

    $fp = fopen($fname, "w");

    $string = "Имя\t\t\tФамилия\t\tСтрана\t\tГород\t\tУлица\t\tДень рождения";
    $written = fwrite($fp, $string . "\r\n\n");
    while(($row = $db->fetchByAssoc($result)) != null){
        //var_dump($row);
        $string = $row['first_name'] . "\t" . $row['last_name'] . "\t" . $row['primary_address_country'] . "\t"
                  . $row['primary_address_city'] . "\t" . $row['primary_address_street'] . "\t" . $row['birthdate'];
        $written = fwrite($fp, $string . "\r\n");
    }
    fclose($fp);

    if($written){
        echo 'Сформирован экспортный файл. Нажмите <a download href="'.$fname.'">Скачать</a>, чтобы сохранить его у себя.';
    }
    else{
        echo 'Произошла ошибка, попробуйте позже.';
    }
