<?php 

require('env.php');
header('Access-Control-Allow-Origin:' . $url);
header("Content-Type: multipart/form-data");
$data = file_get_contents('php://input');

$uploaddir = "uploads/";

require('connect.php');

/* Envoie le projet dans la database */
$title = strip_tags($_POST['projectTitle']);
$tag = strip_tags($_POST['primaryTag']);
$description = strip_tags($_POST['projectDescription']);
$id = intval($_POST['loggedId']);
$sql = "INSERT INTO `project` (`title`, `primary_tag`, `description`, `user_id`) VALUES (:title, :primary_tag, :description, :user_id);";
$query = $db->prepare($sql);
$query->bindValue(':user_id', $id, PDO::PARAM_INT);
$query->bindValue(':title', $title, PDO::PARAM_STR);
$query->bindValue(':primary_tag', $tag, PDO::PARAM_STR);
$query->bindValue(':description', $description, PDO::PARAM_INT);
$res = $query->execute();

/* Upload les images, les lie au projet et stock l'url */
for ($i = 0; $i < count($_FILES['file']['name']); $i++) {
    $fileName = $_FILES['file']['name'][$i];
    $uploadFile = $uploaddir . basename($fileName);
    if (move_uploaded_file($_FILES['file']['tmp_name'][$i], $uploadFile)) {
        
    }
}

require_once('close.php');

echo json_encode([
    "files" => $_FILES,
    "post" => $_POST,
    "res" => $res,
    "error" => $e,
]);