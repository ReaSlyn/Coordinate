<?php

require('env.php');
header('Access-Control-Allow-Origin:' . $url);
header('Application-type: application/json');
$data = json_decode(file_get_contents('php://input'), true);

require('connect.php');
session_start();

/* Cherche si l'adresse email du compte google est dans la database, si oui, retourne les données de l'utilisateur */
if (isset($data['email'])){
    $email = stripslashes($data['email']);
    $sql = "SELECT * FROM `user` WHERE `email`=:email";
    $query = $db->prepare($sql);
    $query->bindValue(':email', $email, PDO::PARAM_STR);
    $res = $query->execute();
    $res = $query->fetch();
  
    $rows = $query->rowCount();
    if($rows){
        $emailCheck = true;
        $loggedId = $res['id'];
        $role = $res['role'];
        $email = $res['email'];
        $firstName = $res['firstname'];
        $lastName = $res['lastname'];
        } else {   
            $loggedId = null;
            $role = null;
            $email = null;
            $firstName = null;
            $lastName = null;
        }
    } else {
        $loggedId = null;
        $role = null;
        $email = null;
        $firstName = null;
        $lastName = null;
        $emailCheck = false;
};

require('close.php');

echo json_encode([
    "loggedId" => $loggedId,
    "role" => $role,
    "email" => $email,
    "firstName" => $firstName,
    "lastName" => $lastName,
    "emailCheck" => $emailCheck,
]);