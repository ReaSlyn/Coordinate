<?php

require_once("env.php");
header('Access-Control-Allow-Origin:' . $url);
header('Application-type: application/json');
$data = json_decode(file_get_contents('php://input'), true);

require('connect.php');

/* Supprime le projet qui correspond à un id de projet*/
$sql = "DELETE FROM `project` WHERE `id`=:id;";
$query = $db->prepare($sql);
$query->bindValue(':id', $data["projectId"], PDO::PARAM_INT);
$res = $query->execute();

require('close.php');

echo json_encode([
    "res" => $res,
]);