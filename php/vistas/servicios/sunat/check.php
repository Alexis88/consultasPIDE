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
if (!ClassHub::validate($ruc, 'string', 3, 80)){
	echo json_encode([
		'estado' => 'error',
		'mensaje' => '⚠️ El n° de RUC debe estar compuesto por 11 dígitos. La razón social debe estar compuesta por entre 3 y 80 caracteres.'
	]);
	exit;
}

//Se almacena el RUC/Razón Social original
$originalRUC = $ruc;

if (!ClassHub::isRUC($ruc)){
	$ruc = ClassHub::getRUC($ruc);

	if (!$ruc){
		echo json_encode([
			'estado' => 'error',
			'mensaje' => '✖️ No se encontraron datos relacionados con la búsqueda efectuada'
		]);
		exit;
	}
}

//Resultados
$response = [];

//Si se encontró más de un RUC (se recibe un arreglo con los RUC)
if (is_array($ruc)){
	foreach ($ruc as $r){
		//Datos principales
		$results = ClassHub::consumir([
			'url' => 'https://ws3.pide.gob.pe/Rest/Sunat/DatosPrincipales',
			'method' => 'GET',
			'data' => [
				'numruc' => $r,
				'out' => 'json'
			]
		]);

		if ($results){
			if (isset($results['list']['multiRef']['ddp_numruc']['value'])){
				$datosGenerales = $results['list']['multiRef'];
			}
			else{
				$datosGenerales = '';
			}

			//Domicilio legal
			$results = ClassHub::consumir([
				'url' => 'https://ws3.pide.gob.pe/Rest/Sunat/DomicilioLegal',
				'method' => 'GET',
				'data' => [
					'numruc' => $r,
					'out' => 'json'
				]
			]);
			
			if ($results){
				if (isset($results['list']['getDomicilioLegalResponse']['getDomicilioLegalReturn']['value'])){
					$domicilioLegal = $results['list']['getDomicilioLegalResponse']['getDomicilioLegalReturn']['value'];
				}
				else{
					$domicilioLegal = '';
				}

				$response[] = [
					'datosGenerales' => $datosGenerales,
					'domicilioLegal' => $domicilioLegal
				];
			}
		}
	}
}
//Si solo se encontró un RUC
else{
	//Datos principales
	$results = ClassHub::consumir([
		'url' => 'https://ws3.pide.gob.pe/Rest/Sunat/DatosPrincipales',
		'method' => 'GET',
		'data' => [
			'numruc' => $ruc,
			'out' => 'json'
		]
	]);

	if ($results){
		if (isset($results['list']['multiRef']['ddp_numruc']['value'])){
			$datosGenerales = $results['list']['multiRef'];
		}
		else{
			$datosGenerales = '';
		}

		//Domicilio legal
		$results = ClassHub::consumir([
			'url' => 'https://ws3.pide.gob.pe/Rest/Sunat/DomicilioLegal',
			'method' => 'GET',
			'data' => [
				'numruc' => $ruc,
				'out' => 'json'
			]
		]);

		if ($results){
			if (isset($results['list']['getDomicilioLegalResponse']['getDomicilioLegalReturn']['value'])){
				$domicilioLegal = $results['list']['getDomicilioLegalResponse']['getDomicilioLegalReturn']['value'];
			}
			else{
				$domicilioLegal = '';
			}

			$response[] = [
				'datosGenerales' => $datosGenerales,
				'domicilioLegal' => $domicilioLegal
			];
		}
	}
}

$state = count($response);

if ($state){
	//Datos para el control de acciones
	$accion = "El usuario <b>$myName</b>, identificado con el n° de DNI <b>$myDNI</b>, ha realizado una búsqueda en el servicio <b>$serviceName</b> con los siguientes datos: <b>RUC/Razón Social:</b> $originalRUC.";		

	//Registro de control
	ClassHub::control("(NOW(), '$accion', '$myIP', $myID)");

	echo json_encode([
		'estado' => 'ok',
		'response' => $response
	]);
}
else{
	echo json_encode([
		'estado' => 'error',
		'mensaje' => '✖️ No se encontraron datos relacionados con la búsqueda efectuada'
	]);
}
?>