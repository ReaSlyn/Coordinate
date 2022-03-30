<?php

require_once("env.php");
header('Access-Control-Allow-Origin:' . $url);
header('Application-type: application/json');


echo json_encode([
    'message' => 'Bonjour monde de merde !'
]);

