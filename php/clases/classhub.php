<?php
include_once 'consultas.php';

class ClassHub{
	//BUSCAR
	public static function buscar($options){
		return Consultas::select($options);
	}

	//AUDITORIA
	public static function control($values){
		return Consultas::insert([
			'fields' => '(con_datetime, con_accion, con_ip, fk_usu_con)',
			'values' => $values,
			'table' => 'tbl_control'
		]);
	}

	//USUARIOS
	public static function usuario($id){
		$results = Consultas::select([
			'fields' => '*',
			'table' => 'tbl_usuarios',
			'conditions' => "WHERE usu_id = $id"
		]);
		return $results->num_rows ? $results->fetch_assoc() : null;
	}

	//DNI DUPLICADO
	public static function duplicatedDNI($dni, $id = ''){
		$results = self::buscar([
			'fields' => 'usu_dni',
			'table' => 'tbl_usuarios',
			'conditions' => strlen($id) ? "WHERE usu_dni = '$dni' AND usu_id != $id" : "WHERE usu_dni = '$dni'"
		]);
		return $results->num_rows ? true : false;
	}

	//SERVICIOS
	public static function servicio($id){
		$results = Consultas::select([
			'fields' => '*',
			'table' => 'tbl_servicios',
			'conditions' => "WHERE ser_id = $id"
		]);
		return $results->num_rows ? $results->fetch_assoc() : null;
	}

	public static function servicios(){
		$results = Consultas::select([
			'fields' => '*',
			'table' => 'tbl_servicios'
		]);

		$data = [];		
		
		if ($results->num_rows){
			while ($rows = $results->fetch_assoc()){
				$data[$rows['ser_id']] = [
					'nombre' => $rows['ser_nombre'],
					'estado' => $rows['ser_estado']
				];
			}
		}

		return $data;
	}

	public static function getServiceByName($options){
		$results = Consultas::select([
			'fields' => $options['fields'],
			'table' => 'tbl_servicios a LEFT JOIN tbl_generalLogin b ON b.fk_ser_gen = a.ser_id',
			'conditions' => "WHERE a.ser_nombre = '{$options['name']}'"
		]);

		return $results->num_rows ? $results->fetch_assoc() : false;
	}

	public static function checkService($servicios){
		return array_filter($servicios) !== array_unique(array_filter($servicios));
	}

	public static function availableService($serviceName){
		$results = Consultas::select([
			'fields' => 'b.*',
			'table' => 'tbl_rel_usu_ser a LEFT JOIN tbl_servicios b ON a.fk_ser_relus = b.ser_id',
			'conditions' => "WHERE b.ser_nombre = '$serviceName' AND b.ser_estado = 1 AND a.fk_usu_relus = " . self::myID() . " AND ((b.ser_login < 2 AND (a.relus_username != '' OR a.relus_password != '')) OR b.ser_login = 2)"
		]);
		return $results->num_rows ? true : false;
	}

	public static function stopServiceLoad($service){
		if (!self::availableService($service)){
			echo '<h2>Servicio no disponible</h2>';
			exit;
		}		
	}

	public static function loginRequired($idService){
		$results = Consultas::select([
			'fields' => 'ser_login',
			'table' => 'tbl_servicios',
			'conditions' => "WHERE ser_id = $idService"
		]);
		
		if ($results->num_rows){
			$row = $results->fetch_assoc();
			return $row['ser_login'] < 2;
		}

		return null;
	}

	public static function getGeneralCredentials($id){
		$results = Consultas::select([
			'fields' => 'gen_user AS user, gen_pass AS pass',
			'table' => 'tbl_generalLogin',
			'conditions' => "WHERE fk_ser_gen = $id"
		]);
		return $results->num_rows ? $results->fetch_assoc() : [];
	}

	public static function serviceName($id){
		$results = Consultas::select([
			'fields' => 'ser_nombre',
			'table' => 'tbl_servicios',
			'conditions' => "WHERE ser_id = $id"
		]);
		return $results->num_rows ? $results->fetch_assoc()['ser_nombre'] : null;
	}

	public static function duplicatedService($name, $label, $id = false){
		$results = Consultas::select([
			'fields' => 'ser_nombre',
			'table' => 'tbl_servicios',
			'conditions' => "WHERE (ser_nombre = '$name' OR ser_etiqueta = '$label')" . ($id ? " AND ser_id != $id" : '')
		]);
		return $results->num_rows ? true : false;
	}

	public static function duplicatedLoginData($username, $idService, $idUser){
		$conditions = "WHERE relus_username = '$username'";
		$conditions .= "AND fk_ser_relus = $idService";
		$conditions .= $idUser ? " AND fk_usu_relus != $idUser" : '';
		$results = Consultas::select([
			'fields' => '*',
			'table' => 'tbl_rel_usu_ser',
			'conditions' => $conditions
		]);
		return $results->num_rows ? true : false;
	}

	public static function userServiceData($idUser, $idService){
		$results = Consultas::select([
			'fields' => "CONCAT(b.usu_nombres, ' ', b.usu_apellidopat, ' ', b.usu_apellidomat) AS usuario, c.ser_nombre AS servicio, a.relus_username AS username, a.relus_password AS password, c.ser_login AS identificacion",
			'table' => 'tbl_rel_usu_ser a INNER JOIN tbl_usuarios b ON a.fk_usu_relus = b.usu_id INNER JOIN tbl_servicios c ON a.fk_ser_relus = c.ser_id',
			'conditions' => "WHERE a.fk_usu_relus = $idUser AND a.fk_ser_relus = $idService"
		]);

		$data = [];

		if ($results->num_rows){
			$row = $results->fetch_assoc();
			$data = [
				'usuario' => $row['usuario'],
				'servicio' => $row['servicio'],
				'user' => $row['username'],
				'pass' => $row['password'],
				'login' => $row['identificacion']
			];
		}

		return $data;
	}

	public static function deleteLogoFile($idService){
		$results = Consultas::select([
			'fields' => 'ser_logo',
			'table' => 'tbl_servicios',
			'conditions' => "WHERE ser_id = $idService"
		]);

		if ($results->num_rows){
			$row = $results->fetch_assoc();

			if (strlen($row['ser_logo']) && $row['ser_logo'] != 'default.png'){
				$logo = "../../../img/servicios/{$row['ser_logo']}";

				if (file_exists($logo)){
					unlink($logo);
				}
			}
		}
	}

	//CONSUMO DE SERVICIOS
	public static function consumir($data){
		$curl = curl_init();
		$options = self::config($data);
		curl_setopt_array($curl, $options);
		$response = curl_exec($curl);
		curl_close($curl);
		$obj = json_decode(str_replace(['$', 'undefined'], ['value', '-'], $response), true);

		return isset($obj) ? $obj : false;
	}

	//SE CONFIGURAN LAS OPCIONES PARA REALIZAR LA CONSULTA U OTRA OPERACIÓN
	public static function config($params){
		//Arreglo asociativo que albergará todos los datos a emplear
		$response = [];

		//Configuración de la URL
		$url = explode('?', $params['url'])[0];

		switch ($params['method']){
			//Si el método de envío es GET, se genera la cadena de consulta y se adjunta a la URL
			case 'GET': default:
				$data = http_build_query($params['data']);
				$url .= "?$data";
				break;

			case 'POST':
				//Si el método de envío es POST, se codifican los datos en formato JSON
				$data = json_encode(['PIDE' => $params['data']]);
				break;
		}

		//Las opciones de configuración
		$options = [
			CURLOPT_URL => $url,
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_ENCODING => '',
			CURLOPT_MAXREDIRS => 10,
			CURLOPT_CONNECTTIMEOUT => 20,
			CURLOPT_TIMEOUT => 300,
			CURLOPT_FOLLOWLOCATION => true,
			CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
			CURLOPT_CUSTOMREQUEST => $params['method'],
			CURLOPT_SSL_VERIFYPEER => false,
			CURLOPT_HTTPHEADER => ['Content-Type: application/json']
		];

		//Si el método de envío es POST, los datos se envían aparte
		if ($params['method'] == 'POST'){
			$options[CURLOPT_POSTFIELDS] = $data;
		}

		return $options;
	}

	//CONSUMO DE SERVICIO QUE MUESTRA LAS PARTIDAS REGISTRALES
	public static function getPartida($data){
		return self::consumir([
			'url' => 'https://ws5.pide.gob.pe/Rest/APide/Sunarp/WSServiceverAsientosSIRSARP',
			'method' => 'GET',
			'data' => $data
		]);
	}

	//BUSCAR PARTIDAS REGISTRALES
	public static function buscarPartidas($dominio, $url, $user, $pass){
		$tempData = [
			'tipoRegistro' => isset($dominio['registro']) ? $dominio['registro'] : '-',
			'libro' => array_key_exists('libro', $dominio) ? $dominio['libro'] : '-',
			'titular' => array_key_exists('apPaterno', $dominio) ? "{$dominio['apPaterno']} {$dominio['apMaterno']} {$dominio['nombre']}" : $dominio['razonSocial'],
			'tipDoc' => isset($dominio['tipoDocumento']) ? $dominio['tipoDocumento'] : '-',
			'partida' => isset($dominio['numeroPartida']) ? $dominio['numeroPartida'] : '-',
			'estado' => isset($dominio['estado']) ? $dominio['estado'] : '-',
			'zona' => isset($dominio['zona']) ? $dominio['zona'] : '-',
			'oficina' => isset($dominio['oficina']) ? $dominio['oficina'] : '-',
			'registro' => array_key_exists('numeroPlaca', $dominio) ? '24000' : '21000',
			'download' => 'no'
		];

		if (array_key_exists('numeroDocumento', $dominio)){
			$tempData['numDoc'] = isset($dominio['numeroDocumento']) ? $dominio['numeroDocumento'] : '-';
		}

		if (array_key_exists('direccion', $dominio)){
			$tempData['direccion'] = isset($dominio['direccion']) ? $dominio['direccion'] : '-';
		}

		if (array_key_exists('numeroPlaca', $dominio)){
			$tempData['placa'] = isset($dominio['numeroPlaca']) ? $dominio['numeroPlaca'] : '-';
		}		

		//Se buscan los datos de la oficina asociada con los datos de la titularidad de dominio
		$oficina = self::getOficina($dominio['oficina'], 'ciudad');

		//Si no se encuentra la oficina indicada en la iteración actual
		if (!$oficina){
			//Se devuelven los datos de la titularidad
			return $tempData;
		}

		//Se adicionan los códigos de la zona y oficina registral
		$tempData['codZona'] = $oficina['zona'];
		$tempData['codOficina'] = $oficina['oficina'];

		//Se busca los asientos correspondientes a la partida de la iteración actual
		$tempData = self::partidas($url, [
			'zona' => $oficina['zona'],
			'oficina' => $oficina['oficina'],
			'partida' => $dominio['numeroPartida'],
			'registro' => array_key_exists('numeroPlaca', $dominio) ? '24000' : '21000',
			'usuario' => $user,
			'clave' => $pass,
			'out' => 'json'
		], $tempData, false);
		
		//Se devuelve el conjunto final de resultados
		return $tempData;
	}

	public static function partidas($url, $data, $tempData, $getPartida){
		$results = self::consumir([
			'url' => $url,
			'method' => 'GET',
			'data' => $data
		]);

		//Almacén temporal de datos de las páginas de los asientos
		$temp = [];

		//Credenciales
		$user = $data['usuario'];
		$pass = $data['clave'];

		//Si no se encuentra asientos
		if (!isset($results['listarAsientosSIRSARPResponse']['asientos'])){
			//Se devuelven los datos de la titularidad
			return $tempData;
		}

		//Se obtienen los asientos
		$dataPreliminar = $results['listarAsientosSIRSARPResponse']['asientos'];

		//Si se obtuvo los asientos
		if ($dataPreliminar){
			//Si no se ha establecido la obtención de las imágenes de la partida
			if (!$getPartida){
				//Se adiciona un comodín que indicará que se encontró la partida y así se pueda descargarla
				$tempData['download'] = 'yes';

				//Se retornan los datos de la titularidad de dominio
				return $tempData;
			}
		}

		//Se forma el conjunto de datos a enviar a la consulta de la imagen de la partida
		$data = [
			'transaccion' => $dataPreliminar['transaccion'],
			'nroTotalPag' => $dataPreliminar['nroTotalPag'],
			'usuario' => $user,
			'clave' => $pass,
			'out' => 'json'
		];		

		//Si hay asientos
		if (isset($dataPreliminar['listAsientos'])){
			//Si hay más de un asiento
			if (isset($dataPreliminar['listAsientos'][0])){
				//Se recorre el conjunto
				foreach ($dataPreliminar['listAsientos'] as $asiento){
					//Si el asiento es un objeto, se decodifica
					$asiento = is_object($asiento) ? json_decode($asiento, true) : $asiento;

					//Se obtiene el ID de la imagen de la partida y el tipo
					if (isset($asiento['idImgAsiento'])){
						$temp['idImg'] = $asiento['idImgAsiento'];
					}
					else{
						$temp['idImg'] = $dataPreliminar['listAsientos']['idImgAsiento'];
					}

					if (isset($asiento['tipo'])){
						$temp['tipo'] = $asiento['tipo'];
					}
					else{
						$temp['tipo'] = $dataPreliminar['listAsientos']['tipo'];
					}

					//Si hay varias páginas
					if (isset($asiento['listPag'][0])){
						//Se recorre el conjunto
						foreach ($asiento['listPag'] as $pagina){
							//Si la página es un objeto, se decodifica
							$pagina = is_object($pagina) ? json_decode($pagina, true) : $pagina;
								
							//Se obtiene el número de página de referencia y la página
							if (isset($pagina['nroPagRef'])){
								$temp['nroPagRef'] = $pagina['nroPagRef'];
							}
							else{
								$temp['nroPagRef'] = $asiento['listPag']['nroPagRef'];
							}

							if (isset($pagina['pagina'])){
								$temp['pagina'] = $pagina['pagina'];
							}
							else{
								$temp['pagina'] = $asiento['listPag']['pagina'];
							}

							//Se forma el conjunto de datos a enviar a la consulta
							$data = array_merge($data, $temp);		

							//Se realiza la búsqueda
							$results = self::getPartida($data);

							//Si se encontró la imagen de la partida
							if (isset($results['verAsientoSIRSARPResponse']['img'])){
								//Se la anexa al conjunto de imágenes de la partida
								$tempData['img'][] = $results['verAsientoSIRSARPResponse']['img'];
							}
						}
					}
					//Si solo hay una página
					else{
						//Se obtiene el número de página de referencia y la página
						if (isset($asiento['listPag']['nroPagRef'])){
							$temp['nroPagRef'] = $asiento['listPag']['nroPagRef'];
						}
						else{
							$temp['nroPagRef'] = $dataPreliminar['listAsientos']['listPag']['nroPagRef'];
						}						

						if (isset($asiento['listPag']['pagina'])){
							$temp['pagina'] = $asiento['listPag']['pagina'];
						}
						else{
							$temp['pagina'] = $dataPreliminar['listAsientos']['listPag']['pagina'];
						}

						//Se forma el conjunto de datos a enviar a la consulta
						$data = array_merge($data, $temp);	

						//Se realiza la búsqueda de la imagen de la partida			
						$results = self::getPartida($data);

						//Si se encontró la imagen de la partida
						if (isset($results['verAsientoSIRSARPResponse']['img'])){
							//Se la anexa al conjunto de imágenes de la partida
							$tempData['img'][] = $results['verAsientoSIRSARPResponse']['img'];
						}
					}				
				}
			}
			//Si solo hay un asiento
			else{
				//Se obtiene el ID de la imagen de la partida y el tipo
				$temp['idImg'] = $dataPreliminar['listAsientos']['idImgAsiento'];
				$temp['tipo'] = $dataPreliminar['listAsientos']['tipo'];

				//Si hay varias páginas
				if (isset($dataPreliminar['listAsientos']['listPag'][0])){
					//Se recorre el conjunto
					foreach ($dataPreliminar['listAsientos']['listPag'] as $pagina){
						//Si la página es un objeto, se decodifica
						$pagina = is_object($pagina) ? json_decode($pagina, true) : $pagina;

						//Se obtiene el número de página de referencia y la página 
						if (isset($pagina['nroPagRef'])){
							$temp['nroPagRef'] = $pagina['nroPagRef'];
						}
						else{
							$temp['nroPagRef'] = $dataPreliminar['listAsientos']['listPag']['nroPagRef'];
						}

						if (isset($pagina['pagina'])){
							$temp['pagina'] = $pagina['pagina'];
						}
						else{
							$temp['pagina'] = $dataPreliminar['listAsientos']['listPag']['pagina'];
						}

						//Se forma el conjunto de datos a enviar a la consulta
						$data = array_merge($data, $temp);

						//Se realiza la búsqueda de la imagen de la partida			
						$results = self::getPartida($data);

						//Si se encontró la imagen de la partida
						if (isset($results['verAsientoSIRSARPResponse']['img'])){
							//Se la anexa al conjunto de imágenes de la partida
							$tempData['img'][] = $results['verAsientoSIRSARPResponse']['img'];
						}
					}
				}
				//Si solo hay una página
				else{
					//Se obtiene el número de página de referencia y la página 
					$temp['nroPagRef'] = $dataPreliminar['listAsientos']['listPag']['nroPagRef'];
					$temp['pagina'] = $dataPreliminar['listAsientos']['listPag']['pagina'];

					//Se forma el conjunto de datos a enviar a la consulta
					$data = array_merge($data, $temp);	

					//Se realiza la búsqueda de la imagen de la partida			
					$results = self::getPartida($data);

					//Si se encontró la imagen de la partida
					if (isset($results['verAsientoSIRSARPResponse']['img'])){
						//Se la anexa al conjunto de imágenes de la partida
						$tempData['img'][] = $results['verAsientoSIRSARPResponse']['img'];
					}
				}
			}
		}

		return $tempData;
	}

	//VERIFICAR SI EL DATO INGRESADO CORRESPONDE AL FORMATO DEL RUC
	public static function isRUC($ruc){
		return strlen($ruc) == 11 && preg_match('|^[0-9\n\r]*$|is', $ruc) === 1;
	}

	//VERIFICAR SI EL DATO INGRESADO CORRESPONDE AL FORMATO DEL DNI
	public static function isDNI($dni){
		return strlen($dni) == 8 && preg_match('|^[0-9\n\r]*$|is', $dni) === 1;
	}

	//OBTENER EL RUC A PARTIR DEL NOMBRE O RAZÓN SOCIAL
	public static function getRUC($data){
		$url = 'https://ws3.pide.gob.pe/Rest/Sunat/RazonSocial';
		$results = ClassHub::consumir([
			'url' => $url,
			'method' => 'GET',
			'data' => [
				'RSocial' => mb_strtoupper($data),
				'out' => 'json'
			]
		]);

		if (isset($results['list']['multiRef'][0])){
			$list = [];

			foreach ($results['list']['multiRef'] as $row){
				$list[] = $row['ddp_numruc']['value'];
			}
			
			return $list;
		}
		else{
			return $results['list']['multiRef']['ddp_numruc']['value'];
		}

		return false;
	}

	//OBTENER EL DNI A PARTIR DEL NOMBRE O RAZÓN SOCIAL
	public static function getDNI($data){
		$ruc = self::getRUC($data);

		if (!$ruc) return false;

		$url = 'https://ws3.pide.gob.pe/Rest/Sunat/DatosSecundarios';

		$results = ClassHub::consumir([
			'url' => $url,
			'method' => 'GET',
			'data' => [
				'numruc' => $ruc,
				'out' => 'json'
			]
		]);

		if (isset($results['list']['multiRef']['dds_docide']) && $results['list']['multiRef']['desc_docide']['value'] == 'DNI'){
			return $results['list']['multiRef']['dds_nrodoc']['value'];
		}

		return false;
	}

	//ACTUALIZACIÓN DE CREDENCIALES DE USUARIOS DEL SERVICIO DE RENIEC
	public static function updateCredentialsReniec(){
		$results = Consultas::select([
			'fields' => 'a.ser_id',
			'table' => 'tbl_servicios a LEFT JOIN tbl_updates b ON b.fk_ser_upd = a.tbl_servicios',
			'conditions' => "WHERE a.ser_nombre = 'RENIEC' AND DATEDIFF(CURDATE(), b.upd_time) >= a.ser_updatetime"
		]);

		if ($results->num_rows){
			$row = $results->fetch_assoc();
			$userData = Consultas::select([
				'fields' => 'a.usu_id, a.usu_dni, b.relus_password',
				'table' => 'tbl_usuarios a LEFT JOIN b.tbl_rel_usu_ser b ON b.fk_usu_relus = a.usu_id',
				'conditions' => "WHERE b.fk_ser_relus = {$row['ser_id']}"
			]);

			if ($userData->num_rows){
				while ($userRows = $userData->fetch_assoc()){
					$newpass = str_replace('.', '', microtime(true));
					$data = [
						'url' => 'https://ws5.pide.gob.pe/Rest/Reniec/ActualizarCredencial',
						'method' => 'POST',
						'data' => [
							'credencialAnterior' => $userRows['relus_password'],
							'credencialNueva' => $newpass,
							'nuDni' => $userRows['usu_dni'],
							'nuRuc' => '20147796987',
							'out' => 'json'
						]
					];

					$update = self::consumir($data);
					$result = $update ? json_decode($update, true) : false;

					if ($result && $result['coResultado'] == '0000'){
						$results = Consultas::update([
							'pairs' => "relus_password = '$newpass'",
							'table' => 'tbl_rel_usu_ser',
							'conditions' => "WHERE fk_usu_relus = {$userData['usu_id']} AND fk_ser_relus = {$row['ser_id']}"
						]);

						$accion = 'Se actualizó la credencial del usuario';
						$accion .= $results ? ' y se guardó en la base de datos local' : ' pero no se pudo guardar en la base de datos local';
						$accion .= " de DNI n° {$userRows['usu_dni']}";
					}
					else{
						$accion = "No se pudo actualizar la credencial del usuario de DNI n° {$userRows['usu_dni']} ni guardarla en la base de datos local";
					}

					//Registro de control	
					self::control("(NOW(), '$accion', '190.223.60.211', 1)");
				}
			}
		}
	}

	//DATOS DE CONEXIÓN DEL USUARIO A LOS SERVICIOS ASOCIADOS
	public static function userLogin($id){
		$results = Consultas::select([
			'fields' => "a.relus_id AS idRel, c.ser_id AS idService, a.relus_username AS user, a.relus_password AS pass, c.ser_nombre AS servicio",
			'table' => 'tbl_rel_usu_ser a INNER JOIN tbl_usuarios b ON a.fk_usu_relus = b.usu_id INNER JOIN tbl_servicios c ON a.fk_ser_relus = c.ser_id',
			'conditions' => "WHERE a.fk_usu_relus = $id"
		]);
		return $results->num_rows ? $results : null;
	}

	//NIVELES
	public static function nivel($nivel = 'ADMIN'){
		$results = Consultas::select([
			'fields' => '*',
			'table' => 'tbl_niveles',
			'conditions' => "WHERE niv_nombre = '$nivel'"
		]);

		if ($results->num_rows){
			$row = $results->fetch_assoc();
			return $row['niv_id'];
		}

		return false;
	}

	public static function nivelData($id){
		$results = Consultas::select([
			'fields' => '*',
			'table' => 'tbl_niveles',
			'conditions' => "WHERE niv_id = $id"
		]);
		return $results->num_rows ? $results->fetch_assoc() : null;
	}

	public static function duplicatedLevel($nivel, $id){
		$conditions = "WHERE niv_nombre = '$nivel'" . ($id ? " AND niv_id != $id" : '');
		$results = self::buscar([
			'fields' => 'niv_nombre',
			'table' => 'tbl_niveles',
			'conditions' => $conditions
		]);
		return $results->num_rows ? true : false;
	}

	public static function niveles(){
		$results = Consultas::select([
			'fields' => '*',
			'table' => 'tbl_niveles'
		]);

		$list = [];

		if ($results->num_rows){
			while ($rows = $results->fetch_assoc()){
				$list[$rows['niv_id']] = [
					'nombre' => $rows['niv_nombre'],
					'estado' => $rows['niv_estado']
				];
			}			
		}

		return $list;
	}

	//AUTOCOMPLETAR CAMPOS
	public static function autocomplete($term, $field, $table){
		$results = self::buscar([
			'fields' => $field,
			'table' => $table,
			'conditions' => "WHERE $field LIKE '%$term%'"
		]);

		$response = [];

		if ($results->num_rows){
			while ($rows = $results->fetch_assoc()){
				$response[] = [
					'id' => substr($field, strpos($field, '_') + 1) . 'id',
					'data' => $rows[$field]
				];
			}
		}

		echo json_encode($response);
	}

	//ACCESO Y ENCRIPTACIÓN
	public static function generarAcceso($nom, $apepat, $apemat){
		$nom = self::tildes($nom);
		$apepat = self::tildes($apepat);
		$apemat = self::tildes($apemat);
		$fullname = [$nom, $apepat, $apemat];
		$user = '';
		$i = 0;

		foreach ($fullname as $chunks){
			$user .= mb_strtoupper(substr($chunks, 0, 3));
		}

		$user = substr($user, 0, 20);

		do{
			$results = self::buscar([
				'fields' => 'usu_username',
				'table' => 'tbl_usuarios',
				'conditions' => "WHERE usu_username = '$user'"
			]);

			if ($results->num_rows){
				$user .= ++$i;
			}

			$user = substr($user, 0, 20);
		} while ($results->num_rows);

		return [
			'user' => preg_replace('/[^a-z0-9]*/is', '', $user),
			'pass' => self::encrypt($user)
		];
	}

	public static function tildes($text){
		return str_replace(['Á', 'É', 'Í', 'Ó', 'Ú', 'á', 'é', 'í', 'ó', 'ú', 'Ñ', 'ñ', 'Ü', 'ü'], 
						   ['A', 'E', 'I', 'O', 'U', 'a', 'e', 'i', 'o', 'u', 'N', 'n', 'U', 'u'], 
						   $text);
	}
	
	public static function utf8($text){
	    return str_replace(['Á', 'É', 'Í', 'Ó', 'Ú', 'á', 'é', 'í', 'ó', 'ú', 'Ñ', 'ñ', 'Ü', 'ü'], 
						   ['&Aacute;', '&Eacute;', '&Iacute;', '&Oacute;', '&Uacute;', '&aacute;', '&eacute;', '&iacute;', '&oacute;', '&uacute;', '&Ntilde;', '&ntilde;', '&Uuml;', '&uuml;'], 
						   $text);
	}

	//VERIFICAR SI EL USUARIO SE HA IDENTIFICADO
	public static function isLogged(){
		return isset($_SESSION['datos']['identificado']) && $_SESSION['datos']['identificado'];
	}

	//VERIFICAR NIVEL DE USUARIO
	public static function isAdmin(){
		return self::myLevel() == self::nivel('ADMIN');
	}

	public static function isUser(){
		return self::myLevel() == self::nivel('USER');
	}

	//DATOS DEL USUARIO
	public static function myID(){
		return isset($_SESSION['datos']['id']) ? $_SESSION['datos']['id'] : false;
	}

	public static function myName(){
		return isset($_SESSION['datos']['nombre']) ? $_SESSION['datos']['nombre'] : false;
	}

	public static function myLevel(){
		return isset($_SESSION['datos']['nivel']) ? $_SESSION['datos']['nivel'] : false;
	}

	public static function myDNI(){
		return isset($_SESSION['datos']['dni']) ? $_SESSION['datos']['dni'] : false;	
	}

	public static function myIP(){
		return isset($_SESSION['datos']['ip']) ? $_SESSION['datos']['ip'] : false;		
	}

	public static function myMAC(){
		return isset($_SESSION['datos']['mac']) ? $_SESSION['datos']['mac'] : false;		
	}

	public static function myHost(){
		return isset($_SESSION['datos']['host']) ? $_SESSION['datos']['host'] : false;		
	}	

	public static function myWindowsUser(){
		return isset($_SESSION['datos']['windowsuser']) ? $_SESSION['datos']['windowsuser'] : false;		
	}

	public static function getUserData(){
		exec("C:\Python\python.exe ../../clases/ip.py", $output);
		return json_decode($output[0], true);
	}

	public static function debug($data){
		if (is_array($data)){
			echo '<pre>';
			print_r($data);
			echo '</pre>';
		}
		else{
			var_dump($data);
		}
	}

	//VERIFICA CLAVE DE ACCESO
	public static function checkPass($id, $pass){
		$results = Consultas::select([
			'fields' => 'usu_password',
			'table' => 'tbl_usuarios',
			'conditions' => "WHERE usu_id = $id"
		]);

		if ($results->num_rows){
			$row = $results->fetch_assoc();
			return password_verify(mb_strtoupper($pass), $row['usu_password']);
		}

		return false;
	}

	//VERIFICA CLAVE PARA ELIMINAR/INHABILITAR REGISTROS
	public static function checkPassDelete($pass){
		$results = Consultas::select([
			'fields' => 'con_deletepass',
			'table' => 'tbl_configuracion'
		]);

		if ($results->num_rows){
			$row = $results->fetch_assoc();
			return password_verify(mb_strtoupper($pass), $row['con_deletepass']);
		}
		return false;
	}

	public static function encrypt($pass){
		return password_hash(mb_strtoupper($pass), PASSWORD_DEFAULT);
	}

	//CONVERTIR DATOS NULOS EN CADENAS VACÍAS
	public static function noNull($data){
		return array_map(function($val){
			return is_null($val) ? '' : $val;
		}, $data);
	}

	//VALIDACIÓN DE DATOS
	public static function validate($dato, $tipo, $min = 0, $max = 10){
		if (is_array($dato)){
			for ($i = 0, $l = count($dato), $flag = true; $i < $l; $i++){
				if (self::validate($dato[$i]) === false){
					return false;
				}
			}
		}

		switch (mb_strtoupper($tipo)){
		    //Cualquier caracter
		    case 'ALL':
				$length = strlen($dato);
				return preg_match('|.*|is', $dato) === 1 && $length >= $min && $length <= $max ? true : false;
				break;
		    
			//Cadenas de texto
			case 'STRING':
				$length = strlen($dato);
				return preg_match('|^[A-Za-záéíóúÁÉÍÓÚÑñÜü\¿\?\¡\!0-9\s\.\,\;\:\|\-\#\'\"\°\*\_\+\(\)\[\]\{\}\/\@\n\r]*$|is', $dato) === 1 && $length >= $min && $length <= $max ? true : false;
				break;

			//Valores numéricos
			case 'NUMBER':
				$length = is_numeric($dato) ? floor(log10($dato + 0) + 1) : strlen($dato);
				return preg_match('|^[0-9\.\n\r]*$|is', $dato) === 1 && $length >= $min && $length <= $max ? true : false;
				break;

			//Número de teléfono
			case 'PHONE':
				$length = is_numeric($dato) ? floor(log10($dato + 0) + 1) : strlen($dato);
				return preg_match('|^[0-9\n\r]*$|is', $dato) === 1 && $length >= $min && $length <= $max ? true : false;
				break;

			//Código de predio
			case 'CODE':
				$length = strlen($dato);
				return preg_match('|^[0-9]{2}\-[0-9]{2}\-[0-9]{4}\-[0-9]{3}$|is', $dato) === 1 && $length >= $min && $length <= $max ? true : false;
				break;


			//Coordenadas
			case 'COORDS':
				$length = strlen($dato);
				return preg_match('|^[0-9\.\-\,\s\n\r]*$|is', $dato) === 1 && $length >= $min && $length <= $max ? true : false;
				break;

			//Correo electrónico
			case 'EMAIL':
				$length = strlen($dato);
				return filter_var($dato, FILTER_VALIDATE_EMAIL) && $length >= $min && $length <= $max;
				break;

			default:
				return false;
				break;
		}
	}

	public static function estados(){
		return [
			1 => 'Habilitado',
			2 => 'Inhabilitado'
		];
	}

	public static function boolean(){
		return [
			1 => 'Sí',
			2 => 'No'
		];
	}

	//OFICINAS REGISTRALES (SERVICIO DE SUNARP)
	public static function oficinas(){
		$data = self::getServiceByName([
			'fields' => 'b.gen_user AS user, b.gen_pass AS pass',
			'name' => 'SUNARP'
		]);

		if (!$data){
			echo json_encode([
				'estado' => 'error',
				'mensaje' => 'El servicio no se encuentra disponible por el momento'
			]);
			exit;
		}

		$results = self::consumir([
			'url' => 'https://ws5.pide.gob.pe/Rest/APide/Sunarp/WSServicegetOficinas',
			'method' => 'GET',
			'data' => [
				'usuario' => $data['user'],
				'clave' => $data['pass'],
				'out' => 'json'
			]
		]);
		$state = $results && isset($results['oficina']['oficina']);

		//SI SE OBTUVO EL LISTADO DE OFICINAS REGISTRALES DEL SERVICIO
		if ($state){
			//SE REESTRUCTURA EL LISTADO CON LAS CLAVES DE ZONA, OFICINA Y CIUDAD
			$oficinas = array_map(function ($oficina){
				return [
					'zona' => $oficina['codZona'],
					'oficina' => $oficina['codOficina'],
					'ciudad' => $oficina['descripcion']
				];
			}, $results['oficina']['oficina']);
		}
		//CASO CONTRARIO
		else{
			//SE ESTRUCTURA EL LISTADO CON LOS DATOS ADJUNTOS EN EL CONTRATO
			$oficinas = [
				['zona' => '01', 'oficina' => '01', 'ciudad' => 'LIMA'],
				['zona' => '01', 'oficina' => '02', 'ciudad' => 'CALLAO'],
				['zona' => '01', 'oficina' => '03', 'ciudad' => 'HUARAL'],
				['zona' => '01', 'oficina' => '04', 'ciudad' => 'HUACHO'],
				['zona' => '01', 'oficina' => '05', 'ciudad' => 'CAÑETE'],
				['zona' => '01', 'oficina' => '06', 'ciudad' => 'BARRANCA'],

				['zona' => '02', 'oficina' => '01', 'ciudad' => 'HUANCAYO'],
				['zona' => '02', 'oficina' => '02', 'ciudad' => 'HUÁNUCO'],
				['zona' => '02', 'oficina' => '04', 'ciudad' => 'PASCO'],
				['zona' => '02', 'oficina' => '05', 'ciudad' => 'SATIPO'],
				['zona' => '02', 'oficina' => '06', 'ciudad' => 'LA MERCED'],
				['zona' => '02', 'oficina' => '07', 'ciudad' => 'TARMA'],
				['zona' => '02', 'oficina' => '08', 'ciudad' => 'TINGO MARÍA'],
				['zona' => '02', 'oficina' => '09', 'ciudad' => 'HUANCAVELICA'],

				['zona' => '03', 'oficina' => '01', 'ciudad' => 'AREQUIPA'],
				['zona' => '03', 'oficina' => '02', 'ciudad' => 'CAMANÁ'],
				['zona' => '03', 'oficina' => '03', 'ciudad' => 'CASTILLA-APLAO'],
				['zona' => '03', 'oficina' => '04', 'ciudad' => 'ISLAY-MOLLENDO'],

				['zona' => '04', 'oficina' => '01', 'ciudad' => 'HUARAZ'],
				['zona' => '04', 'oficina' => '02', 'ciudad' => 'CASMA'],
				['zona' => '04', 'oficina' => '03', 'ciudad' => 'CHIMBOTE'],

				['zona' => '05', 'oficina' => '01', 'ciudad' => 'PIURA'],
				['zona' => '05', 'oficina' => '02', 'ciudad' => 'SULLANA'],
				['zona' => '05', 'oficina' => '03', 'ciudad' => 'TUMBES'],

				['zona' => '06', 'oficina' => '01', 'ciudad' => 'CUSCO'],
				['zona' => '06', 'oficina' => '02', 'ciudad' => 'ABANCAY'],
				['zona' => '06', 'oficina' => '03', 'ciudad' => 'MADRE DE DIOS'],
				['zona' => '06', 'oficina' => '04', 'ciudad' => 'QUILLABAMBA'],
				['zona' => '06', 'oficina' => '05', 'ciudad' => 'SICUANI'],
				['zona' => '06', 'oficina' => '06', 'ciudad' => 'ESPINAR'],
				['zona' => '06', 'oficina' => '07', 'ciudad' => 'ANDAHUAYLAS'],

				['zona' => '07', 'oficina' => '01', 'ciudad' => 'TACNA'],
				['zona' => '07', 'oficina' => '03', 'ciudad' => 'ILO'],
				['zona' => '07', 'oficina' => '03', 'ciudad' => 'JULIACA'],
				['zona' => '07', 'oficina' => '04', 'ciudad' => 'MOQUEGUA'],
				['zona' => '07', 'oficina' => '05', 'ciudad' => 'PUNO'],

				['zona' => '08', 'oficina' => '01', 'ciudad' => 'TRUJILLO'],
				['zona' => '08', 'oficina' => '02', 'ciudad' => 'CHEPÉN'],
				['zona' => '08', 'oficina' => '03', 'ciudad' => 'HUAMACHUCO'],
				['zona' => '08', 'oficina' => '04', 'ciudad' => 'OTUZCO'],
				['zona' => '08', 'oficina' => '05', 'ciudad' => 'SAN PEDRO'],

				['zona' => '09', 'oficina' => '01', 'ciudad' => 'MAYNAS'],

				['zona' => '10', 'oficina' => '01', 'ciudad' => 'ICA'],
				['zona' => '10', 'oficina' => '02', 'ciudad' => 'CHINCHA'],
				['zona' => '10', 'oficina' => '03', 'ciudad' => 'PISCO'],
				['zona' => '10', 'oficina' => '04', 'ciudad' => 'NAZCA'],		

				['zona' => '11', 'oficina' => '01', 'ciudad' => 'CHICLAYO'],
				['zona' => '11', 'oficina' => '02', 'ciudad' => 'CAJAMARCA'],
				['zona' => '11', 'oficina' => '03', 'ciudad' => 'JAÉN'],
				['zona' => '11', 'oficina' => '04', 'ciudad' => 'BAGUA'],
				['zona' => '11', 'oficina' => '05', 'ciudad' => 'CHACHAPOYAS'],
				['zona' => '11', 'oficina' => '06', 'ciudad' => 'CHOTA'],

				['zona' => '12', 'oficina' => '01', 'ciudad' => 'MOYOBAMBA'],
				['zona' => '12', 'oficina' => '02', 'ciudad' => 'TARAPOTO'],
				['zona' => '12', 'oficina' => '03', 'ciudad' => 'JUANJUI'],
				['zona' => '12', 'oficina' => '04', 'ciudad' => 'YURIMAGUAS'],

				['zona' => '13', 'oficina' => '01', 'ciudad' => 'PUCALLPA'],

				['zona' => '14', 'oficina' => '01', 'ciudad' => 'AYACUCHO'],
				['zona' => '14', 'oficina' => '02', 'ciudad' => 'HUANTA']
			];
		}	

		//SE ORDENAN LAS OFICINAS
		usort($oficinas, [self::class, 'sortOffices']);

		return $oficinas;
	}

	//ORDENAR ALFABÉTICAMENTE EL LISTADO DE OFICINAS REGISTRALES
	public static function sortOffices($actual, $next){
		return $actual['ciudad'] <=> $next['ciudad'];
	}

	//ENCONTRAR UNA OFICINA REGISTRAL
	public static function getOficina($nameOffice, $tipo, $zona = false){
		$oficinas = self::oficinas();
		foreach ($oficinas as $oficina){
			if ($tipo == 'ciudad'){
				if (strcasecmp($oficina['ciudad'], $nameOffice) === 0){
					return $oficina;
				}
			}

			if ($tipo == 'oficina'){
				if ($oficina['zona'] == $zona && $oficina['oficina'] == $nameOffice){
					return $oficina['ciudad'];
				}
			}
		}

		return false;
	}

	//TIPOS DE PARTIDA REGISTRAL
	public static function tiposPartida(){
		return [
			'21000' => 'Predial',
			/*'22000' => 'Persona jurídica',
			'23000' => 'Persona natural',*/
			'24000' => 'Vehicular'
		];
	}

	//BUSCAR EL TIPO DE PARTIDA
	public static function getTipoPartida($key){
		return self::tiposPartida()[$key];
	}

	//FORMATO DE FECHA
	public static function formatoDatetime($fecha){
		return implode('/', array_reverse(explode('-', $fecha)));
	}

	//AÑADIR MARCA DE TIEMPO A LAS HOJAS DE ESTILOS Y SCRIPTS
	public static function getTimestamp(){
		return str_replace('.', '', microtime(true));
	}

	//VERIFICAR SI HAY UNA CONEXIÓN A INTERNET
	public static function checkInternet(){
		return (bool) @fopen('https://www.google.com', 'r');
	}

	//CABECERA
	public static function head($extra = []){
?>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<title>PIDE - Sistema de Consulta de Datos</title>
<?php
	$timestamp = self::getTimestamp();

	if (self::checkInternet()){
?>		
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css2?family=Catamaran:wght@400&display=swap">		
		<link rel="stylesheet" type="text/css" href="../../../css/import.css?timestamp=<?=$timestamp?>">		
<?php
	}
	else{
?>
		<link rel="stylesheet" type="text/css" href="../../../css/localFonts.css?timestamp=<?=$timestamp?>">
		<link rel="stylesheet" type="text/css" href="../../../fonts/catamaran.css?timestamp=<?=$timestamp?>">
<?php		
	}
?>		
		<link rel="preload" as="image" href="../../../img/online.png">
		<link rel="preload" as="image" href="../../../img/offline.png">
		<link rel="preload" as="image" href="../../../img/light.png">
		<link rel="preload" as="image" href="../../../img/dark.png">
		<link rel="preload" as="image" href="../../../img/forbidden.png">
		<link rel="preload" as="image" href="../../../img/clock.png">
		<link rel="preload" as="image" href="../../../img/editar.ico">
		<link rel="preload" as="image" href="../../../img/borrar.ico">
		<link rel="preload" as="image" href="../../../img/eliminar.ico">
		<link rel="preload" as="image" href="../../../img/search.ico">
		<link rel="preload" as="image" href="../../../img/wait.gif">
		<link rel="icon" type="image/ico" href="../../../img/logo.ico" />
<?php
		echo implode('', $extra);
?>		
<?php		
	}

	//PIE DE PÁGINA
	public static function footer($extra = []){
		$timestamp = self::getTimestamp();
?>
		<script type="text/javascript" src="../../../js/ajax.js?timestamp=<?=$timestamp?>"></script>		
		<script type="text/javascript" src="../../../js/modal.js?timestamp=<?=$timestamp?>"></script>
		<script type="text/javascript" src="../../../js/confirm.js?timestamp=<?=$timestamp?>"></script>
		<script type="text/javascript" src="../../../js/prompt.js?timestamp=<?=$timestamp?>"></script>
		<script type="text/javascript" src="../../../js/notification.js?timestamp=<?=$timestamp?>"></script>
		<script type="text/javascript" src="../../../js/menu.js?timestamp=<?=$timestamp?>"></script>
		<script type="text/javascript" src="../../../js/base.js?timestamp=<?=$timestamp?>"></script>
		<script type="text/javascript" src="../../../js/check.js?timestamp=<?=$timestamp?>"></script>			
		<script type="text/javascript" src="../../../js/up.js?timestamp=<?=$timestamp?>"></script>
<?php		
		echo implode('', $extra);
	}

	//MENÚ
	public static function menu(){
?>
		<span id="open" title="Abrir el menú de opciones">≡</span>
		<nav id="menu">
			<ul>
				<span id="indicator"></span>
				<li class="closeButton" title="Cerrar el menú de opciones">
					<span id="close">x</span>
				</li>
				<li data-url="../servicios" title="Ir a la vista de servicios de la PIDE">
					<span>📨</span>
					Servicios
				</li>						
				<li data-open="../../../docs/mdp-gat-apppide-manual.pdf" class="hide">
					<span>📖</span>
					Manual de usuario
				</li>
<?php
			if (self::isAdmin()){
?>
				<li data-url="../usuarios" title="Ir a la vista de usuarios">
					<span>💻</span>
					Usuarios
				</li>
				<li data-url="../niveles" title="Ir a la vista de niveles de usuarios">
					<span>📶</span>
					Niveles
				</li>					
				<li data-url="../configuracion" title="Ir a la vista de configuración del sistema">
					<span>✏</span>
					Configuración
				</li>
				<li data-url="../control" title="Ir a la vista de control de acciones">
					<span>🔑</span>
					Control
				</li>
<?php
			}
?>
				<li id="salir" data-link="../acceso" title="Cerrar la sesión actual">
					<span>📴</span>
					Salir
				</li>
			</ul>
		</nav>
		<img src="../../../img/dark.png" id="themeBtn" title="Cambiar al tema oscuro" />
<?php
	}
}
?>