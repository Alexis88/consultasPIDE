<?php
class Conexion{
	static public $connection = false;
  	static protected $server = 'localhost';
	static protected $user = 'root';
	//static protected $pass = 'CLAVE*2020';
	static protected $pass = '$2y$10$qOLrV8HZs0IcklyamMhe4eT0MeQIWBOxn29ca/WZXUFDgNEbSc9yC';
	static protected $db = 'bd_pide';

	static function on(){
		self::$connection = new mysqli(self::$server, self::$user, self::$pass, self::$db);
		if (self::$connection->connect_errno) exit('ERROR ' . self::$connection->connect_errno . ': ' . self::$connection->connect_error);		
	}

	static function off(){
		self::$connection->close();
	}
}
?>