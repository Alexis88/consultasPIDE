<?php
include_once '../../clases/session.php';
Session::checkAdminAjax();
include_once '../../clases/classhub.php';
include_once '../../clases/data.php';
include_once '../../clases/files.php';

$_POST = Consultas::limpiar($_POST);
extract($_POST);

if ($tipo < 3){
	//VALIDACIÓN DE DATOS
	if (ClassHub::duplicatedService($ser_nombre, $ser_etiqueta, isset($id) ? $id : false)){
		echo json_encode([
			'estado' => 'error',
			'mensaje' => 'Este servicio ya se encuentra registrado y no puede ser duplicado'
		]);
		exit;
	}

	if (!ClassHub::validate($ser_nombre, 'string', 3, 50)){
		echo json_encode([
			'estado' => 'error',
			'mensaje' => 'El formato del nombre clave del servicio no es válido'
		]);
		exit;
	}

	if (!ClassHub::validate($ser_etiqueta, 'string', 3, 50)){
		echo json_encode([
			'estado' => 'error',
			'mensaje' => 'El formato del nombre público del servicio no es válido'
		]);
		exit;
	}

	if (!ClassHub::validate($ser_descripcion, 'string', 10, 150)){
		echo json_encode([
			'estado' => 'error',
			'mensaje' => 'Tiene que ingresar una descripción del servicio no menor a 10 caracteres ni mayor a 150'
		]);
		exit;
	}

	if (($ser_login < 2 && $ser_update < 2) && (!ClassHub::validate($ser_updatetime, 'number', 1, 3) || $ser_updatetime < 1)){
		echo json_encode([
			'estado' => 'error',
			'mensaje' => 'Tiene que ingresar un valor numérico válido, mayor a cero, de entre 1 y 3 dígitos de extensión, para especificar el tiempo, dado en días, entre las actualizaciones de credenciales del servicio'
		]);
		exit;
	}

	if ($ser_login < 2 && $ser_generalLogin < 2 && (!ClassHub::validate($gen_user, 'string', 3, 50) || !ClassHub::validate($gen_pass, 'all', 3, 50))){
		echo json_encode([
			'estado' => 'error',
			'mensaje' => 'Tiene que ingresar un nombre de usuario y contraseña, cada uno de entre 3 y 50 caracteres de extensión'
		]);
		exit;
	}
}

switch ($tipo){
	case 1: //INSERTAR
		$ser_nombre = mb_strtoupper($ser_nombre);

		if (isset($_FILES['ser_logo'])){
			$logo = Files::upload($_FILES['ser_logo'], '../../../img/servicios/');
			$ser_logo = $logo['name'];
		}
		else{
			$ser_logo = 'default.png';
		}

		$fields = '(ser_nombre, ser_etiqueta, ser_logo, ser_descripcion, ser_login, ser_generalLogin, ser_update, ';
		$fields .= $ser_update < 2 ? 'ser_updatetime,' : '';
		$fields .= ' ser_estado)';
		$values = "('$ser_nombre', '$ser_etiqueta', '$ser_logo', '$ser_descripcion', $ser_login, $ser_generalLogin, $ser_update, ";
		$values .= $ser_update < 2 ? "'$ser_updatetime', " : '';
		$values .= '1)';
		$table = 'tbl_servicios';

		$query = Consultas::insert([
			'fields' => $fields,
			'values' => $values,
			'table' => $table
		]);

		//Datos para el control de acciones
		$servicio = ucfirst($ser_nombre);
		$idServicio = Consultas::ultimo_id();

		$accion = "El usuario <b>$myName</b>, identificado con n° de DNI <b>$myDNI</b>, ha registrado el servicio <b>$servicio</b>. Puede ver los datos del servicio <a href=\'../servicios/index.php#$idServicio\' target=\'_blank\'>aquí</a>.";
		break;

	case 2: //EDITAR
		$ser_nombre = mb_strtoupper($ser_nombre);

		if (isset($_FILES['ser_logo'])){
			$logo = Files::upload($_FILES['ser_logo'], '../../../img/servicios/');
			$ser_logo = "'" . $logo['name'] . "'";
			ClassHub::deleteLogoFile($id);
		}
		else{
			$ser_logo = 'ser_logo';
		}

		$pairs = "ser_nombre = '$ser_nombre',
				  ser_etiqueta = '$ser_etiqueta',
				  ser_logo = $ser_logo,
				  ser_descripcion = '$ser_descripcion',
				  ser_login = $ser_login,
				  ser_generalLogin = $ser_generalLogin,
				  ser_update = $ser_update, ";
		$pairs .= $ser_update < 2 ? "ser_updatetime = '$ser_updatetime', " : '';
		$pairs .= "ser_estado = $ser_estado";
		$conditions = "WHERE ser_id = $id";
		$table = 'tbl_servicios';

		$query = Consultas::update([
			'pairs' => $pairs,
			'table' => $table,
			'conditions' => $conditions
		]);

		//Datos para el control de acciones
		$servicio = ucfirst($ser_nombre);
		$idServicio = $id;

		$accion = "El usuario <b>$myName</b>, identificado con n° de DNI <b>$myDNI</b>, ha actualizado los datos del servicio <b>$servicio</b>. Puede ver los datos del servicio <a href=\'../servicios/index.php#$idServicio\' target=\'_blank\'>aquí</a>.";
		break;

	case 3: //DESHABILITAR
		$pairs = "ser_estado = 2";
		$table = 'tbl_servicios';
		$conditions = "WHERE ser_id = $id";

		$query = Consultas::update([
			'pairs' => $pairs,
			'table' => $table,
			'conditions' => $conditions
		]);

		//Datos para el control de acciones
		$data = ClassHub::servicio($id);
		$servicio = ucfirst($data['ser_nombre']);
		$idServicio = $id;

		$accion = "El usuario <b>$myName</b>, identificado con n° de DNI <b>$myDNI</b>, ha deshabilitado el servicio <b>$servicio</b>. Puede ver los datos del servicio <a href=\'../servicios/index.php#$idServicio\' target=\'_blank\'>aquí</a>.";
		break;

	case 4: //ELIMINAR
		$data = ClassHub::servicio($id);
		$servicio = ucfirst($data['ser_nombre']);

		$query = Consultas::delete([
			'table' => 'tbl_servicios',
			'conditions' => "WHERE ser_id = $id"
		]);

		$accion = "El usuario <b>$myName</b>, identificado con n° de DNI <b>$myDNI</b>, ha eliminado el servicio <b>$servicio</b>.";
		break;

	case 5: //ELIMINAR LOGO
		ClassHub::deleteLogoFile($id);

		$pairs = "ser_logo = 'default.png'";
		$table = 'tbl_servicios';
		$conditions = "WHERE ser_id = $id";

		$query = Consultas::update([
			'pairs' => $pairs,
			'table' => $table,
			'conditions' => $conditions
		]);

		//Datos para el control de acciones
		$data = ClassHub::servicio($id);
		$servicio = ucfirst($data['ser_nombre']);
		$idServicio = $id;

		$accion = "El usuario <b>$myName</b>, identificado con n° de DNI <b>$myDNI</b>, ha eliminado el logo del servicio <b>$servicio</b>. Puede ver los datos del servicio <a href=\'../servicios/index.php#$idServicio\' target=\'_blank\'>aquí</a>.";
		break;
}

if ($query){
	$mensaje = 'Operación exitosa';

	switch ($tipo){
		case 1:
			//ID del servicio
			$idServicio = Consultas::ultimo_id();

			//Tiempo de actualización de credenciales
			if ($ser_update < 2){				
				$query = Consultas::insert([
					'fields' => '(upd_time, fk_ser_upd)',
					'table' => 'tbl_updates',
					'values' => "(CURDATE(), $idServicio)"
				]);

				if (!$query){
					$mensaje = 'Se registró el servicio, pero no se pudo establecer la primera fecha de actualización de credenciales';
				}
			}

			//Datos de acceso general
			if ($ser_login < 2 && $ser_generalLogin < 2){
				$query = Consultas::insert([
					'fields' => '(gen_user, gen_pass, fk_ser_gen)',
					'table' => 'tbl_generalLogin',
					'values' => "('$gen_user', '$gen_pass', $idServicio)"
				]);

				if (!$query){
					$mensaje = 'Se registró el servicio, pero no se pudo registrar los datos de acceso general';
				}
			}
			break;

		case 2:
			//Datos de acceso general
			if ($ser_login < 2 && $ser_generalLogin < 2){
				//Si previamente se registraron las credenciales generales
				if (ClassHub::getGeneralCredentials($idServicio)){
					//Se actualizan
					$query = Consultas::update([
						'pairs' => "gen_user = '$gen_user', gen_pass = '$gen_pass'",
						'table' => 'tbl_generalLogin',
						'conditions' => "WHERE fk_ser_gen = $idServicio"
					]);

					if (!$query){
						$mensaje = 'Se actualizaron los datos del servicio, pero no se pudo actualizar los datos de acceso general';
					}
				}
				//Caso contrario
				else{
					//Se registran
					$query = Consultas::insert([
						'fields' => '(gen_user, gen_pass, fk_ser_gen)',
						'table' => 'tbl_generalLogin',
						'values' => "('$gen_user', '$gen_pass', $idServicio)"
					]);

					if (!$query){
						$mensaje = 'Se actualizaron los datos del servicio, pero no se pudo registrar los datos de acceso general';
					}
				}				
			}
			break;
	}

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