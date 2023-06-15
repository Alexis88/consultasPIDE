<?php
session_start();
$_SESSION['datos']['identificado'] = false;
session_destroy();

include_once '../../clases/classhub.php';

$timestamp = ClassHub::getTimestamp();
?>
<!DOCTYPE html>
<html lang="es">
<head>
<?php
	ClassHub::head(["<link rel='stylesheet' type='text/css' href='../../../css/login.css?timestamp=$timestamp' />"]);
?>	
</head>
<body>
	<section>
		<form action="verificar.php" method="post" data-time="0" autocomplete="off">
		    <header>
		    	<div id="logos">
		    		<img id="logoMDP" src="../../../img/mdp-logo.png" />
		    		<img id="logoPCM" src="../../../img/pcm-logo.png" />
		    	</div>
		        <h1>PLATAFORMA DE INTEROPERABILIDAD DEL ESTADO</h1>
		        <h2>Sistema de consulta de datos</h2>				
		    </header>
			<section>
				<input type="text" name="user" id="user" required autocomplete="off" autofocus maxlength="20" placeholder=" " />
				<label for="user">👤 Nombre de usuario</label>
			</section>
			<section>
				<input type="password" name="pass" id="pass" required autocomplete="new-password" maxlength="50" placeholder=" " />
				<label for="pass">🔐 Contraseña</label>
			</section>
			<section class="rememberData">
				<span id="slider" class="off slide">
					<span id="sliderBtn" class="slide">No</span>
				</span>
				<span id="sliderTxt" class="slide">Recordar datos</span>				
			</section>
			<section>				
				<input type="submit" value="Entrar" />
			</section>
		</form>
	</section>
	<footer>
		<script type="text/javascript" src="../../../js/ajax.js?timestamp=<?=$timestamp?>"></script>
		<script type="text/javascript" src="../../../js/notification.js?timestamp=<?=$timestamp?>"></script>
		<script type="text/javascript" src="../../../js/login.js?timestamp=<?=$timestamp?>"></script>
	</footer>
</body>
</html>