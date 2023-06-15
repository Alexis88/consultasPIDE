<?php
session_start();
include 'classhub.php';

Class Session{
	public static function checkAdmin(){		
		if (!ClassHub::isLogged() || !ClassHub::isAdmin()){
			header('Location: \apppide');
			exit;
		}
	}

	public static function checkUser(){
		if (!ClassHub::isLogged() || (!ClassHub::isUser() && !ClassHub::isAdmin())){
			header('Location: \apppide');
			exit;
		}
	}

	public static function checkAdminAjax(){
		if (!ClassHub::isLogged() || !ClassHub::isAdmin()){
			echo json_encode([
				'estado' => 'ended',
				'url' => '\apppide'
			]);
			exit;
		}
	}

	public static function checkUserAjax(){
		if (!ClassHub::isLogged() || (!ClassHub::isUser() && !ClassHub::isAdmin())){
			echo json_encode([
				'estado' => 'ended',
				'url' => '\apppide'
			]);
			exit;
		}
	}
}
?>