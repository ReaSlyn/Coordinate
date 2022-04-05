<?php

require_once("env.php");
header('Access-Control-Allow-Origin:' . $url);
header('Application-type: application/json');
$data = json_decode(file_get_contents('php://input'), true);

require('connect.php');

/* Sélectionne les données de l'utilisateur*/
$userId = intval($data['userId']);
$sql = "SELECT * FROM user WHERE id = '{$userId}';";
$query = $db->prepare($sql);
$res = $query->execute();
$resultUser = $query->fetchAll(PDO::FETCH_ASSOC);

/* Sélectionne les projets et les ressources associé à l'id de l'utilisateur */
$sql = "SELECT r.*, p.* FROM project p LEFT JOIN resource r ON p.id = r.project_id WHERE p.user_id = '{$userId}' and r.preview = 1;";
$query = $db->prepare($sql);
$res = $query->execute();
$resultProjects = $query->fetchAll(PDO::FETCH_ASSOC);

require('close.php');

echo json_encode([
    "user" => $resultUser,
    "projects" => $resultProjects,
]);