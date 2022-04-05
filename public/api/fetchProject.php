<?php

require_once("env.php");
header('Access-Control-Allow-Origin:' . $url);
header('Application-type: application/json');
$data = json_decode(file_get_contents('php://input'), true);

require('connect.php');

/* Sélectionne les données de l'utilisateur,les ressources, ainsi que le projet associé à l'id du projet */
$projectId = $data['projectId'];
$sql = "SELECT u.id, u.firstname, u.lastname, r.* , p.* FROM project p LEFT JOIN resource r on p.id = r.project_id LEFT JOIN user u on p.user_id = u.id WHERE p.id = '{$projectId}';";
$query = $db->prepare($sql);
$res = $query->execute();
$result = $query->fetchAll(PDO::FETCH_ASSOC);

require('close.php');

echo json_encode([
    "projects" => $result,
]);