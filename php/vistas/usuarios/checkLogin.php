<?php
include_once '../../clases/session.php';
Session::checkAdminAjax();
include_once '../../clases/classhub.php';

$_GET = Consultas::limpiar($_GET);
extract($_GET);

$login = ClassHub::loginRequired($id);
$credentials = ClassHub::getGeneralCredentials($id);
echo json_encode([
	'estado' => !is_null($login) ? 'ok' : 'error',
	'login' => $login ? 'yes' : 'no',
	'credentials' => $credentials
]);
?>