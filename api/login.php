<?php

require('connect.php');
session_start();

if (isset($_POST['email'])){

    $email = stripslashes($_POST['email']);
  
    $password = stripslashes($_POST['password']);
  
    $sql = "SELECT * FROM `user` WHERE `email`=:email";
  
    $query = $db->prepare($sql);
  
    $query->bindValue(':email', $email, PDO::PARAM_STR);
  
    $res = $query->execute();
  
    $res = $query->fetch();
  
    $rows = $query->rowCount();
  
    if($rows){
  
        if(password_verify($password, $res['password'])){
        $_SESSION['email'] = $email;
        $message = "Vous êtes connecté";
        }else {   
            $message="Erreur de mot de passe ".$password.$res['password'];
        }
  
    }else{
      $message = "Le nom d'utilisateur n'existe pas";
    }
}

require('env.php');
/* header('Access-Control-Allow-Origin:' . $url); */
header('Access-Control-Allow-Origin: *');
header('Application-type: application/json');

echo json_encode([
    'email' => $_SESSION['email'] ? $_SESSION['email'] : null,
    'message' => $message ? $message : null
]);

header("Location: ". $url);