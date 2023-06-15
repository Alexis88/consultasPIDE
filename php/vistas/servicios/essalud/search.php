<?php
include_once '../../../clases/session.php';
Session::checkUserAjax();
include_once '../../../clases/classhub.php';

$_GET = Consultas::limpiar($_GET);
extract($_GET);

ClassHub::stopServiceLoad('essalud');
$data = ClassHub::userServiceData(ClassHub::myID(), $id);
?>
<!DOCTYPE html>
<html lang="es">
<head></head>
<body>
	<header id="cabecera">
		<h2>ESSALUD - BUSCAR ASEGURADOS</h2>			
	</header>

	<form id="data" method="post">
		<section>
			<input type="search" name="dni" placeholder=" " data-rest autocomplete="off" autofocus required minlength="8" maxlength="8" class="string pide" />
			<label>Ingrese el n° de DNI</label>
		</section>		
		<section>
			<input type="hidden" name="serviceName" data-rest value="<?=$data['servicio']?>" />
			<input type="hidden" name="serviceID" data-rest value="<?=$id?>" />
			<input type="submit" class="search" data-rest="<?=mb_strtolower($data['servicio'])?>" value="Buscar" />
		</section>
	</form>
	<div id="results"></div>
	<span id="subir">▲</span>
</body>
</html>