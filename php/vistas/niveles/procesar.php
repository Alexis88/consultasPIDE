<?php
include_once '../../clases/session.php';
Session::checkAdminAjax();
include_once '../../clases/classhub.php';
include_once '../../clases/data.php';

$_POST = Consultas::limpiar($_POST);
extract($_POST);

if ($tipo < 3){
	//VALIDACIÓN DE DATOS
	if (!ClassHub::validate($niv_nombre, 'string', 3, 20)){
		echo json_encode([
			'estado' => 'error',
			'mensaje' => 'El formato del nombre del nivel no es válido'
		]);
		exit;
	}

	if (ClassHub::duplicatedLevel($niv_nombre, $tipo == 2 ? $id : false)){
		echo json_encode([
			'estado' => 'error',
			'mensaje' => "Ya existe el nivel $niv_nombre. Escriba otro."
		]);
		exit;
	}
}

switch ($tipo){
	case 1: //INSERTAR
		$fields = '(niv_nombre, niv_estado)';
		$values = "('$niv_nombre', 1)";
		$table = 'tbl_niveles';

		$query = Consultas::insert([
			'fields' => $fields,
			'values' => $values,
			'table' => $table
		]);

		//Datos para el control de acciones
		$nivel = "<b>$niv_nombre</b>";
		$idNivel = Consultas::ultimo_id();

		$accion = "El usuario <b>$myName</b>, identificado con n° de DNI <b>$myDNI</b>, ha registrado el nivel $nivel. Puede ver los datos del nivel <a href=\'../niveles/index.php#$idNivel\' target=\'_blank\'>aquí</a>.";
		break;

	case 2: //EDITAR
		$pairs = "niv_nombre = '$niv_nombre',
				  niv_estado = $niv_estado";
		$conditions = "WHERE niv_id = $id";
		$table = 'tbl_niveles';

		$query = Consultas::update([
			'pairs' => $pairs,
			'table' => $table,
			'conditions' => $conditions
		]);

		//Datos para el control de acciones
		$nivel = "<b>$niv_nombre</b>";
		$idNivel = $id;

		$accion = "El usuario <b>$myName</b>, identificado con n° de DNI <b>$myDNI</b>, ha actualizado los datos del nivel $nivel. Puede ver los datos del nivel <a href=\'../niveles/index.php#$idNivel\' target=\'_blank\'>aquí</a>.";
		break;

	case 3: //DESHABILITAR
		$pairs = "niv_estado = 2";
		$table = 'tbl_niveles';
		$conditions = "WHERE niv_id = $id";

		$query = Consultas::update([
			'pairs' => $pairs,
			'table' => $table,
			'conditions' => $conditions
		]);

		//Datos para el control de acciones
		$data = ClassHub::nivelData($id);
		$nivel = "<b>{$data['niv_nombre']}</b>";
		$idNivel = $id;

		$accion = "El usuario <b>$myName</b>, identificado con n° de DNI <b>$myDNI</b>, ha deshabilitado el nivel $nivel. Puede ver los datos del nivel <a href=\'../niveles/index.php#$idNivel\' target=\'_blank\'>aquí</a>.";
		break;

	case 4: //ELIMINAR
		$data = ClassHub::nivelData($id);
		$nivel = $data['niv_nombre'];

		$query = Consultas::delete([
			'table' => 'tbl_niveles',
			'conditions' => "WHERE niv_id = $id"
		]);

		$accion = "El usuario <b>$myName</b>, identificado con n° de DNI <b>$myDNI</b>, ha eliminado el nivel <b>$nivel</b>.";
		break;
}

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