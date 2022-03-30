<?php

require('connect.php');

if (isset($_POST['email'], $_POST['password'])){

    $email = stripslashes($_REQUEST['email']);

    $password = password_hash(stripslashes($_REQUEST['password']), PASSWORD_DEFAULT);

    $sql = "INSERT INTO `user` (`email`, `password`) VALUES (:email, :password);";

    $query = $db->prepare($sql);

    $query->bindValue(':email', $email, PDO::PARAM_STR);

    $query->bindValue(':password', $password, PDO::PARAM_STR);

    $res = $query->execute();

    require('env.php');
    header("Location: ". $url);
}

require_once('close.php');