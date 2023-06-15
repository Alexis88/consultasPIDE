<?php
include_once '../../clases/session.php';
Session::checkUser();
include_once '../../clases/classhub.php';

$base = 0;
$fields = "ser_id AS id,
		   ser_nombre AS nombre,
		   ser_etiqueta AS etiqueta,
		   IF (ser_login < 2, 'Sí', 'No') AS identificacion,
		   IF (ser_estado < 2, 'Habilitado', 'Inhabilitado') AS estado";
$table = 'tbl_servicios';
$conditions = '';		   

//Si se realizó alguna búsqueda
if ($_GET){
	$_GET = Consultas::limpiar($_GET);
	extract($_GET);

	//Por nombre o etiqueta
	$conditions .= strlen($nombre) ? " WHERE (ser_nombre LIKE '%$nombre%' OR ser_etiqueta LIKE '%$nombre%')" : '';

	//Por identificación
	$conditions .= $identificacion ? (strlen($nombre) ? ' AND ' : ' WHERE ') . "ser_login = $identificacion" : '';

	//Por estado
	$conditions .= $estado ? ($identificacion || strlen($nombre) ? ' AND ' : ' WHERE ') . "ser_estado = $estado" : '';	
}

$conditions .= " ORDER BY ser_nombre ASC LIMIT $base, 50";
$results = ClassHub::buscar([
	'fields' => $fields,
	'table' => $table,
	'conditions' => $conditions
]);

if ($results->num_rows){
	while ($rows = $results->fetch_assoc()){
		//Si el servicio está inhabilitado, solo se mostrará a los administradores
		if ((!ClassHub::isAdmin() && $rows['estado'] == 'Inhabilitado') || (!ClassHub::availableService($rows['nombre']) && !ClassHub::isAdmin())) continue;
?>
		<tr>
			<td><?=$rows['etiqueta']?></td>
<?php
		if (ClassHub::isAdmin()){
?>			
			<td><?=$rows['identificacion']?></td>
			<td><?=$rows['estado']?></td>
<?php
		}
?>			
			<td>
<?php
			$service = mb_strtolower($rows['nombre']);
			if (file_exists($service . '/search.php') && ClassHub::availableService($service)){
?>				
				<img src="../../../img/search.ico" alt="Usar servicio" title="Usar servicio" data-service="<?=$service?>/search.php?id=<?=$rows['id']?>" />
<?php
			}

			if (ClassHub::isAdmin()){
?>
				<img src="../../../img/editar.ico" alt="Editar servicio" title="Editar servicio" data-edit="form.php?id=<?=$rows['id']?>" />
<?php
			}

		if (ClassHub::isAdmin()){
			if ($rows['estado'] == 'Habilitado'){
?>
				<img src="../../../img/eliminar.ico" alt="Inhabilitar servicio" title="Inhabilitar servicio" data-del="<?=$rows['id']?>" />
<?php
			}
			else{
?>				
				<img src="../../../img/borrar.ico" alt="Eliminar servicio" title="Eliminar servicio" data-bor="<?=$rows['id']?>" />
<?php				
			}
		}
?>				
			</td>
		</tr>
<?php
	}
	$results->free();
}
?>