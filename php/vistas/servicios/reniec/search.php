<?php
include_once '../../../clases/session.php';
Session::checkUserAjax();
include_once '../../../clases/classhub.php';

$_GET = Consultas::limpiar($_GET);
extract($_GET);

ClassHub::stopServiceLoad('reniec');
$data = ClassHub::userServiceData(ClassHub::myID(), $id);
?>
<!DOCTYPE html>
<html lang="es">
<head></head>
<body>
	<header id="cabecera">
		<h2>RENIEC - BUSCAR DATOS Y ESTADO VITAL</h2>			
	</header>

	<form id="data" method="post">
		<section>
			<input type="search" name="dni" placeholder=" " data-rest autocomplete="off" autofocus required minlength="8" maxlength="8" class="string" />
			<label>Ingrese el n° de DNI</label>
		</section>		
		<section>
			<input type="hidden" name="serviceName" data-rest value="<?=$data['servicio']?>" />
			<input type="hidden" name="serviceID" data-rest value="<?=$id?>" />
			<input type="submit" class="search" data-rest="reniec" value="Buscar" />
		</section>
	</form>
	<div id="results"></div>
	<span id="subir">▲</span>
</body>
</html>