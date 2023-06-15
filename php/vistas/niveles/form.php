<?php
include_once '../../clases/session.php';
Session::checkAdminAjax();
include_once '../../clases/classhub.php';

$_GET = Consultas::limpiar($_GET);
extract($_GET);

$estados = ClassHub::estados();
$id = isset($id) ? $id : 0;
$data = ClassHub::nivelData($id);
?>
<!DOCTYPE html>
<html lang="es">
<head></head>
<body>
	<header id="cabecera">
		<h1><?=$data ? 'EDICIÓN' : 'REGISTRO'?> DE NIVEL</h1>			
	</header>

	<form id="data" action="procesar.php" method="post">
		<section>
			<input type="text" name="niv_nombre" id="niv_nombre" placeholder=" " autocomplete="off" required maxlength="20" class="string" value="<?=$data ? $data['niv_nombre'] : ''?>" />
			<label for="niv_nombre">Nombre</label>
		</section>
<?php
	if ($data){
?>			
		<section>
			<select id="niv_estado" name="niv_estado" required>
<?php
			foreach ($estados as $k => $v){
				$selected = $data && $data['niv_estado'] == $k ? 'selected' : '';
?>
				<option value="<?=$k?>" <?=$selected?>><?=$v?></option>
<?php					
			}
?>					
			</select>
			<label for="niv_estado">Estado</label>
		</section>
<?php
	}
?>			
		<section>                
            <input type="hidden" name="tipo" value="<?=$data ? 2 : 1?>" />
			<input type="hidden" name="id" value="<?=$data ? $id : 0?>" />
			<input type="submit" value="Guardar" />
        </section>
	</form>
	<span id="subir">▲</span>
</body>
</html>