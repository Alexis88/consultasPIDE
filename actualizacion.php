<?php
include_once 'php/clases/classhub.php';
$timestamp = ClassHub::getTimestamp();
?>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<title>PIDE - Sistema de Consulta de Datos</title>
<?php
if (ClassHub::checkInternet()){
?>	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Catamaran:wght@400&display=swap">	
	<link rel="stylesheet" type="text/css" href="css/actualizacion.css?timestamp=<?=$timestamp?>" />
<?php
}
?>	
	<link rel="icon" type="image/ico" href="img/logo.ico" />
</head>
<body>
	<section>
		<h1>⚠ ¡Nueva actualización! ⚠</h1>
		<p>
			El sistema de consulta de datos de la Plataforma de Interoperabilidad del Estado ha sido actualizado. Pulse <a href="php/vistas/acceso" title="Ir al sistema">aquí</a> para ser redirigido hacia la vista inicial del sistema.
		</p>
	</section>
</body>
</html>