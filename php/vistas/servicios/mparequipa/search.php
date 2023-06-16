<?php
include_once '../../../clases/session.php';
Session::checkUserAjax();
include_once '../../../clases/classhub.php';

$_GET = Consultas::limpiar($_GET);
extract($_GET);

ClassHub::stopServiceLoad('mparequipa');
$data = ClassHub::userServiceData(ClassHub::myID(), $id);
?>
<!DOCTYPE html>
<html lang="es">
<head></head>
<body>
	<header id="cabecera">
		<h2>MUNICIPALIDAD PROVINCIAL DE AREQUIPA - BUSCAR PREDIOS</h2>			
	</header>
	<form id="data" method="post">
		<section>
			<input type="search" name="dni" placeholder=" " data-rest autocomplete="off" required minlength="8" maxlength="8" class="number pide" />
			<label>N° de DNI</label>
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