<?php 

require('env.php');
header('Access-Control-Allow-Origin:' . $url);
header("Content-Type: multipart/form-data");
$data = file_get_contents('php://input');

require('connect.php');
$res = null;

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
$query->bindValue(':description', $description, PDO::PARAM_STR);
$res = $query->execute();
$projectId = $db->lastInsertId();

/* Upload les images, les lie au projet et stock l'url */
$uploaddir = "uploads/";
for ($i = 0; $i < count($_FILES['file']['name']); $i++) {
    $fileName = $_FILES['file']['name'][$i];
    $uploadFile = $uploaddir . basename($fileName);
    if (move_uploaded_file($_FILES['file']['tmp_name'][$i], $uploadFile)) {
        if ($i === 0) {
            $sql = "INSERT INTO `resource` (`project_id`, `type`, `url`, `preview`) VALUES (:project_id, :type, :url, :preview);";
        } else {
            $sql = "INSERT INTO `resource` (`project_id`, `type`, `url`) VALUES (:project_id, :type, :url);";
        }

        $fileType = explode("/", $_FILES['file']['type'][$i])[0];
        $query = $db->prepare($sql);
        if ($i === 0) {
            $query->bindValue(':preview', 1, PDO::PARAM_INT);
        }
        $query->bindValue(':project_id', $projectId, PDO::PARAM_INT);
        $query->bindValue(':type', $fileType, PDO::PARAM_STR);
        $query->bindValue(':url', "/api/{$uploadFile}", PDO::PARAM_STR);
        $res = $query->execute();
    }
}

require_once('close.php');

echo json_encode([
    "res" => $res,
    "desc" => $description,
]);