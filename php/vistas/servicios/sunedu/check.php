<?php
include_once '../../../clases/session.php';
Session::checkUserAjax();
include_once '../../../clases/classhub.php';
include_once '../../../clases/data.php';

$_POST = Consultas::limpiar($_POST);
extract($_POST);

//Carga de credenciales
$data = ClassHub::userServiceData(ClassHub::myID(), $serviceID);

if (array_key_exists('login', $data) && $data['login'] < 2){
	$user = $data['user'];
	$pass = $data['pass'];
}

//Comprobación de permisos
if (ClassHub::loginRequired($serviceID) && !isset($user) && !isset($pass)){
	echo json_encode([
		'estado' => 'error',
		'mensaje' => '🔐 Necesita contar con datos de acceso para utilizar este servicio'
	]);
	exit;
}

//Validación de datos
if (!ClassHub::validate($dni, 'string', 8, 8)){
	echo json_encode([
		'estado' => 'error',
		'mensaje' => '⚠️ El n° de DNI debe estar compuesto por 8 dígitos'
	]);
	exit;
}

//Enviar consulta al servicio
$results = ClassHub::consumir([
	'url' => 'https://ws3.pide.gob.pe/Rest/Sunedu/Grados',
	'method' => 'GET',
	'data' => [
		'usuario' => $user,
		'clave' => $pass,
		'idEntidad' => 54,
		'fecha' => date('Ymd'),
		'hora' => date('His'),
		'mac_wsServer' => 'B4:99:BA:AF:D1:E5',
		'ip_wsServer' => '190.223.60.211',
		'ip_wsUser' => $myIP,
		'nroDocIdentidad' => $dni,
		'out' => 'json'
	]
]);

if ($results){
	$state = $results['opConsultarRNGTResponse']['respuesta']['cGenerico']['value'] == '00000';
}
else{
	$state = false;
}

if ($state){
	//Datos para el control de acciones
	$accion = "El usuario <b>$myName</b>, identificado con el n° de DNI <b>$myDNI</b>, ha realizado una búsqueda en el servicio <b>$serviceName</b> con los siguientes datos: <b>DNI:</b> $dni";		

	//Registro de control
	ClassHub::control("(NOW(), '$accion', '$myIP', $myID)");

	echo json_encode([
		'estado' => 'ok',
		'response' => $results['opConsultarRNGTResponse']['listaGTPersona']
	]);
}
else{
	echo json_encode([
		'estado' => 'error',
		'mensaje' => '✖️ No se encontraron datos relacionados con la búsqueda efectuada'
	]);
}
?>