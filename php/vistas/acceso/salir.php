<?php
session_start();
include_once '../../clases/classhub.php';
include_once '../../clases/data.php';

//Datos para el control de acciones
$accion = "El usuario <b>$myName</b>, identificado con n° de DNI <b>$myDNI</b>, ha salido del sistema";

//Registro de control
$result = ClassHub::control("(NOW(), '$accion', '$myIP', $myID)");

echo json_encode(
	$result ? 
	[
		'estado' => 'ok',
		'mensaje' => 'Salida correcta'
	] : 
	[
		'estado' => 'error',
		'mensaje' => 'Ha ocurrido un problema al intentar cerrar la sesión. Se le redirigirá al formulario de identificación.',
		'url' => '\apppide'
	]
);
?>