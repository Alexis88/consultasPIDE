<?php
include_once '../../clases/session.php';
Session::checkAdminAjax();
include_once '../../clases/classhub.php';

$base = 0;
$fields = "niv_id AS id, niv_nombre AS nombre, IF (niv_estado < 2, 'Habilitado', 'Inhabilitado') AS estado";
$table = 'tbl_niveles';
$conditions = '';		   

//Si se realizó alguna búsqueda
if ($_GET){
	$_GET = Consultas::limpiar($_GET);
	extract($_GET);

	//Por nombre
	$conditions .= strlen($nombre) ? " WHERE niv_nombre LIKE '%$nombre%'" : '';

	//Por estado
	$conditions .= $estado ? (strlen($nombre) ? ' AND ' : ' WHERE ') . "niv_estado = $estado" : '';	
}

$conditions .= " ORDER BY niv_nombre ASC, niv_estado ASC LIMIT $base, 50";
$results = ClassHub::buscar([
	'fields' => $fields,
	'table' => $table,
	'conditions' => $conditions
]);

if ($results->num_rows){
	while ($rows = $results->fetch_assoc()){
?>
		<tr>
			<td><?=$rows['nombre']?></td>
			<td><?=$rows['estado']?></td>
			<td>
				<img src="../../../img/editar.ico" alt="Editar nivel" title="Editar nivel" data-edit="form.php?id=<?=$rows['id']?>" />		
<?php
			if ($rows['estado'] == 'Habilitado'){
?>
				<img src="../../../img/eliminar.ico" alt="Inhabilitar nivel" title="Inhabilitar nivel" data-del="<?=$rows['id']?>" />
<?php
			}
			else{
?>				
				<img src="../../../img/borrar.ico" alt="Eliminar nivel" title="Eliminar nivel" data-bor="<?=$rows['id']?>" />
<?php				
			}
?>				
			</td>
		</tr>
<?php
	}
	$results->free();
}
?>