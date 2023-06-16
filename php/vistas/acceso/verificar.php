<?php
session_start();
include_once '../../clases/classhub.php';

$_POST = Consultas::limpiar($_POST);
extract($_POST);

$result = Consultas::select([
	'fields' => "usu_id AS id, CONCAT(usu_nombres, ' ', usu_apellidopat, ' ', usu_apellidomat) AS nombre, usu_dni AS dni, fk_niv_usu AS nivel, usu_password AS password, usu_estado AS estado",
	'table' => 'tbl_usuarios',
	'conditions' => "WHERE usu_username = '$user'"
]);

if ($result->num_rows){
	$data = $result->fetch_assoc();	

	//Cuenta deshabilitada
	if ($data['estado'] == 2){
		echo json_encode([
			'estado' => 'error',
			'mensaje' => 'Su cuenta se encuentra deshabilitada'
		]);
		exit;
	}

	//Contraseña incorrecta
	if (!password_verify(mb_strtoupper($pass), $data['password'])){
		echo json_encode([
			'estado' => 'error',
			'mensaje' => 'La contraseña ingresada no es correcta'
		]);
		exit;
	}

	//Datos del endpoint
	$userData = ClassHub::getUserData();

	$_SESSION['datos'] = [
		'identificado' => true,
		'id' => $data['id'],
		'nombre' => $data['nombre'],
		'dni' => $data['dni'],
		'nivel' => $data['nivel'],
		'ip' => $userData['ip'],
		'mac' => $userData['mac'],
		'windowsuser' => $userData['user'],
		'host' => $userData['host']
	];
	
	$h = date('H');
	$m = date('i');

	switch ($h){
		case $h < 12:
			$saludo = 'Buenos días, ';
			break;
		case ($h >= 12 && $h <= 18) && $m <= 59:
			$saludo = 'Buenas tardes, ';
			break;
		default:
			$saludo = 'Buenas noches, ';
			break;
	}

	//Se envía la respuesta a la capa de presentación
	echo json_encode([
		'estado' => 'ok',
		'mensaje' => $saludo . $data['nombre'],
		'url' => '../servicios'
	]);

	//Se establece como ilimitado el tiempo de duración de la sesión
	//set_time_limit(0);

	//Datos para el control de acciones
	include_once '../../clases/data.php';
	$accion = "El usuario <b>$myName</b>, identificado con n° de DNI <b>$myDNI</b>, ha ingresado al sistema";

	//Registro de control	
	ClassHub::control("(NOW(), '$accion', '$myIP', $myID)");
}
else{
	echo json_encode([
		'estado' => 'error',
		'mensaje' => 'Ha ocurrido un error'
	]);
}
?>