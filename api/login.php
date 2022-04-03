<?php

require('env.php');
header('Access-Control-Allow-Origin:' . $url);
header('Application-type: application/json');
$data = json_decode(file_get_contents('php://input'), true);

require('connect.php');
session_start();

if (isset($data['email'])){
    $email = stripslashes($data['email']);
    $password = stripslashes($data['password']);
    $sql = "SELECT * FROM `user` WHERE `email`=:email";
    $query = $db->prepare($sql);
    $query->bindValue(':email', $email, PDO::PARAM_STR);
    $res = $query->execute();
    $res = $query->fetch();
  
    $rows = $query->rowCount();
    if($rows){
        $emailCheck = true;

        if(password_verify($password, $res['password'])){
        $passwordCheck = true;
        } else {   
            $passwordCheck = false;
        }

    }else{
      $emailCheck = false;
      $passwordCheck = false;
    }
}
require('close.php');

echo json_encode([
    "email" => $email,
    "emailCheck" => $emailCheck,
    "passwordCheck" => $passwordCheck
]);