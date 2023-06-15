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
<?php
}
?>	
	<link rel="stylesheet" type="text/css" href="css/mantenimiento.css?timestamp=<?=$timestamp?>" />
	<link rel="icon" type="image/ico" href="img/logo.ico" />
</head>
<body>
	<section>
		<h1>🔧 En mantenimiento 🔧</h1>
		<p>
			El sistema de consulta de datos de la Plataforma de Interoperabilidad del Estado se encuentra en estos momentos en mantenimiento. Estamos trabajando para poder brindarle un mejor espacio digital para realizar sus consultas. Por favor, le pedimos un poco de paciencia.
		</p>
		<p>Gracias por su comprensión.</p>
	</section>
</body>
</html>