<?php
include_once '../../clases/session.php';
Session::checkAdminAjax();
include_once '../../clases/classhub.php';

$_GET = Consultas::limpiar($_GET);
extract($_GET);

$niveles = ClassHub::niveles();
$estados = ClassHub::estados();
$servicios = ClassHub::servicios();
$id = isset($id) ? $id : 0;
$data = ClassHub::usuario($id);
?>
<!DOCTYPE html>
<html lang="es">
<head></head>
<body>
	<header id="cabecera">
		<h1><?=$data ? 'EDICIÓN' : 'REGISTRO'?> DE USUARIO</h1>			
	</header>

	<form id="data" action="procesar.php" method="post">
		<section>
			<input type="text" name="usu_apellidopat" id="usu_apellidopat" placeholder=" " autocomplete="off" autofocus required maxlength="30" class="string" value="<?=$data ? $data['usu_apellidopat'] : ''?>" />
			<label for="usu_apellidopat">Apellido paterno</label>
		</section>
		<section>
			<input type="text" name="usu_apellidomat" id="usu_apellidomat" placeholder=" " autocomplete="off" required maxlength="30" class="string" value="<?=$data ? $data['usu_apellidomat'] : ''?>" />
			<label for="usu_apellidomat">Apellido materno</label>
		</section>
		<section>
			<input type="text" name="usu_nombres" id="usu_nombres" placeholder=" " autocomplete="off" required maxlength="30" class="string" value="<?=$data ? $data['usu_nombres'] : ''?>" />
			<label for="usu_nombres">Nombre(s)</label>
		</section>
		<section>
			<input type="tel" name="usu_dni" id="usu_dni" placeholder=" " autocomplete="off" required maxlength="8" class="string" value="<?=$data ? $data['usu_dni'] : ''?>" />
			<label for="usu_dni">N° de DNI</label>
		</section>
		<section>
			<input type="email" name="usu_email" id="usu_email" placeholder=" " autocomplete="off" requiredb maxlength="100" class="string" value="<?=$data ? $data['usu_email'] : ''?>" />
			<label for="usu_email">Correo electrónico</label>
		</section>
		<section>
			<input type="text" name="usu_area" id="usu_area" placeholder=" " autocomplete="off" required maxlength="100" data-field="usu_area" data-url="search" data-table="usuarios" class="string autocomplete" value="<?=$data ? $data['usu_area'] : ''?>" />
			<label for="usu_area">Área</label>
		</section>	
		<section>
			<input type="text" name="usu_cargo" id="usu_cargo" placeholder=" " autocomplete="off" required maxlength="25" data-field="usu_cargo" data-url="search" data-table="usuarios" class="string autocomplete" value="<?=$data ? $data['usu_cargo'] : ''?>" />
			<label for="usu_cargo">Cargo</label>
		</section>	
<?php
	if ($data){
?>
		<section>
			<input type="text" name="usu_username" id="usu_username" placeholder=" " value="<?=$data['usu_username']?>" readOnly />
			<label for="usu_username">Usuario</label>
		</section>
		<section>
			<input type="text" name="usu_password" id="usu_password" placeholder=" " autocomplete="off" maxlength="50" class="all" />
			<label for="usu_password">Nueva clave (opcional)</label>
		</section>
<?php		
	}

	if (($data && ClassHub::myID() != $data['usu_id']) || !$data){
?>			
		<section>
			<select id="fk_niv_usu" name="fk_niv_usu" required>
<?php
			foreach ($niveles as $k => $v){
				$selected = $data && $data['fk_niv_usu'] == $k ? 'selected' : '';
				$disabled = $v['estado'] == 2 ? 'disabled' : '';
				if ((!$data && $v['estado'] == 2) || ($data && $v['estado'] == 2 && $k != $data['fk_niv_usu'])) continue;
?>
				<option value="<?=$k?>" <?=$selected?> <?=$disabled?>><?=$v['nombre']?></option>
<?php					
			}
?>					
			</select>
			<label for="fk_niv_usu">Nivel de usuario</label>
		</section>
<?php
	}
	else{
?>
		<input type="hidden" name="fk_niv_usu" value="<?=$data ? $data['fk_niv_usu'] : ''?>" />
<?php			
	}

	if ($data && ClassHub::myID() != $data['usu_id']){
?>
		<section>
			<select id="usu_estado" name="usu_estado" required>
<?php
			foreach ($estados as $k => $v){
				$selected = $data && $data['usu_estado'] == $k ? 'selected' : '';
?>
				<option value="<?=$k?>" <?=$selected?>><?=$v?></option>
<?php					
			}
?>					
			</select>
			<label for="usu_estado">Estado</label>
		</section>			
<?php
	}
	else{
?>			
		<input type="hidden" name="usu_estado" value="<?=$data ? $data['usu_estado'] : ''?>" />
<?php			
	}
?>			
		<h2>DATOS DE IDENTIFICACIÓN PARA EL USO DE LOS SERVICIOS</h2>

		<span id="addService">Añadir servicio</span>
		<table id="services">
			<thead>
				<tr>
					<th>Servicio</th>
					<th>Usuario</th>
					<th>Contraseña</th>
					<th>Opciones</th>
				</tr>
			</thead>
			<tbody>
<?php
			$userLogin = ClassHub::userLogin($id);
			if ($userLogin){
				while ($rows = $userLogin->fetch_assoc()){
					$loginRequired = ClassHub::loginRequired($rows['idService']);
					$generalCredentials = ClassHub::getGeneralCredentials($rows['idService']);

					if ($loginRequired){
						if ($generalCredentials){
							$attr = 'disabled';
							$user = $generalCredentials['user'];
							$pass = $generalCredentials['pass'];
						}
						else{
							$attr = "";
							$user = $rows['user'];
							$pass = $rows['pass'];
						}
					}
					else{
						$attr = "disabled placeholder='No requiere'";
						$user = $rows['user'];
						$pass = $rows['pass'];
					}
?>					
					<tr>
						<td>
							<select name="servicio[]" required>
								<option value="0">Elija un servicio</option>
<?php
						foreach ($servicios as $k => $v){
							$selected = $rows['idService'] == $k ? 'selected' : '';
							$disabled = $v['estado'] == 2 ? 'disabled' : '';
							if ($v['estado'] == 2){
								if ($k == $rows['idService']){
?>
									<option value="<?=$k?>" <?=$selected?> <?=$disabled?>><?=$v['nombre']?></option>
<?php
								}
								else{
									continue;
								}
							}
							else{
?>
								<option value="<?=$k?>" <?=$selected?> <?=$disabled?>><?=$v['nombre']?></option>
<?php					
							}
						}
?>									
							</select>
							<input type="hidden" name="id_rel[]" value="<?=$rows['idRel']?>" />
						</td>
						<td>
							<input type="text" name="user[]" autocomplete="off" maxlength="50" class="string" value="<?=$user?>" <?=$attr?> />
						</td>
						<td>
							<input type="text" name="pass[]" autocomplete="off" maxlength="50" class="all" value="<?=$pass?>" <?=$attr?> />
						</td>
						<td>
							<img src="../../../img/eliminar.ico" alt="Eliminar datos de este servicio" title="Eliminar datos de este servicio" class="delService" data-id="<?=$rows['idRel']?>" data-user="<?=$id?>" />
						</td>
					</tr>
<?php
				}
			}
			else{
?>
					<tr>
						<td>
							<select name="servicio[]" required>
								<option value="0">Elija un servicio</option>
<?php
							foreach ($servicios as $k => $v){
								if ($v['estado'] == 2) continue;
?>
								<option value="<?=$k?>"><?=$v['nombre']?></option>
<?php					
							}
?>										
							</select>
						</td>
						<td>
							<input type="text" name="user[]" autocomplete="off" maxlength="50" class="string" disabled />
						</td>
						<td>
							<input type="text" name="pass[]" autocomplete="off" maxlength="50" class="all" disabled />
						</td>
						<td>
							<img src="../../../img/eliminar.ico" alt="Eliminar datos de este servicio" title="Eliminar datos de este servicio" class="delService" />
						</td>
					</tr>
<?php					
			}
?>					
			</tbody>
		</table>

		<section>                
            <input type="hidden" name="tipo" value="<?=$data ? 2 : 1?>" />
			<input type="hidden" name="id" value="<?=$data ? $id : 0?>" />
			<input type="submit" value="Guardar" />
        </section>
	</form>
	<span id="subir">▲</span>
</body>
</html>