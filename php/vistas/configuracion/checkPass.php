<?php
include_once '../../clases/session.php';
Session::checkAdminAjax();
include_once '../../clases/classhub.php';

$_GET = Consultas::limpiar($_GET);
extract($_GET);

echo json_encode(['estado' => ClassHub::checkPassDelete($pass) ? 'ok' : 'error']);
?>