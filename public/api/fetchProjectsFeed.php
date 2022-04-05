<?php

require_once("env.php");
header('Access-Control-Allow-Origin:' . $url);
header('Application-type: application/json');
$data = json_decode(file_get_contents('php://input'), true);

require('connect.php');

if (!isset($data["searchTerm"]) && !isset($data["filter"])) {

    /* Sélectionne 20 projets aléatoirement approuvé et prend leur ressource pour afficher celle qui doit être en aoerçu */
    $sql = "SELECT u.id, u.firstname, u.lastname, r.*, p.* FROM project p LEFT JOIN resource r on p.id = r.project_id LEFT JOIN user u on p.user_id = u.id WHERE r.preview = 1 AND p.status = 'approved' ORDER BY RAND() LIMIT 20;";
    
} else if (isset($data["searchTerm"]) && $data["filter"] !== "") {

    $filter = $data["filter"];
    $searchTerm = "%{$data['searchTerm']}%";
    $sql = "SELECT u.id, u.firstname, u.lastname, r.*, p.* FROM project p LEFT JOIN resource r on p.id = r.project_id LEFT JOIN user u on p.user_id = u.id WHERE r.preview = 1 AND p.status = 'approved' AND p.primary_tag = '{$filter}' AND p.title LIKE '{$searchTerm}' ORDER BY RAND() LIMIT 20;";

} else if (isset($data["searchTerm"])) {

    /* Sélectionne 20 projets aléatoirement approuvé récemment et prend leur ressource pour afficher celle qui doit être en aoerçu */
    $searchTerm = "%{$data['searchTerm']}%";
    $sql = "SELECT u.id, u.firstname, u.lastname, r.*, p.* FROM project p LEFT JOIN resource r on p.id = r.project_id LEFT JOIN user u on p.user_id = u.id WHERE r.preview = 1 AND p.status = 'approved' AND p.title LIKE '{$searchTerm}' ORDER BY RAND() LIMIT 20;";
    
} else if ($data["filter"] !== "") {

    $filter = $data["filter"];
    /* Sélectionne 20 projets aléatoirement approuvé récemment avec un tag primaire spécifique et prend leur ressource pour afficher celle qui doit être en aoerçu */
    $sql = "SELECT u.id, u.firstname, u.lastname, r.*, p.* FROM project p LEFT JOIN resource r on p.id = r.project_id LEFT JOIN user u on p.user_id = u.id WHERE r.preview = 1 AND p.status = 'approved' AND p.primary_tag LIKE '{$filter}' ORDER BY RAND() LIMIT 20;";

} 

$query = $db->prepare($sql);
$res = $query->execute();
$result = $query->fetchAll(PDO::FETCH_ASSOC);

require('close.php');

echo json_encode([
    "projects" => $result,
]);