<?php
include_once '../../clases/session.php';
Session::checkAdmin();
include_once '../../clases/classhub.php';

$estados = ClassHub::estados();
$timestamp = ClassHub::getTimestamp();
?>
<!DOCTYPE html>
<html lang="es">
<head>
<?php
	ClassHub::head([
		"<link rel='stylesheet' type='text/css' href='../../../css/main.css?timestamp=$timestamp' />",
		"<link rel='stylesheet' type='text/css' href='../../../css/menu.css?timestamp=$timestamp' />",
		"<link rel='stylesheet' type='text/css' href='../../../css/form.css?timestamp=$timestamp' />",
		"<link rel='stylesheet' type='text/css' href='../../../css/list.css?timestamp=$timestamp' />"
	]);
?>	
</head>
<body>
<?php
	ClassHub::menu();
?>	
	<header id="cabecera">
		<h1>NIVELES</h1>
	</header>
	<section>
		<form action="lista.php" id="search">
			<section>
				<input type="search" name="nombre" id="nombre" placeholder=" " autocomplete="off" />
				<label for="nombre">Nombre</label>
			</section>
			<section>
				<select id="estado" name="estado">
					<option value="">Todos</option>
<?php
				foreach ($estados as $k => $v){
?>
					<option value="<?=$k?>"><?=$v?></option>
<?php					
				}
?>					
				</select>
				<label for="estado">Estado</label>
			</section>
		</form>
		<table id="list">
			<thead>
				<tr>
					<th>Nombre</th>
					<th>Estado</th>
					<th>Opciones</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
		<span id="crear" title="Registrar nivel" data-url="form.php">+</span>
		<span id="subir">▲</span>
	</section>
	<footer>
<?php		
	ClassHub::footer([
		"<script type='text/javascript' src='../../../js/tables.js?timestamp=$timestamp'></script>",
		"<script type='text/javascript' src='../../../js/scroll.js?timestamp=$timestamp'></script>",
		"<script type='text/javascript' src='../../../js/listado.js?timestamp=$timestamp'></script>",
		"<script type='text/javascript' src='../../../js/formulario.js?timestamp=$timestamp'></script>"
	]);
?>
	</footer>
</body>
</html>