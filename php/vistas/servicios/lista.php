<?php
include_once '../../clases/session.php';
Session::checkUserAjax();
include_once '../../clases/classhub.php';

$fields = "ser_id AS id,
		   ser_nombre AS nombre,
		   ser_etiqueta AS etiqueta,
		   IF (ser_logo !='', CONCAT('../../../img/servicios/', ser_logo), '../../../img/servicios/default.png') AS logo,
		   CONCAT('🔎 ', ser_descripcion) AS descripcion,
		   IF (ser_update < 2 AND ser_updateTime != '', CONCAT('⏰ Las credenciales se actualizan cada ', ser_updateTime, ' días'), '🔑 Las credenciales no requieren actualizarse') AS updateCredentials,
		   IF (ser_login < 2, '🔒 Requiere identificación', '🔓 No requiere identificación') AS identificacion,
		   IF (ser_estado < 2, '✔ Servicio habilitado', '❎ Servicio inhabilitado') AS estado,
		   ser_estado AS internalState";
$table = 'tbl_servicios';
$conditions = '';	
$base = 0;	   
$habilitados = [];
$inhabilitados = [];
$servicios = [];

//Si se realizó alguna búsqueda
if ($_GET){
	$_GET = Consultas::limpiar($_GET);
	extract($_GET);

	//Validación de datos
	if (strlen($nombre) && !ClassHub::validate($nombre, 'string', 1, 150)) exit;

	//Por nombre, etiqueta o descripción
	$conditions .= strlen($nombre) ? " WHERE (ser_nombre LIKE '%$nombre%' OR ser_etiqueta LIKE '%$nombre%' OR ser_descripcion LIKE '%$nombre%')" : '';

	//Por identificación
	$conditions .= $identificacion ? (strlen($nombre) ? ' AND ' : ' WHERE ') . "ser_login = $identificacion" : '';

	//Por estado
	$conditions .= $estado ? ($identificacion || strlen($nombre) ? ' AND ' : ' WHERE ') . "ser_estado = $estado" : '';	
}

$conditions .= " ORDER BY ser_etiqueta ASC, ser_estado ASC, ser_login ASC LIMIT $base, 50";
$results = ClassHub::buscar([
	'fields' => $fields,
	'table' => $table,
	'conditions' => $conditions
]);

if ($results->num_rows){
	while ($rows = $results->fetch_assoc()){
		//Nombre del servicio en minúsculas
		$service = mb_strtolower($rows['nombre']);

		//Ruta del servicio
		$dataService = file_exists($service . '/search.php') && ClassHub::availableService($service) ? "$service/search.php?id={$rows['id']}" : '';

		//Mensajes de disponibilidad del servicio
		if (!strlen($dataService)){
			$canIuse = '🚫 No puedes usar este servicio';
			$title = 'No puedes usar este servicio';
		}
		else{
			$canIuse = '👍 Puedes usar este servicio';	
			$title = 'Usar este servicio';
		}

		//Si se ha elegido alguna opción de visualización de servicios disponibles
		if (strlen($disponibilidad)){
			//Disponibilidad: Sí
			if ($disponibilidad < 2){
				if (!strlen($dataService)) continue;
			}
			//Disponibilidad: No
			else{
				if (strlen($dataService)) continue;
			}
		}

		//Datos del servicio
		$servicio = [
			'id' => $rows['id'],
			'class' => 'servicio' . (!strlen($dataService) ? ' inhabilitado' : ''),
			'logo' => $rows['logo'],
			'dataService' => $dataService,
			'title' => $title,
			'etiqueta' => $rows['etiqueta'],
			'descripcion' => nl2br($rows['descripcion']),
			'identificacion' => $rows['identificacion'],
			'updateCredentials' => $rows['updateCredentials'],				
			'internalState' => $rows['internalState'],
			'estado' => $rows['estado'],
			'canIuse' => $canIuse
		];

		//Distribución de los servicios entre habilitados e inhabilitados
		if (strlen($dataService)){
			$habilitados[] = $servicio;
		}
		else{
			$inhabilitados[] = $servicio;
		}
	}

	$results->free();
	$servicios = array_merge($habilitados, $inhabilitados);

	foreach ($servicios as $servicio){
?>
		<div class="<?=$servicio['class']?>" data-service="<?=$servicio['dataService']?>" title="<?=$servicio['title']?>">
			<img src="<?=$servicio['logo']?>" class="logo" title="<?=$servicio['title']?>" alt="<?=$servicio['etiqueta']?>" />
			<h3 title="<?=$servicio['title']?>"><?=$servicio['etiqueta']?></h3>	
			<h5 title="<?=$servicio['title']?>"><?=$servicio['descripcion']?></h5>
			
<?php
		if (ClassHub::isAdmin()){
?>
			<h4 title="<?=$servicio['title']?>"><?=$servicio['identificacion']?></h4>
			<h5 title="<?=$servicio['title']?>"><?=$servicio['updateCredentials']?></h5>
<?php
		}
?>			
			<h4 title="<?=$servicio['title']?>"><?=$servicio['estado']?></h4>			
			<h4 title="<?=$servicio['title']?>"><?=$servicio['canIuse']?></h4>			
<?php
		if (ClassHub::isAdmin()){
?>			
			<p title="<?=$servicio['title']?>">
				<img src="../../../img/editar.ico" alt="Editar servicio" title="Editar servicio" data-edit="form.php?id=<?=$servicio['id']?>" class="serviceButton" />
<?php
				if ($servicio['internalState'] < 2){
?>
					<img src="../../../img/eliminar.ico" alt="Inhabilitar servicio" title="Inhabilitar servicio" data-del="<?=$servicio['id']?>" class="serviceButton" />
<?php
				}
				else{
?>				
					<img src="../../../img/borrar.ico" alt="Eliminar servicio" title="Eliminar servicio" data-bor="<?=$servicio['id']?>" class="serviceButton" />
<?php				
				}
?>
			</p>
<?php
		}
?>			
		</div>
<?php
	}	
}
?>