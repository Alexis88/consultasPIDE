<?php
date_default_timezone_set('America/Lima');
include 'conexion.php';

class Consultas extends Conexion{
	static $result;

	static function comprobar(){
		if (!self::$connection) self::on();
	}

	static function select($options = ['fields' => '*', 'table' => '', 'conditions' => '']){
		self::comprobar();
		$conditions = isset($options['conditions']) ? $options['conditions'] : '';
		$query = "SELECT DISTINCT {$options['fields']} FROM {$options['table']} $conditions";
		self::$result = self::$connection->query($query);
		if (!self::$result) exit(self::$connection->error);
		return self::$result;
	}

	static function insert($options = ['fields' => '', 'values' => '', 'table' => '']){
		self::comprobar();
		$query = "INSERT INTO {$options['table']} {$options['fields']} VALUES {$options['values']}";
		self::$result = self::$connection->query($query);
		if (!self::$result) exit(self::$connection->error);
		return self::$result;
	}

	static function update($options = ['pairs' => '', 'table' => '', 'conditions' => '']){
		self::comprobar();
		$conditions = isset($options['conditions']) ? $options['conditions'] : '';
		$query = "UPDATE {$options['table']} SET {$options['pairs']} $conditions";
		self::$result = self::$connection->query($query);
		if (!self::$result) exit(self::$connection->error);
		return self::$result;
	}

	static function delete($options = ['table' => '', 'conditions' => '']){
		self::comprobar();
		$conditions = isset($options['conditions']) ? $options['conditions'] : '';
		$query = "DELETE FROM {$options['table']} $conditions";
		self::$result = self::$connection->query($query);
		if (!self::$result) exit(self::$connection->error);
		return self::$result;
	}

	static function updateFKon(){
		self::comprobar();
		$query = 'SET foreign_key_checks = 0;';
		self::$result = self::$connection->query($query);
		if (!self::$result) exit(self::$connection->error);
		return self::$result;
	}

	static function updateFKoff(){
		self::comprobar();
		$query = 'SET foreign_key_checks = 1;';
		self::$result = self::$connection->query($query);
		if (!self::$result) exit(self::$connection->error);
		return self::$result;
	}

	static function error(){
		self::comprobar();
		echo self::$connection->error;
	}

	static function ultimo_id(){
		return self::$connection->insert_id;
	}

	static function limpiar($datos){
		self::comprobar();
		if (!is_array($datos))
			return self::$connection->real_escape_string(strip_tags(trim($datos)));
		return array_map(function($dato){
			if (!is_array($dato))
				return self::$connection->real_escape_string(strip_tags(trim($dato)));
			return self::limpiar($dato);
		}, $datos);
	}
}
?>