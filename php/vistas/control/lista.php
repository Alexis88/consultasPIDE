<?php
include_once '../../clases/session.php';
Session::checkAdminAjax();
include_once '../../clases/classhub.php';

$base = 0;
$fields = "b.usu_id AS id,
		   DATE_FORMAT(a.con_datetime, '%d/%m/%Y a las %H:%i:%s') AS fecha, 
		   CONCAT(b.usu_nombres, ' ', b.usu_apellidopat, ' ', b.usu_apellidomat) AS usuario,
		   b.usu_area AS area,
		   a.con_accion AS accion";
$table = 'tbl_control a INNER JOIN tbl_usuarios b ON a.fk_usu_con = b.usu_id';
$conditions = '';

//Si se realizó alguna búsqueda
if ($_GET){
	$_GET = Consultas::limpiar($_GET);
	extract($_GET);
	
	//Si se ha elegido alguna fecha
	if (strlen($desde) || strlen($hasta)){
		if (strlen($desde) && strlen($hasta)){
			$conditions .= "WHERE (a.con_datetime BETWEEN '$desde 00:00:00' AND '$hasta 23:59:59')";
		}
		else if (strlen($desde) && !strlen($hasta)){
			$conditions .= "WHERE (a.con_datetime BETWEEN '$desde 00:00:00' AND '$desde 23:59:59')";
		}
		else if (!strlen($desde) && strlen($hasta)){
			$conditions .= "WHERE (a.con_datetime BETWEEN '$hasta 00:00:00' AND '$hasta 23:59:59')";
		}
	}

	//Por datos del usuario
	$conditions .= strlen($usuario) ? (strlen($desde) || strlen($hasta) ? ' AND ' : 'WHERE ') . "(b.usu_nombres LIKE '%$usuario%' OR b.usu_apellidopat LIKE '%$usuario%' OR b.usu_apellidomat LIKE '%$usuario%' OR CONCAT(b.usu_nombres, ' ', b.usu_apellidopat, ' ', b.usu_apellidomat) LIKE '%$usuario%' OR CONCAT(b.usu_apellidopat, ' ', b.usu_apellidomat, ' ', b.usu_nombres) LIKE '%$usuario%' OR b.usu_dni LIKE '%$usuario%')" : '';

	//Por área
	$conditions .= strlen($area) ? (strlen($usuario) || strlen($desde) || strlen($hasta) ? ' AND ' : 'WHERE ') . "b.usu_area LIKE '%$area%'" : '';
}

$conditions .= " ORDER BY a.con_datetime DESC LIMIT $base, 50";

$results = ClassHub::buscar([
	'fields' => $fields,
	'table' => $table,
	'conditions' => $conditions
]);

if ($results->num_rows){
	while ($rows = $results->fetch_assoc()){
		//Si no es la cuenta del administrador general, no puede ver sus actividades
		if (ClassHub::myID() > 1 && $rows['id'] < 2){
			continue;
		}
?>
		<tr>
			<td><?=$rows['fecha']?></td>
			<td><?=$rows['usuario']?></td>
			<td><?=$rows['area']?></td>
			<td><?=$rows['accion']?></td>
		</tr>
<?php
	}
	$results->free();
}
?>