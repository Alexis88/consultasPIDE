<?php
include_once '../../clases/session.php';
Session::checkUser();
include_once '../../clases/classhub.php';

$estados = ClassHub::estados();
$boolean = ClassHub::boolean();
$timestamp = ClassHub::getTimestamp();
?>
<!DOCTYPE html>
<html lang="es">
<head>
<?php
	ClassHub::head([
		ClassHub::checkInternet() ? 
		"<link rel='stylesheet' type='text/css' href='https://fonts.googleapis.com/css2?family=Quicksand:wght@300&family=Ysabeau:wght@300&display=swap'>" :
		"<link rel='stylesheet' type='text/css' href='../../../fonts/quicksand.css?timestamp=$timestamp'>",
		"<link rel='stylesheet' type='text/css' href='../../../css/main.css?timestamp=$timestamp' />",
		"<link rel='stylesheet' type='text/css' href='../../../css/menu.css?timestamp=$timestamp' />",
		"<link rel='stylesheet' type='text/css' href='../../../css/form.css?timestamp=$timestamp' />",
		"<link rel='stylesheet' type='text/css' href='../../../css/list.css?timestamp=$timestamp' />",
		"<link rel='stylesheet' type='text/css' href='../../../css/servicios.css?timestamp=$timestamp' />",
		"<link rel='stylesheet' type='text/css' href='../../../css/fotos.css?timestamp=$timestamp' />"
	]);
?>	
</head>
<body>
<?php
	ClassHub::menu();
?>	
	<header id="cabecera">
		<h1>SERVICIOS</h1>
	</header>
	<section>
		<form action="lista.php" id="search">
			<section>
				<input type="search" name="nombre" id="nombre" placeholder=" " maxlength="150" autocomplete="off" />
				<label for="nombre">Nombre/Descripción</label>
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
<?php
		if (ClassHub::isAdmin()){
?>						
			<section>
				<select id="identificacion" name="identificacion">
					<option value="">Todos</option>
<?php
				foreach ($boolean as $k => $v){
?>
					<option value="<?=$k?>"><?=$v?></option>
<?php					
				}
?>					
				</select>
				<label for="identificacion">Identificación</label>
			</section>	
<?php
		}
		else{
?>
			<input type="hidden" name="identificacion" value="" />
<?php
		}
?>			
			<section>
				<select id="disponibilidad" name="disponibilidad">
					<option value="">Todos</option>
<?php
				foreach ($boolean as $k => $v){
?>
					<option value="<?=$k?>"><?=$v?></option>
<?php					
				}
?>					
				</select>
				<label for="disponibilidad">¿Puedo usar?</label>
			</section>		
		</form>
		<section id="servicios"></section>
<?php
	if (ClassHub::isAdmin()){
?>		
		<span id="crear" title="Registrar servicio" data-url="form.php">+</span>
<?php
	}
?>		
		<span id="subir">▲</span>
	</section>
	<footer>
<?php		
	ClassHub::footer([
		"<script type='text/javascript' src='../../../js/tables.js?timestamp=$timestamp'></script>",
		"<script type='text/javascript' src='../../../js/files.js?timestamp=$timestamp'></script>",
		"<script type='text/javascript' src='../../../js/servicios/process.js?timestamp=$timestamp'></script>"
	]);
?>
	</footer>
</body>
</html>