<?php

require('env.php');
header('Access-Control-Allow-Origin:' . $url);
header('Application-type: application/json');
$data = json_decode(file_get_contents('php://input'), true);

require('connect.php');
session_start();

/* Cherche l'adresse mail et le mot de passe associé dans la database, regarde en encodant le mot de passe si il correspond avec celui de la database, si oui, le connecte. */
if (isset($data['email'])){
    $email = stripslashes($data['email']);
    $password = stripslashes($data['password']);
    $sql = "SELECT id, role FROM `user` WHERE `email`=:email";
    $query = $db->prepare($sql);
    $query->bindValue(':email', $email, PDO::PARAM_STR);
    $res = $query->execute();
    $res = $query->fetch();
    $rows = $query->rowCount();

    if($rows){
        $emailCheck = true;

        if(password_verify($password, $res['password'])){
        $loggedId = $res['id'];
        $role = $res['role'];
        } else {   
            $loggedId = null;
            $role = null;
        }

    } else {
        $loggedId = null;
        $role = null;
        $emailCheck = false;
    }
}
require('close.php');

echo json_encode([
    "loggedId" => $loggedId,
    "role" => $role,
    "emailCheck" => $emailCheck,
]);