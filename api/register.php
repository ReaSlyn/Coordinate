<?php

require('env.php');
header('Access-Control-Allow-Origin:' . $url);
header('Application-type: application/json');
$data = json_decode(file_get_contents('php://input'), true);

require('connect.php');

if (isset($data['email'], $data['password'])){
    $email = stripslashes($data['email']);
    $password = password_hash(stripslashes($data['password']), PASSWORD_DEFAULT);
    $firstname = stripslashes($data['firstName']);
    $lastname = strtoupper(stripslashes($data['lastName']));
    try {
        $sql = "INSERT INTO `user` (`email`, `password`, `firstname`, `lastname`) VALUES (:email, :password, :firstname, :lastname);";
        $query = $db->prepare($sql);
        $query->bindValue(':email', $email, PDO::PARAM_STR);
        $query->bindValue(':password', $password, PDO::PARAM_STR);
        $query->bindValue(':firstname', $firstname, PDO::PARAM_STR);
        $query->bindValue(':lastname', $lastname, PDO::PARAM_STR);
        $res = $query->execute();
        echo json_encode([
            "email" => $data["email"],
            "logged" => true,
        ]);
    } catch (PDOException $e) {
        echo json_encode([
            "email" => "",
            "logged" => false,
        ]);
    } 

}

require_once('close.php');