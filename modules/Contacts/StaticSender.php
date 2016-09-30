<?php

    $mail = new SugarPHPMailer();
    $mail->setMailerForSystem();

    $mail->addAddress($_GET['email']);
    $mail->FromName = $_GET['user'];

    $mail->Subject = "Тема письма";
    $mail->Body = "Добрый день, ".$_GET['name']."!\n\nВы получили это письмо. Все.\n\nС уважением, ".$_GET['user'];
    $xx = $mail->Send();

    if($xx){
        echo "Письмо контакту ".$_GET['name']." (".$_GET['email'].") успешно отправлено.";
    }
    else{
        echo "Отправка письма контакту ".$_GET['name']." (".$_GET['email'].") завершилась неудачно.";
    }