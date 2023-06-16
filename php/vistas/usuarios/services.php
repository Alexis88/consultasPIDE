<?php
include_once '../../clases/session.php';
Session::checkAdminAjax();
include_once '../../clases/classhub.php';

$servicios = ClassHub::servicios();
?>
	<option value="0">Elija un servicio</option>
<?php
foreach ($servicios as $k => $v){
	if ($v['estado'] == 2) continue;
?>
	<option value="<?=$k?>"><?=$v['nombre']?></option>
<?php					
}
?>	