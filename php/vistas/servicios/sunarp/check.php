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

//Validación de datos para búsquedas por nombre del contribuyente
if ($busquedaSUNARP < 2 && !ClassHub::validate($apellidopat, 'string', 2, 20)){
	echo json_encode([
		'estado' => 'error',
		'mensaje' => '⚠️ El apellido paterno debe ser un texto válido de entre 2 y 20 caracteres'
	]);
	exit;
}

if ($busquedaSUNARP < 2 && !ClassHub::validate($apellidomat, 'string', 2, 60)){
	echo json_encode([
		'estado' => 'error',
		'mensaje' => '⚠️ El apellido materno debe ser un texto válido de entre 2 y 60 caracteres'
	]);
	exit;
}

if ($busquedaSUNARP < 2 && !ClassHub::validate($nombres, 'string', 2, 40)){
	echo json_encode([
		'estado' => 'error',
		'mensaje' => '⚠️ Los nombres deben formar un texto válido de entre 2 y 40 caracteres'
	]);
	exit;
}

//Validación de datos para búsquedas por razón social
if ($busquedaSUNARP == 2 && !ClassHub::validate($razonsocial, 'string', 3, 150)){
	echo json_encode([
		'estado' => 'error',
		'mensaje' => '⚠️ La razón social debe ser un texto válido de entre 3 y 150 caracteres'
	]);
	exit;
}

//Validación de datos para búsquedas por n° de partida y oficina registral
if ($busquedaSUNARP == 3 && !strlen($oficinaregistral)){
	echo json_encode([
		'estado' => 'error',
		'mensaje' => '⚠️ Tiene que elegir una oficina registral'
	]);
	exit;
}

if ($busquedaSUNARP == 3 && !ClassHub::validate($nropartida, 'string', 4, 130)){
	echo json_encode([
		'estado' => 'error',
		'mensaje' => '⚠️ El n° de la partida debe estar compuesto por entre 4 y 10 dígitos'
	]);
	exit;
}

//Validación de datos para búsquedas por n° de placa
if ($busquedaSUNARP == 4 && !ClassHub::validate($nroplaca, 'string', 4, 10)){
	echo json_encode([
		'estado' => 'error',
		'mensaje' => '⚠️ El n° de la placa debe estar compuesto por entre 4 y 10 caracteres'
	]);
	exit;
}

//Configuración de la ruta y datos a consultar
switch ($busquedaSUNARP){
	case 1: case 2:
		//Se transforman los datos de búsqueda a mayúsculas
		if ($busquedaSUNARP < 2){
			$apellidopat = mb_strtoupper($apellidopat);
			$apellidomat = mb_strtoupper($apellidomat);
			$nombres = mb_strtoupper($nombres);
		}
		else{
			$razonsocial = mb_strtoupper($razonsocial);
		}

		//Búsqueda por nombre del contribuyente o razón social
		$url = 'https://ws5.pide.gob.pe/Rest/APide/Sunarp/WSServiceTitularidadSIRSARP';
		if ($busquedaSUNARP < 2){
			$data = [
				'tipoParticipante' => 'N',
				'apellidoPaterno' => $apellidopat,
				'apellidoMaterno' => $apellidomat,
				'nombres' => $nombres
			];
		}
		else{
			$data = [
				'tipoParticipante' => 'J',
				'razonSocial' => $razonsocial
			];
		}

		$data['usuario'] = $user;
		$data['clave'] = $pass;
		$data['out'] = 'json';

		//Se buscan los datos de titularidad de dominio
		$results = ClassHub::consumir([
			'url' => $url,
			'method' => 'GET',
			'data' => $data
		]);

		//Se evalúa si se obtuvo resultados de la búsqueda por nombre del contribuyente
		if ($results){
			$state = isset($results['buscarTitularidadSIRSARPResponse']['respuestaTitularidad']['respuestaTitularidad']);
		}
		else{
			$state = false;
		}
		break;

	case 3:
		//Búsqueda por n° de partida y oficina registral
		$url = 'https://ws5.pide.gob.pe/Rest/APide/Sunarp/WSServicelistarAsientosSIRSARP';
		$data = [
			'zona' => $zonaregistral,
			'oficina' => $oficinaregistral,
			'partida' => "$nropartida",
			'registro' => "$tipopartida",
			'usuario' => $user,
			'clave' => $pass,
			'out' => 'json'
		];

		//Se buscan las partidas registrales
		$results = ClassHub::partidas($url, $data, [], true);

		//Se evalúa si se obtuvo resultados de la búsqueda por n° de partida y oficina registral
		if ($results){
			$state = count($results);
		}
		else{
			$state = false;
		}
		break;

	case 4:
		//Búsqueda por n° de placa y oficina registral
		$url = 'https://ws5.pide.gob.pe/Rest/APide/Sunarp/WSServiceverDetalleRPVExtra';
		$data = [
			'zona' => $placazonaregistral,
			'oficina' => $placaoficinaregistral,
			'placa' => $nroplaca,
			'usuario' => $user,
			'clave' => $pass,
			'out' => 'json'
		];

		//Se buscan las partidas registrales
		$results = ClassHub::consumir([
			'url' => $url,
			'method' => 'GET',
			'data' => $data
		]);

		//Se evalúa si se obtuvo resultados de la búsqueda por n° de placa y oficina registral
		if ($results){
			$state = count($results);
		}
		else{
			$state = false;
		}
		break;
}

//Si no se obtuvo resultados
if (!$state){
	//Se le avisa al usuario que no se encontraron datos
	echo json_encode([
		'estado' => 'error',
		'mensaje' => '✖️ No se encontraron datos relacionados con la búsqueda efectuada'
	]);
}
//Caso contrario
else{
	switch ($busquedaSUNARP){
		case 1: case 2: //Si la búsqueda es por el nombre del contribuyente o la razón social
			//Se buscan las partidas registrales
			$url = 'https://ws5.pide.gob.pe/Rest/APide/Sunarp/WSServicelistarAsientosSIRSARP';
			$datos = [];

			//Se obtienen los datos de la titularidad de dominio
			$dominios = $results['buscarTitularidadSIRSARPResponse']['respuestaTitularidad']['respuestaTitularidad'];

			//Si se obtuvo más de un resultado (varias propiedades)
			if (isset($dominios[0])){
				//Se recorre el conjunto de resultados
				foreach ($dominios as $dominio){
					//Se obtienen las imágenes de la partida correspondiente al dominio en la iteración actual
					$datos[] = ClassHub::buscarPartidas($dominio, $url, $user, $pass);
				}
			}
			else{
				//Se obtienen las imágenes de la partida correspondiente al dominio
				$datos[] = ClassHub::buscarPartidas($dominios, $url, $user, $pass);
			}

			//Datos para el control de acciones
			if ($busquedaSUNARP < 2){
				$accion = "El usuario <b>$myName</b>, identificado con el n° de DNI <b>$myDNI</b>, ha realizado una búsqueda en el servicio <b>$serviceName</b> con los siguientes datos: <b>Tipo de búsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> $apellidopat, <b>Apellido materno:</b> $apellidomat, <b>Nombres:</b> $nombres";
			}
			else{
				$accion = "El usuario <b>$myName</b>, identificado con el n° de DNI <b>$myDNI</b>, ha realizado una búsqueda en el servicio <b>$serviceName</b> con los siguientes datos: <b>Tipo de búsqueda:</b> Por razón social, <b>Razón social:</b> $razonsocial";
			}

			//Registro de control
			ClassHub::control("(NOW(), '$accion', '$myIP', $myID)");

			//Se adjunta el ID del servicio en la respuesta
			$datos['serviceID'] = $serviceID;

			//Se devuelve los resultados a la vista principal
			echo json_encode([
				'estado' => 'ok',
				'response' => $datos
			]);
			break;

		case 3: //Si la búsqueda es por el n° de partida y oficina registral
			//Se busca el nombre de la oficina
			$office = ClassHub::getOficina($oficinaregistral, 'oficina', $zonaregistral);

			//Se busca el tipo de partida
			$tipoPartida = ClassHub::getTipoPartida($tipopartida);

			//Datos para el control de acciones
			$accion = "El usuario <b>$myName</b>, identificado con el n° de DNI <b>$myDNI</b>, ha realizado una búsqueda en el servicio <b>$serviceName</b> con los siguientes datos: <b>Tipo de búsqueda:</b> Por n° de partida y oficina registral, <b>N° de partida:</b> $nropartida, <b>Tipo de partida:</b> $tipoPartida, <b>Oficina registral:</b> $office";

			//Registro de control
			ClassHub::control("(NOW(), '$accion', '$myIP', $myID)");

			//Se devuelve los resultados a la vista principal
			echo json_encode([
				'estado' => 'ok',
				'response' => $results
			]);
			break;

		case 4: //Si la búsqueda es por n° de placa y oficina registral
			//Se busca el nombre de la oficina
			$office = ClassHub::getOficina($oficinaregistral, 'oficina', $zonaregistral);

			//Datos para el control de acciones
			$accion = "El usuario <b>$myName</b>, identificado con el n° de DNI <b>$myDNI</b>, ha realizado una búsqueda en el servicio <b>$serviceName</b> con los siguientes datos: <b>N° de placa:</b> $nroplaca, <b>Oficina registral:</b> $office";

			//Registro de control
			ClassHub::control("(NOW(), '$accion', '$myIP', $myID)");

			//Se devuelve los resultados a la vista principal
			echo json_encode([
				'estado' => 'ok',
				'response' => $results['verDetalleRPVExtraResponse']['vehiculo']
			]);
			break;
	}
}
?>