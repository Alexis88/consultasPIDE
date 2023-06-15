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
		"<link rel='stylesheet' type='text/css' href='../../../css/form.css?timestamp=$timestamp' />"
	]);
?>	
</head>
<body>
<?php
	ClassHub::menu();
?>	
	<header id="cabecera">
		<h1>CONFIGURACIÓN</h1>
	</header>
	<section>
		<form id="data" class="noModalForm" action="procesar.php" method="post">
			<section>
				<input type="text" name="con_deletepass" id="con_deletepass" maxlength="50" autofocus placeholder=" " autocomplete="off" class="all" />
				<label for="con_deletepass">Cambiar la clave para eliminar/inhabilitar</label>
			</section>
			<section>
				<input type="submit" value="Guardar" />
            </section>
		</form>
		<span id="subir">▲</span>
	</section>
	<footer>
<?php		
	ClassHub::footer([
		"<script type='text/javascript' src='../../../js/formulario.js?timestamp=$timestamp'></script>"
	]);
?>
	</footer>
</body>
</html>