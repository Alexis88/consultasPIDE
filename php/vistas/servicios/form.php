<?php
include_once '../../clases/session.php';
Session::checkAdminAjax();
include_once '../../clases/classhub.php';

$_GET = Consultas::limpiar($_GET);
extract($_GET);

$estados = ClassHub::estados();
$boolean = ClassHub::boolean();
$id = isset($id) ? $id : 0;
$data = ClassHub::servicio($id);
?>
<!DOCTYPE html>
<html lang="es">
<head></head>
<body>
	<header id="cabecera">
		<h1><?=$data ? 'EDICIÓN' : 'REGISTRO'?> DE SERVICIO</h1>			
	</header>

	<form id="data" class="mantenimiento" action="procesar.php" method="post" enctype="multipart/form-data">
		<section>
			<input type="text" name="ser_nombre" id="ser_nombre" placeholder=" " autocomplete="off" autofocus required maxlength="50" class="string" value="<?=$data ? $data['ser_nombre'] : ''?>" />
			<label for="ser_nombre">Nombre clave</label>
		</section>

		<section>
			<input type="text" name="ser_etiqueta" id="ser_etiqueta" placeholder=" " autocomplete="off" required maxlength="50" class="string" value="<?=$data ? $data['ser_etiqueta'] : ''?>" />
			<label for="ser_etiqueta">Nombre público</label>
		</section>

		<section>
<?php
			$path = '../../../img/servicios';
			$logo = $data && strlen($data['ser_logo']) ? "src='$path/{$data['ser_logo']}'" : "src='$path/default.png'";
			$idLogo = $data && $data['ser_logo'] != 'default.png' ? $id : '';
?>
			<img class="preview <?=strlen($idLogo) ? 'modalMedia' : ''?>" <?=$logo?> title="<?=$data && strlen($data['ser_logo']) ? 'Logo del servicio' : 'Logo por defecto'?>" />
			<label class="drop droppable" title="Adjunte el logo del servicio">
				<span class="textDrop droppable" data-text="Adjunte el logo del servicio">Adjunte el logo del servicio</span>
				<input type="file" class="droppable" name="ser_logo" accept="image/jpeg, image/png, image/bmp" />
			</label>					
			<span class="del" title="Eliminar este logo" data-logo="<?=$idLogo?>">✖</span>
		</section>

		<section>
			<textarea name="ser_descripcion" id="ser_descripcion" placeholder=" " required maxlength="150" class="string"><?=$data ? $data['ser_descripcion'] : ''?></textarea>
			<label for="ser_descripcion">Descripción del servicio</label>
		</section>

		<section>
			<select name="ser_login" id="ser_login" required>
<?php
			foreach ($boolean as $k => $v){
				$selected = $data && $k == $data['ser_login'] ? 'selected' : '';
?>
				<option value="<?=$k?>" <?=$selected?>><?=$v?></option>
<?php					
			}
?>
			</select>
			<label for="ser_login">Requiere identificación</label>
		</section>
<?php
		$class = $data ? ($data['ser_login'] < 2 ? 'flex' : 'hide') : 'flex';
		$required = $data ? ($data['ser_login'] < 2 ? 'required' : '') : 'required';
?>
		<section class="<?=$class?>" <?=$required?>>
			<select name="ser_update" id="ser_update">
<?php
			foreach ($boolean as $k => $v){
				$selected = $data && $k == $data['ser_update'] ? 'selected' : '';
?>
				<option value="<?=$k?>" <?=$selected?>><?=$v?></option>
<?php					
			}
?>					
			</select>
			<label for="ser_update">Requiere actualización de credenciales</label>
		</section>
<?php
		$class = $data ? ($data['ser_login'] < 2 && $data['ser_update'] < 2 ? 'flex' : 'hide') : 'flex';
		$required = $data ? ($data['ser_login'] < 2 && $data['ser_update'] < 2 ? 'required' : '') : 'required';
?>
		<section class="<?=$class?>">
			<input type="tel" name="ser_updatetime" id="ser_updatetime" placeholder=" " autocomplete="off" maxlength="3" class="number" <?=$required?> value="<?=$data ? $data['ser_updatetime'] : ''?>" />
			<label for="ser_updatetime">Tiempo entre actualizaciones (en días)</label>
		</section>
<?php
		$class = $data ? ($data['ser_login'] < 2 ? 'flex' : 'hide') : 'flex';
		$required = $data ? ($data['ser_login'] < 2 ? 'required' : '') : 'required';
?>
		<section class="<?=$class?>">
			<select name="ser_generalLogin" id="ser_generalLogin">
<?php
			foreach ($boolean as $k => $v){
				$selected = $data && $k == $data['ser_generalLogin'] ? 'selected' : '';
?>
				<option value="<?=$k?>" <?=$selected?>><?=$v?></option>
<?php					
			}
?>					
			</select>
			<label for="ser_generalLogin">Datos de acceso únicos</label>
		</section>		
<?php		
		$class = $data ? ($data['ser_login'] < 2 && $data['ser_generalLogin'] < 2 ? 'flex' : 'hide') : 'flex';
		$required = $data ? ($data['ser_login'] < 2 && $data['ser_generalLogin'] < 2 ? 'required' : '') : 'required';
		$generalCredentials = $id ? ClassHub::getGeneralCredentials($id) : false;

?>
		<section class="<?=$class?> generalLogin">
			<input type="text" name="gen_user" id="gen_user" placeholder=" " autocomplete="off" <?=$required?> value="<?=$generalCredentials ? $generalCredentials['user'] : ''?>" maxlength="50" class="string" />
			<label for="gen_user">Usuario</label>
		</section>

		<section class="<?=$class?> generalLogin">
			<input type="text" name="gen_pass" id="gen_pass" placeholder=" " autocomplete="off" <?=$required?> value="<?=$generalCredentials ? $generalCredentials['pass'] : ''?>" maxlength="50" class="all" />
			<label for="gen_pass">Contraseña</label>
		</section>
<?php
	if ($data){
?>
		<section>
			<select id="ser_estado" name="ser_estado" required>
<?php
			foreach ($estados as $k => $v){
				$selected = $data && $data['ser_estado'] == $k ? 'selected' : '';
?>
				<option value="<?=$k?>" <?=$selected?>><?=$v?></option>
<?php					
			}
?>					
			</select>
			<label for="ser_estado">Estado</label>
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