<?php

require_once("env.php");
header('Access-Control-Allow-Origin:' . $url);
header('Application-type: application/json');
$data = json_decode(file_get_contents('php://input'), true);

require('connect.php');

/* Met à jour le status d'un projet trouvé avec son id */
$sql = "UPDATE `project` SET `status`=:status WHERE `id`=:id;";
$query = $db->prepare($sql);
$query->bindValue(':status', "approved", PDO::PARAM_STR);
$query->bindValue(':id', $data["projectId"], PDO::PARAM_INT);
$res = $query->execute();

require('close.php');

echo json_encode([
    "res" => $res,
]);