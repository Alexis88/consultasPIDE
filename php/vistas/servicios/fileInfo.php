<?php
include_once '../../clases/files.php';

$data = Files::ext($_FILES['file']['tmp_name']);

echo !$data ? json_encode([
	'estado' => 'error'
]) : json_encode([
	'estado' => 'ok',
	'name' => $_FILES['file']['name'],
	'type' => $data['type'],
	'size' => $_FILES['file']['size'],
	'ext' => $data['ext']
]);
?>