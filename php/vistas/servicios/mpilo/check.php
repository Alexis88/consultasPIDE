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
switch ($tipodoc){
	case 'D':
		$min = 8;
		$max = 8;
		$filter = 'string';
		$tipobus = 'Por n° de DNI';
		$label = 'N° de DNI';
		$mensaje = "⚠️ El número de DNI debe ser un valor numérico válido de $max dígitos";
		break;

	case 'R':
		$min = 11;
		$max = 11;
		$filter = 'string';
		$tipobus = 'Por n° de RUC';
		$label = 'N° de RUC';
		$mensaje = "⚠️ El número de RUC debe ser un valor numérico válido de $max dígitos";
		break;

	case 'N':
		$min = 2;
		$max = 80;
		$filter = 'string';
		$tipobus = 'Por nombre completo';
		$label = 'Nombres y apellidos';
		$mensaje = "⚠️ El nombre completo debe estar formado por un texto válido de entre $min y $max caracteres";
		break;
}

if (!ClassHub::validate($nomdoc, $filter, $min, $max)){
	echo json_encode([
		'estado' => 'error',
		'mensaje' => $mensaje
	]);
	exit;
}

//Enviar consulta al servicio
$results = ClassHub::consumir([
	'url' => 'https://ws5.pide.gob.pe/Rest/Pide/MPIlo/DS121Predio',
	'method' => 'GET',
	'data' => [
		'tipoDoc' => $tipodoc,
		'campo' => $nomdoc,
		'usuario' => $user,
		'clave' => $pass,
		'out' => 'json'
	]
]);

if ($results){
	$state = $results['getPrediosResponse']['Error'] === '0' && !is_null($results['getPrediosResponse']['Result']);
}
else{
	$state = false;
}

if ($state){
	//Datos para el control de acciones
	$accion = "El usuario <b>$myName</b>, identificado con el n° de DNI <b>$myDNI</b>, ha realizado una búsqueda en el servicio <b>$serviceName</b> con los siguientes datos: <b>Tipo de búsqueda</b>: $tipobus, <b>$label:</b> $nomdoc";

	//Registro de control
	ClassHub::control("(NOW(), '$accion', '$myIP', $myID)");

	echo json_encode([
		'estado' => 'ok',
		'response' => $results['getPrediosResponse']['Result']
	]);
}
else{
	echo json_encode([
		'estado' => 'error',
		'response' => '✖️ No se encontraron datos relacionados con la búsqueda efectuada'
	]);
}
?>