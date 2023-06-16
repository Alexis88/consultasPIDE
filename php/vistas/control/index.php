<?php
include_once '../../clases/session.php';
Session::checkAdmin();
include_once '../../clases/classhub.php';

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
		<h1>CONTROL</h1>
	</header>
	<section>		
		<form action="lista.php" id="search">
			<section>
				<input type="date" name="desde" id="desde" />
				<label for="desde">Desde</label>
			</section>
			<section>
				<input type="date" name="hasta" id="hasta" />
				<label for="hasta">Hasta</label>
			</section>
			<section>
				<input type="search" name="usuario" id="usuario" maxlength="93" placeholder=" " autocomplete="off" class="string" />
				<label for="usuario">Usuario</label>
			</section>
			<section>
				<input type="search" name="area" id="area" maxlength="100" placeholder=" " autocomplete="off" class="string" />
				<label for="area">Área</label>
			</section>			
		</form>
		<table id="list">
			<thead>
				<tr>
					<th>Fecha y hora</th>
					<th>Usuario</th>
					<th>Área</th>					
					<th>Acción</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
		<span id="subir">▲</span>
	</section>
	<footer>
<?php		
	ClassHub::footer([
		"<script type='text/javascript' src='../../../js/tables.js?timestamp=$timestamp'></script>",
		"<script type='text/javascript' src='../../../js/scroll.js?timestamp=$timestamp'></script>",
		"<script type='text/javascript' src='../../../js/listado.js?timestamp=$timestamp'></script>"
	]);
?>
	</footer>
</body>
</html>