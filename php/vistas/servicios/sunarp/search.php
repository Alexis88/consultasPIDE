<?php
include_once '../../../clases/session.php';
Session::checkUserAjax();
include_once '../../../clases/classhub.php';

$_GET = Consultas::limpiar($_GET);
extract($_GET);

ClassHub::stopServiceLoad('sunarp');
$data = ClassHub::userServiceData(ClassHub::myID(), $id);
$oficinas = ClassHub::oficinas($data);
$tipos = ClassHub::tiposPartida();
?>
<!DOCTYPE html>
<html lang="es">
<head></head>
<body>
	<header id="cabecera">
		<h2>SUNARP - BUSCAR TITULARIDAD DE DOMINIO, PARTIDAS REGISTRALES E INFORMACIÓN VEHICULAR</h2>			
	</header>

	<form id="data" method="post">
		<section>
			<select name="busquedaSUNARP" id="busquedaSUNARP" data-rest>
				<option value="1">Por nombres y apellidos</option>
				<option value="2">Por razón social</option>
				<option value="3">Por n° de partida y oficina registral</option>
				<option value="4">Por n° de placa</option>
			</select>
			<label for="busquedaSUNARP">Tipo de búsqueda</label>
		</section>
		<section class="nombrecontribuyente">
			<input type="search" name="apellidopat" placeholder=" " data-rest autocomplete="off" autofocus required minlength="2" maxlength="20" class="string pide" />
			<label>Apellido paterno</label>
		</section>
		<section class="nombrecontribuyente">
			<input type="search" name="apellidomat" placeholder=" " data-rest autocomplete="off" required minlength="2" maxlength="60" class="string pide" />
			<label>Apellido materno</label>
		</section>
		<section class="nombrecontribuyente">
			<input type="search" name="nombres" placeholder=" " data-rest autocomplete="off" required minlength="2" maxlength="40" class="string pide" />
			<label>Nombres</label>
		</section>

		<section class="razonsocial hide">
			<input type="search" name="razonsocial" placeholder=" " data-rest autocomplete="off" minlength="3" maxlength="150" class="string pide" />
			<label>Razón social</label>
		</section>

		<section class="partidaregistral hide">
			<select name="oficinaregistral" data-rest>
				<option value="">--- ELIJA UNA ---</option>
<?php
			foreach ($oficinas as $zona_oficina){
				$zona = $zona_oficina['zona'];
				$oficina = $zona_oficina['oficina'];
				$ciudad = $zona_oficina['ciudad'];
?>
				<option value="<?=$oficina?>" data-zona="<?=$zona?>"><?=$ciudad?></option>
<?php					
			}
?>			
			</select>
			<input type="hidden" name="zonaregistral" data-rest />
			<label>Oficina registral</label>
		</section>
		<section class="partidaregistral hide">
			<select name="tipopartida" data-rest>
<?php
			foreach ($tipos as $k => $v){
?>
				<option value="<?=$k?>"><?=$v?></option>
<?php					
			}
?>					
			</select>
			<label>Tipo de partida registral</label>
		</section>
		<section class="partidaregistral hide">
			<input type="search" name="nropartida" placeholder=" " data-rest autocomplete="off" minlength="4" maxlength="10" class="string pide" />
			<label>N° de partida registral</label>
		</section>

		<section class="numeroplaca hide">
			<select name="placaoficinaregistral" data-rest>
				<option value="">--- ELIJA UNA ---</option>
<?php
			foreach ($oficinas as $zona_oficina){
				$zona = $zona_oficina['zona'];
				$oficina = $zona_oficina['oficina'];
				$ciudad = $zona_oficina['ciudad'];
?>
				<option value="<?=$oficina?>" data-zona="<?=$zona?>"><?=$ciudad?></option>
<?php					
			}
?>					
			</select>
			<input type="hidden" name="placazonaregistral" data-rest />
			<label>Oficina registral</label>
		</section>
		<section class="numeroplaca hide">
			<input type="search" name="nroplaca" placeholder=" " data-rest autocomplete="off" minlength="4" maxlength="10" class="string pide" />
			<label>N° de placa</label>
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