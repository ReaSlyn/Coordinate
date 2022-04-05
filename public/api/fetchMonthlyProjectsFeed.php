<?php

require_once("env.php");
header('Access-Control-Allow-Origin:' . $url);
header('Application-type: application/json');
$data = json_decode(file_get_contents('php://input'), true);

require('connect.php');

if (isset($data["filter"])) {
    /* Sélectionne les 10 projets approuvés avec le plus de likes et prend leur ressource pour afficher celle qui doit être en aoerçu */
    $sql = "SELECT u.id, u.firstname, u.lastname, r.*, p.* FROM project p LEFT JOIN resource r on p.id = r.project_id LEFT JOIN user u on p.user_id = u.id WHERE r.preview = 1 AND p.status = 'approved' ORDER BY likes DESC LIMIT 10;";
} else {
    /* Sélectionne les 4 projets approuvés avec le plus de likes et prend leur ressource pour afficher celle qui doit être en aoerçu */
    $sql = "SELECT u.id, u.firstname, u.lastname, r.*, p.* FROM project p LEFT JOIN resource r on p.id = r.project_id LEFT JOIN user u on p.user_id = u.id WHERE r.preview = 1 AND p.status = 'approved' ORDER BY likes DESC LIMIT 4;";
}
$query = $db->prepare($sql);
$res = $query->execute();
$result = $query->fetchAll(PDO::FETCH_ASSOC);

require('close.php');

echo json_encode([
    "projects" => $result
]);