<?php

require('env.php');
header('Access-Control-Allow-Origin:' . $url);
header('Application-type: application/json');
$data = json_decode(file_get_contents('php://input'), true);

require('connect.php');

/* Inscrit l'utilisateur si l'adresse email n'existe pas encore dans la base de donnée */
if (isset($data['email'], $data['password'])){
    $email = stripslashes($data['email']);
    $password = password_hash(stripslashes($data['password']), PASSWORD_DEFAULT);
    $firstname = stripslashes($data['firstName']);
    $lastname = strtoupper(stripslashes($data['lastName']));
    $sql = "INSERT INTO `user` (`email`, `password`, `firstname`, `lastname`) VALUES (:email, :password, :firstname, :lastname);";
    $query = $db->prepare($sql);
    $query->bindValue(':email', $email, PDO::PARAM_STR);
    $query->bindValue(':password', $password, PDO::PARAM_STR);
    $query->bindValue(':firstname', $firstname, PDO::PARAM_STR);
    $query->bindValue(':lastname', $lastname, PDO::PARAM_STR);
    $res = $query->execute();
    $userId = $db->lastInsertId();
    }

require('close.php');

echo json_encode([
    "loggedId" => $userId,
    "role" => "student",
]);