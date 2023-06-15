<?php
include_once '../../clases/session.php';
Session::checkAdminAjax();
include_once '../../clases/classhub.php';

$base = 0;
$fields = "a.usu_id AS id, 
		   CONCAT(a.usu_nombres, ' ', a.usu_apellidopat, ' ', a.usu_apellidomat) AS nombre, 
		   UPPER(a.usu_username) AS user,
		   a.usu_area AS area,
		   a.usu_cargo AS cargo,
		   b.niv_nombre AS nivel,
		   IF (a.usu_estado < 2, 'Habilitado', 'Inhabilitado') AS estado";
$table = 'tbl_usuarios a INNER JOIN tbl_niveles b ON a.fk_niv_usu = b.niv_id';
$conditions = '';		   

//Si se realizó alguna búsqueda
if ($_GET){
	$_GET = Consultas::limpiar($_GET);
	extract($_GET);

	//Por nombre
	$conditions .= strlen($nombre) ? " WHERE (a.usu_nombres LIKE '%$nombre%' OR a.usu_apellidopat LIKE '%$nombre%' OR a.usu_apellidomat LIKE '%$nombre%' OR CONCAT(a.usu_nombres, ' ', a.usu_apellidopat, ' ', a.usu_apellidomat) LIKE '%$nombre%' OR CONCAT(a.usu_apellidopat, ' ', a.usu_apellidomat, ' ', a.usu_nombres) LIKE '%$nombre%')" : '';

	//Por área
	$conditions .= strlen($area) ? (strlen($nombre) ? ' AND ' : ' WHERE ') . "a.usu_area LIKE '%$area%'" : '';

	//Por cargo
	$conditions .= strlen($cargo) ? (strlen($area) || strlen($nombre) ? ' AND ' : ' WHERE ') . "a.usu_cargo LIKE '%$cargo%'" : '';

	//Por nivel
	$conditions .= $nivel ? (strlen($cargo) || strlen($area) || strlen($nombre) ? ' AND ' : ' WHERE ') . "b.niv_id = $nivel" : '';

	//Por estado
	$conditions .= $estado ? ($nivel || strlen($cargo) || strlen($area) || strlen($nombre) ? ' AND ' : ' WHERE ') . "a.usu_estado = $estado" : '';	
}

$conditions .= " ORDER BY b.niv_nombre ASC, a.usu_nombres ASC, a.usu_apellidopat ASC, a.usu_apellidomat ASC LIMIT $base, 50";
$results = ClassHub::buscar([
	'fields' => $fields,
	'table' => $table,
	'conditions' => $conditions
]);

if ($results->num_rows){
	while ($rows = $results->fetch_assoc()){
		if (ClassHub::myID() > 1 && $rows['id'] < 2) continue;
?>
		<tr>
			<td><?=$rows['nombre']?></td>
			<td><?=$rows['user']?></td>
			<td><?=$rows['area']?></td>
			<td><?=$rows['cargo']?></td>
			<td><?=$rows['nivel']?></td>
			<td><?=$rows['estado']?></td>
			<td>
				<img src="../../../img/editar.ico" alt="Editar usuario" title="Editar usuario" data-edit="form.php?id=<?=$rows['id']?>" />
<?php
		if ($rows['id'] != ClassHub::myID()){
			if ($rows['estado'] == 'Habilitado'){
?>				
				<img src="../../../img/eliminar.ico" alt="Inhabilitar usuario" title="Inhabilitar usuario" data-del="<?=$rows['id']?>" />
<?php
			}
			else{
?>				
				<img src="../../../img/borrar.ico" alt="Eliminar usuario" title="Eliminar usuario" data-bor="<?=$rows['id']?>" />
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