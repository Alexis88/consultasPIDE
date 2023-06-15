<?php
include_once '../../clases/session.php';
Session::checkAdminAjax();
include_once '../../clases/classhub.php';
include_once '../../clases/data.php';

$_POST = Consultas::limpiar($_POST);
extract($_POST);

if ($tipo < 3){
	//VALIDACIÓN DE DATOS
	if (($tipo < 2 && ClassHub::duplicatedDNI($usu_dni)) || ($tipo == 2 && ClassHub::duplicatedDNI($usu_dni, $id))){
		echo json_encode([
			'estado' => 'error',
			'mensaje' => "El número de DNI <b>$usu_dni</b> ya se encuentra registrado. Ingrese otro."
		]);
		exit;
	}

	if (!ClassHub::validate($usu_apellidopat, 'string', 2, 30)){
		echo json_encode([
			'estado' => 'error',
			'mensaje' => 'El formato del apellido paterno del usuario no es válido'
		]);
		exit;
	}
	
	if (!ClassHub::validate($usu_apellidomat, 'string', 2, 30)){
		echo json_encode([
			'estado' => 'error',
			'mensaje' => 'El formato del apellido materno del usuario no es válido'
		]);
		exit;
	}

	if (!ClassHub::validate($usu_nombres, 'string', 2, 30)){
		echo json_encode([
			'estado' => 'error',
			'mensaje' => 'El formato del nombre del usuario no es válido'
		]);
		exit;
	}

	if (!ClassHub::validate($usu_dni, 'string', 8, 8)){
		echo json_encode([
			'estado' => 'error',
			'mensaje' => 'El formato del DNI del usuario no es válido'
		]);
		exit;
	}

	if (!ClassHub::validate($usu_email, 'email', 7, 100)){
		echo json_encode([
			'estado' => 'error',
			'mensaje' => 'El formato del correo electrónico del usuario no es válido'
		]);
		exit;
	}

	if (!ClassHub::validate($usu_area, 'string', 3, 100)){
		echo json_encode([
			'estado' => 'error',
			'mensaje' => 'El formato del área del usuario no es válido'
		]);
		exit;
	}

	if (!ClassHub::validate($usu_cargo, 'string', 3, 25)){
		echo json_encode([
			'estado' => 'error',
			'mensaje' => 'El formato del cargo del usuario no es válido'
		]);
		exit;
	}

	if (ClassHub::checkService($servicio)){
		echo json_encode([
			'estado' => 'error',
			'mensaje' => 'No puede ingresar más datos para un mismo servicio'
		]);
		exit;
	}

	for ($i = 0, $l = count($user); $i < $l; $i++){
		$loginRequired = ClassHub::loginRequired($servicio[$i]);
		$usernameLength = strlen($user[$i]);
		$passwordLength = strlen($pass[$i]);

		//Si el servicio requiere identificación
		if ($loginRequired){
			$service = ClassHub::serviceName($servicio[$i]);

			//Si el nombre de usuario tiene una longitud superior a 50 caracteres
			if ($usernameLength > 50){
				echo json_encode([
					'estado' => 'error',
					'mensaje' => "El nombre de usuario {$user[$i]} no puede pasar los 50 caracteres."
				]);
				exit;
			}

			//Si se ha ingresado la clave de acceso pero no el nombre de usuario
			if (!$usernameLength && $passwordLength){
				echo json_encode([
					'estado' => 'error',
					'mensaje' => "Tiene que ingresar un nombre de usuario para usar el servicio <b>$service</b>."
				]);
				exit;
			}
			//Si se ha ingresado el nombre de usuario pero nola clave de acceso
			else if ($usernameLength && !$passwordLength){
				echo json_encode([
					'estado' => 'error',
					'mensaje' => "Tiene que ingresar una clave de acceso para usar el servicio <b>$service</b>."
				]);
				exit;
			}
			//Si no se ha ingresar el nombre de usuario ni la clave de acceso
			else if (!$usernameLength && !$passwordLength){
				echo json_encode([
					'estado' => 'error',
					'mensaje' => "Tiene que ingresar un nombre de usuario y clave de acceso para usar el servicio <b>$service</b>."
				]);
				exit;
			}

			//Si se trata de un registro o edición de datos
			/*if ($tipo < 3){
				$duplicated = ClassHub::duplicatedLoginData($user[$i], $servicio[$i], isset($id) ? $id : false);

				//Si el nombre de usuario ya está registrado
				if ($duplicated){
					$user = mb_strtoupper($user[$i]);				
					echo json_encode([
						'estado' => 'error',
						'mensaje' => "El nombre de usuario $user ya se encuentra en uso para el servicio $service. Por favor, ingrese otro."
					]);
					exit;
				}
			}*/
		}
	}
}

switch ($tipo){
	case 1: //INSERTAR
		//Se generan el nombre de usuario y contraseña
		//Inicialmente, la contraseña será idéntica al nombre de usuario
		$data = ClassHub::generarAcceso($usu_nombres, $usu_apellidopat, $usu_apellidomat);
		$usu_username = $data['user'];
		$usu_password = $data['pass'];

		$fields = '(usu_apellidopat, usu_apellidomat, usu_nombres, usu_dni, usu_username, usu_password, usu_email, usu_area, usu_cargo, fk_niv_usu, usu_estado)';
		$values = "('$usu_apellidopat', '$usu_apellidomat', '$usu_nombres', '$usu_dni', '$usu_username', '$usu_password', '$usu_email', '$usu_area', '$usu_cargo', $fk_niv_usu, 1)";
		$table = 'tbl_usuarios';

		$query = Consultas::insert([
			'fields' => $fields,
			'values' => $values,
			'table' => $table
		]);

		//Datos para el control de acciones
		$usuario = "<b>$usu_nombres $usu_apellidopat $usu_apellidomat</b>";
		$dni = "<b>$usu_dni</b>";
		$idUsuario = Consultas::ultimo_id();

		$accion = "El usuario <b>$myName</b>, identificado con n° de DNI <b>$myDNI</b>, ha registrado al usuario $usuario identificado con n° de DNI $dni. Puede ver los datos del usuario <a href=\'../usuarios/index.php#$idUsuario\' target=\'_blank\'>aquí</a>.";
		break;

	case 2: //EDITAR
		//Si se cambió la contraseña, se la encripta
		if (strlen($usu_password)){
			if (!ClassHub::checkPass($id, $usu_password)){
				$usu_password = "'" . ClassHub::encrypt($usu_password) . "'";
			}
			else{
				$usu_password = 'usu_password';
			}
		}
		else{
			$usu_password = 'usu_password';
		}		

		$pairs = "usu_apellidopat = '$usu_apellidopat',
				  usu_apellidomat = '$usu_apellidomat',
				  usu_nombres = '$usu_nombres',
				  usu_dni = '$usu_dni',
				  usu_password = $usu_password,
				  usu_email = '$usu_email',
				  usu_area = '$usu_area',
				  usu_cargo = '$usu_cargo',
				  fk_niv_usu = $fk_niv_usu,
				  usu_estado = $usu_estado";
		$conditions = "WHERE usu_id = $id";
		$table = 'tbl_usuarios';

		$query = Consultas::update([
			'pairs' => $pairs,
			'table' => $table,
			'conditions' => $conditions
		]);

		//Datos para el control de acciones
		$usuario = "<b>$usu_nombres $usu_apellidopat $usu_apellidomat</b>";
		$dni = "<b>$usu_dni</b>";
		$idUsuario = $id;

		$accion = "El usuario <b>$myName</b>, identificado con n° de DNI <b>$myDNI</b>, ha actualizado los datos del usuario $usuario identificado con n° de DNI $dni. Puede ver los datos del usuario <a href=\'../usuarios/index.php#$idUsuario\' target=\'_blank\'>aquí</a>.";
		break;

	case 3: //DESHABILITAR
		$pairs = "usu_estado = 2";
		$table = 'tbl_usuarios';
		$conditions = "WHERE usu_id = $id";

		$query = Consultas::update([
			'pairs' => $pairs,
			'table' => $table,
			'conditions' => $conditions
		]);

		//Datos para el control de acciones
		$data = ClassHub::usuario($id);
		$usuario = "{$data['usu_nombres']} {$data['usu_apellidopat']} {$data['usu_apellidomat']}";
		$dni = $data['usu_dni'];
		$idUsuario = $id;

		$accion = "El usuario <b>$myName</b>, identificado con n° de DNI <b>$myDNI</b>, ha deshabilitado al usuario <b>$usuario</b> identificado con n° de DNI <b>$dni</b>. Puede ver los datos del usuario <a href=\'../usuarios/index.php#$idUsuario\' target=\'_blank\'>aquí</a>.";
		break;

	case 4: //ELIMINAR
		$data = ClassHub::usuario($id);
		$usuario = "{$data['usu_nombres']} {$data['usu_apellidopat']} {$data['usu_apellidomat']}";
		$dni = $data['usu_dni'];

		$query = Consultas::delete([
			'table' => 'tbl_usuarios',
			'conditions' => "WHERE usu_id = $id"
		]);

		$accion = "El usuario <b>$myName</b>, identificado con n° de DNI <b>$myDNI</b>, ha eliminado los datos del usuario <b>$usuario</b> identificado con n° de DNI <b>$dni</b>.";
		break;

	case 5: //ELIMINAR DATOS DE IDENTIFICACIÓN EN SERVICIOS
		$data = ClassHub::userServiceData($user, $servicio);
		$usuario = $data['usuario'];
		$servicio = $data['servicio'];

		$query = Consultas::delete([
			'table' => 'tbl_rel_usu_ser',
			'conditions' => "WHERE relus_id = $id"
		]);

		$accion = "El usuario <b>$myName</b>, identificado con n° de DNI <b>$myDNI</b>, ha eliminado los datos de identificación del usuario <b>$usuario</b> en el servicio <b>$servicio</b>.";
		break;
}

if ($query){
	$mensaje = 'Operación exitosa';
	$errMsg = [];

	switch ($tipo){
		case 1: //REGISTRAR DATOS DE IDENTIFICACIÓN EN SERVICIOS
			for ($i = 0, $l = count($servicio), $values = []; $i < $l; $i++){
				if ($servicio[$i]){
					$values[] = "('{$user[$i]}', '{$pass[$i]}', $idUsuario, {$servicio[$i]})";
				}
			}

			if (count($values)){
				Consultas::updateFKon();
				$query = Consultas::insert([
					'fields' => '(relus_username, relus_password, fk_usu_relus, fk_ser_relus)',
					'values' => implode(', ', $values),
					'table' => 'tbl_rel_usu_ser'
				]);
				Consultas::updateFKoff();

				if (!$query) $errMsg[] = 'los datos de identificación de los servicios';
			}

			//Mensaje que se mostrará al guardar los datos
			if (count($errMsg)){
				$mensaje = 'Se registraron los datos del usuario, pero no se guardaron ' . implode(', ', $errMsg);
			}
			break;

		case 2: //EDITAR DATOS DE IDENTIFICACIÓN EN SERVICIOS
			//Registro/Edición de datos
			for ($i = 0, $l = count($servicio), $values = [], $pairsServ = [], $pairsUser = [], $pairsPass = []; $i < $l; $i++){
				if (isset($id_rel[$i]) && strlen($id_rel[$i]) && $servicio[$i]){
					$pairsServ[] = "WHEN relus_id = {$id_rel[$i]} THEN {$servicio[$i]}";
					$pairsUser[] = "WHEN relus_id = {$id_rel[$i]} THEN '{$user[$i]}'";
					$pairsPass[] = "WHEN relus_id = {$id_rel[$i]} THEN '{$pass[$i]}'";				
				}
				else{
					if ($servicio[$i]){
						$values[] = "('{$user[$i]}', '{$pass[$i]}', $idUsuario, {$servicio[$i]})";
					}
				}
			}

			//Registro
			if (count($values)){
				Consultas::updateFKon();
				$query = Consultas::insert([
					'fields' => '(relus_username, relus_password, fk_usu_relus, fk_ser_relus)',
					'values' => implode(', ', $values),
					'table' => 'tbl_rel_usu_ser'
				]);
				Consultas::updateFKoff();

				if (!$query) $errMsg[] = ' la inserción de nuevos datos de identificación de los servicios';
			}			

			//Edición
			if (count($pairsServ)){
				Consultas::updateFKon();
				$query = Consultas::update([
					'pairs' => 'relus_username = CASE ' . implode(' ', $pairsUser) . ' ELSE relus_username END,
							    relus_password = CASE ' . implode(' ', $pairsPass) . ' ELSE relus_password END,
							    fk_ser_relus = CASE ' . implode(' ', $pairsServ) . ' ELSE fk_ser_relus END',
					'table' => 'tbl_rel_usu_ser',
					'conditions' => "WHERE fk_usu_relus = $idUsuario"
				]);
				Consultas::updateFKoff();

				if (!$query) $errMsg[] = 'la actualización de datos de identificación de los servicios';
			}

			//Mensaje que se mostrará al guardar los datos
			if (count($errMsg)){
				$mensaje = 'Se editaron los datos del usuario, pero no se guardaron ' . implode(', ', $errMsg);
			}
			break;
	}

	echo json_encode([
		'estado' => 'ok',
		'mensaje' => $tipo < 2 ? "El nombre de usuario y clave es <b>{$usu_username}</b>" : 'Operación exitosa',
		'tiempo' => $tipo < 2 ? 10000 : 5000
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