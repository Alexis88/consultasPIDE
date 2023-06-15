<?php
include_once '../../clases/session.php';
Session::checkAdminAjax();
include_once '../../clases/classhub.php';
include_once '../../clases/data.php';

$_POST = Consultas::limpiar($_POST);
extract($_POST);

$con_deletepass = strlen($con_deletepass) ? "'" . ClassHub::encrypt($con_deletepass) . "'" : 'con_deletepass';
$pairs = "con_deletepass = $con_deletepass";
$table = 'tbl_configuracion';

$query = Consultas::update([
	'pairs' => $pairs,
	'table' => $table
]);

//Datos para el control de acciones
$accion = "El usuario <b>$myName</b>, identificado con n° de DNI <b>$myDNI</b>, ha actualizado los datos del panel de configuración. Puede verlos <a href=\'../configuracion/index.php\' target=\'_blank\'>aquí</a>.";

if ($query){
	echo json_encode([
		'estado' => 'ok',
		'mensaje' => 'Operación exitosa'
	]);

	//Registro de control	
	ClassHub::control("(NOW(), '$accion', '$myIP', $myID)");
}
else{
	echo json_encode([
		'estado' => 'ok',
		'mensaje' => 'Operación errónea'
	]);
}
?>