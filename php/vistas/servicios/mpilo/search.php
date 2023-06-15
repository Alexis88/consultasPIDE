<?php
include_once '../../../clases/session.php';
Session::checkUserAjax();
include_once '../../../clases/classhub.php';

$_GET = Consultas::limpiar($_GET);
extract($_GET);

ClassHub::stopServiceLoad('mpilo');
$data = ClassHub::userServiceData(ClassHub::myID(), $id);
?>
<!DOCTYPE html>
<html lang="es">
<head></head>
<body>
	<header id="cabecera">
		<h2>MUNICIPALIDAD PROVINCIAL DE ILO - BUSCAR PREDIOS</h2>			
	</header>

	<form id="data" method="post">
		<section>
			<select name="tipodoc" data-rest required>
				<option value="D">DNI</option>
				<option value="R">RUC</option>
				<option value="N">Nombre</option>
			</select>
			<label>Tipo de dato</label>
		</section>
		<section>
			<input type="search" name="nomdoc" placeholder=" " data-rest autocomplete="off" required minlength="2" maxlength="100" class="string pide" />
			<label>Dato a buscar</label>
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