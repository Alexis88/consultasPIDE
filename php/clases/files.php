<?php
set_time_limit(0);
class Files{
	public static $mimes = ['image/jpeg', 'image/png', 'image/bmp', 'image/x-ms-bmp'];
	public static $name;

	public static function upload($file, $route){
		$response = [];
		$finfo = finfo_open(FILEINFO_MIME_TYPE);
		$mime = finfo_file($finfo, $file['tmp_name']);
		$ext = Files::ext($file['tmp_name'])['ext'];

		if ($file['error'] == UPLOAD_ERR_OK && in_array($mime, self::$mimes)){
			$name = sha1($file['name'] . microtime(true)) . $ext;
			$temp = $file['tmp_name'];

			if (self::reduceSize($file['tmp_name'], $route . $name, $mime)){
				self::$name = $name;
			}
		}
		else{
			if ($file['error'] != UPLOAD_ERR_OK) $mensaje = 'El archivo no se subió correctamente';
			else if (!in_array($mime, self::$mimes)) $mensaje = 'El tipo de archivo elegido no es válido';
	
			return [
				'valido' => false,
				'name' => self::$name,
				'mensaje' => $mensaje
			];
		}

		return [
			'valido' => true,
			'name' => self::$name,
		];
	}

	public static function mime($file){
		$finfo = finfo_open(FILEINFO_MIME_TYPE);
		$mime = finfo_file($finfo, $file);
		return $mime;
	}

	public static function reduceSize($file, $route, $type){
		$response = false;

		switch ($type){
			case 'image/jpeg':
				$reducedFile = imagecreatefromjpeg($file); 
            	imagejpeg($reducedFile, $route, 60);
            	$response = $route;
				break;

			case 'image/png':
				$reducedFile = imagecreatefrompng($file); 
            	imagepng($reducedFile, $route, 9);
            	$response = $route;
				break;

			case 'image/bmp': case 'image/x-ms-bmp':
				$reducedFile = imagecreatefrombmp($file); 
            	imagebmp($reducedFile, $route, true);
            	$response = $route;
				break;
		}

		return $response;
	}

	public static function ext($file){
		if ($file){
			$finfo = finfo_open(FILEINFO_MIME_TYPE);
			$mime = finfo_file($finfo, $file);

			switch ($mime){
				case 'image/jpeg':
					return [
						'ext' => '.jpg',
						'type' => 'Archivo de imagen JPEG'
					];
					break;

				case 'image/png':
					return [
						'ext' => '.png',
						'type' => 'Archivo de imagen PNG'
					];
					break;

				case 'image/bmp': case 'image/x-ms-bmp':
					return [
						'ext' => '.bmp',
						'type' => 'Archivo de imagen BMP'
					];
					break;
			}
		}
		
		return false;
	}
}
?>