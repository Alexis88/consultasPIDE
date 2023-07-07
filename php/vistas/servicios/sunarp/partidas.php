<?php
include_once '../../../clases/session.php';
Session::checkUserAjax();
include_once '../../../clases/classhub.php';
include_once '../../../clases/dompdf/autoload.inc.php';

use Dompdf\Dompdf;
use Dompdf\Options;
$dompdf = new Dompdf();

$_POST = Consultas::limpiar($_POST);
extract($_POST);
ob_start();
?>
<!DOCTYPE html>
<html lang="es">
<head>
	<style type="text/css">
		img{
			text-align: center;
			width: 803px;
			height: 1122px;
		}

		@page{
			size: A4 portrait;
			margin: 0;
		}
	</style>
	<title>PIDE - Sistema de Consulta de Datos</title>
</head>
<body>
<?php
//Si no se recibió el conjunto de rutas en base 64 de las imágenes de la partida
if (isset($img)){
	//Se procede a obtenerlas
	$data = ClassHub::userServiceData(ClassHub::myID(), $serviceID);
	if (array_key_exists('login', $data) && $data['login'] < 2){
		$user = $data['user'];
		$pass = $data['pass'];
	}

	$url = 'https://ws5.pide.gob.pe/Rest/APide/Sunarp/WSServicelistarAsientosSIRSARP';
	$img = ClassHub::partidas($url, [
		'zona' => $zona,
		'oficina' => $oficina,
		'partida' => "$partida",
		'registro' => "$registro",
		'usuario' => $user,
		'clave' => $pass,
		'out' => 'json'
	], [], true);
}	

if (count($img)){
	foreach ($img as $i){
?>
		<img src="data:image/jpeg;base64,<?=$i?>" />
<?php
	}
}
else{
?>
	<h1>No se encontraron las hojas de la partida</h1>
<?php
}
?>
</body>
</html>
<?php
$options = new Options();
$options->set('isRemoteEnabled', TRUE);
$dompdf = new DOMPDF($options);
$dompdf->loadHtml(ob_get_clean());
$dompdf->setPaper('A4', 'portrait');
$dompdf->render();
$dompdf->stream('MDP-PIDE-SUNARP-PARTIDA-REGISTRAL-' . $partida . '___' . date('d_m_Y') . '_' . date('H_m_s'), ['Attachment' => false]);
?>