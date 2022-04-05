<?php

require_once("env.php");
header('Access-Control-Allow-Origin:' . $url);
header('Application-type: application/json');
$data = json_decode(file_get_contents('php://input'), true);

require('connect.php');

/* Sélectionne tout les projets en attente ainsi que l'utilisateur et la première image à afficher */
$sql = "SELECT u.id, u.firstname, u.lastname, r.preview, r.url, r.type, r.project_id, p.id, p.user_id, p.title, p.date, p.description, p.status FROM project p LEFT JOIN resource r on p.id = r.project_id LEFT JOIN user u on p.user_id = u.id WHERE r.preview = 1 AND p.status = 'pending';";
$query = $db->prepare($sql);
$res = $query->execute();
$result = $query->fetchAll(PDO::FETCH_ASSOC);

require('close.php');

echo json_encode([
    "projects" => $result,
]);