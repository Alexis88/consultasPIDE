<?php
include_once 'classhub.php';
$_GET = Consultas::limpiar($_GET);
extract($_GET);
echo json_encode(['estado' => file_exists("../vistas/$path/form.php") ? 'ok' : 'error']);
?>