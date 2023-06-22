"use strict";

let Servicios = {
	init: _ => {
		//RECORDATORIO SOBRE LA RESPONSABILIDAD QUE SE DEBE TENER AL MOMENTO DE USAR LOS SERVICIOS
		Modal.show({
			text: "<h1>⚠ IMPORTANTE ⚠</h1> <p>Se le recuerda que el uso de los servicios de la PIDE se monitorea tanto desde la oficina de informática de nuestra institución como desde la Secretaría de Gobierno y Transformación Digital. Un uso indebido puede acarrear sanciones para Ud.</p> <p>Por favor, utilice este sistema de forma responsable.</p>", 
			onShow: _ => Base.changeElementsTheme(),
			css: {
				front: {
					backgroundColor: Base.localTheme.dark ? "#15202B" : "",
					textAlign: "center",
					border: Base.localTheme.dark ? ".1rem solid #FFFFEF" : "",
					borderRadius: "1rem"
				},
				close: {
					color: Base.localTheme.dark ? "#FFFFEF" : ""
				}
			}
		});

		//SE ESTABLECE EL CONTENEDOR DE LOS BLOQUES DE LOS SERVICIOS
		Servicios.output = document.querySelector("#servicios");

		//SE ESTABLECE EL FORMULARIO DE BÚSQUEDA
		Servicios.form = document.querySelector("#search");

		//SE MUESTRAN LOS BLOQUES DE LOS SERVICIOS
		Servicios.loadServices();		

		//CONTROL DE EVENTOS
		Servicios.events();
	},

	events: _ => {
		//CUANDO SE REALICE UNA BÚSQUEDA
		Servicios.form.addEventListener("change", e => e.target.tagName == "SELECT" && Servicios.loadServices(), false);
		Servicios.form.addEventListener("input", e => e.target.tagName == "INPUT" && Servicios.loadServices(), false);

		//CONTROL DEL ENVÍO DE DATOS DEL FORMULARIO DE EDICIÓN DE SERVICIOS
		document.addEventListener("submit", e => {
			e.preventDefault();
			const elem = e.target;
			elem.classList.contains("mantenimiento") && Servicios.check.call(elem) && Servicios.save(elem);
		}, false);

		//CONTROL DE CLICS
		document.addEventListener("click", e => {
			const elem = e.target, parent = Base.getParent(elem, "servicio");
			let tipo;

			//SI SE PULSA EL BOTÓN DE ELIMINACIÓN DEL LOGO
			if (elem.classList.contains("del") && elem.dataset.logo.length && elem.parentNode.querySelector(".preview")){
				Confirm.go({
					pregunta: "¿Realmente desea eliminar este logo?", 
					callback: _ => Servicios.deleteLogo(elem),
					content: {
						front: {
							backgroundColor: Base.localTheme.dark ? "#15202B" : "",
							border: Base.localTheme.dark ? ".1rem solid #FFFFEF" : "",
							borderRadius: "1rem"
						},
						question: {
							color: Base.localTheme.dark ? "#FFFFEF" : ""
						}
					}
				});
			}

			//SI SE PULSA EL BOTÓN DE BÚSQUEDA DE DATOS DE UN SERVICIO
			if (elem.classList.contains("search")){
				//SE DETIENE EL PROCESAMIENTO NORMAL DE DATOS DEL FORMULARIO
				e.preventDefault();

				//SI HAY CONEXIÓN A INTERNET
				if (navigator.onLine){
					//SI NO SE HAN LLENADO LOS CAMPOS OBLIGATORIOS, SE CANCELA LA PETICIÓN
					if (!Servicios.check.call(Base.getParent(elem, "form"))){
						return false;
					}

					//SI SE ESTÁ REALIZANDO UNA BÚSQUEDA DE PARTIDAS REGISTRALES (SERVICIO DE SUNARP), SE LE PIDE AL USUARIO QUE SEA PACIENTE
					document.querySelector("#busquedaSUNARP")?.value < 4 && Notification.msg("Por favor, sea paciente");

					//SI EL SERVICIO ASOCIADO AL BOTÓN DE BÚSQUEDA EXISTE, SE CONSUME
					elem.dataset?.rest in Servicios && Servicios[elem.dataset.rest](Servicios.getParams(Base.getParent(elem, "form")));
				}
				//CASO CONTRARIO
				else{
					//SE LE AVISA AL USUARIO QUE NO PUEDE REALIZAR LA BÚSQUEDA HASTA QUE LA CONEXIÓN SE RESTABLEZCA
					Notification.msg({
						text: "<img src='../../../img/offline.png' class='notificationImg' /> En este momento, su conexión a internet no está funcionando. Espere a que se restablezca para continuar.",
						time: 5000
					});
				}				

				//SE PREVIENE LA DISEMINACIÓN DEL EVENTO
				e.stopImmediatePropagation();
			}

			//SI SE PULSA EL BOTÓN PARA MOSTRAR EL FORMULARIO DE UN SERVICIO
			if (elem.hasAttribute("data-service") || (parent && !elem.classList.contains("serviceButton"))){
				let url = "";

				if (elem.hasAttribute("data-service")){
					url = elem.dataset.service;
				}
				else if (parent && !elem.classList.contains("serviceButton")){
					url = parent.dataset.service;
				}

				if (!url.length){
					Notification.msg("<img src='../../../img/forbidden.png' class='notificationImg' /> No puedes usar este servicio");
					return;
				}

				Modal.show({
					text: "<img src='../../../img/wait.gif' class='wait' />", 
					url: url, 
					onError: response => Base.sessionClosed(response),
					onShow: _ => {
						//SE LE DA EL ENFOQUE A LA PRIMERA CAJA DE TEXTO DEL FORMULARIO DEL SERVICIO
						const input = document.querySelector("[id^=modalFront] input");
						input && document.activeElement?.tagName != "INPUT" && input.focus();

						//Se aplica el tema establecido
						Base.changeElementsTheme();
					}, 
					css: {
						front: {
							backgroundColor: Base.localTheme.dark ? "#15202B" : "",
							border: Base.localTheme.dark ? ".1rem solid #FFFFEF" : "",
							borderRadius: "1rem",
							textAlign: "left"
						},
						close: {
							color: Base.localTheme.dark ? "#FFFFEF" : ""
						}
					}
				});
			}

			//SI SE PULSA ALGUNO DE LOS BOTONES QUE GENERAN LA VISTA DE LAS PARTIDAS REGISTRALES (SERVICIO DE SUNARP)
			if (elem.classList.contains("verPartida")){
				const 
					form = document.createElement("form"),
					data = elem.dataset.partida.split("&");
				let input, splitPair;

				form.action = `sunarp/partidas.php?timestamp=${new Date().getTime()}`;
				form.method = "post";
				form.target = "_blank";
				form.style.display = "none";

				data.forEach(pair => {
					splitPair = pair.split("=");
					input = document.createElement("input");
					input.type = "hidden";
					input.name = splitPair[0];
					input.value = splitPair[1];
					form.append(input);
				});

				document.body.append(form);
				form.submit();
				form.remove();
			}

			//CREAR SERVICIO
			if (elem.id == "crear"){
				Modal.show({
					text: "<img src='../../../img/wait.gif' class='wait' />", 
					url: elem.dataset.url, 
					onError: response => Base.sessionClosed(response),
					onShow: _ => {
						let input = document.querySelector("[id^=modalFront] input");
						input && document.activeElement?.tagName != "INPUT" && input.focus();

						//Se aplica el tema establecido
						Base.changeElementsTheme();
					}, 
					css: {
						front: {
							backgroundColor: Base.localTheme.dark ? "#15202B" : "",
							border: Base.localTheme.dark ? ".1rem solid #FFFFEF" : "",
							borderRadius: "1rem"
						},
						close: {
							color: Base.localTheme.dark ? "#FFFFEF" : ""
						}
					}
				});
			}

			//EDITAR SERVICIO
			if (elem.hasAttribute("data-edit")){
				Modal.show({
					text: "<img src='../../../img/wait.gif' class='wait' />", 
					url: elem.dataset.edit, 
					onError: response => Base.sessionClosed(response),
					onShow: _ => {
						let input = document.querySelector("[id^=modalFront] input");
						input && document.activeElement?.tagName != "INPUT" && input.focus();

						//Se aplica el tema establecido
						Base.changeElementsTheme();
					}, 
					css: {
						front: {
							backgroundColor: Base.localTheme.dark ? "#15202B" : "",
							border: Base.localTheme.dark ? ".1rem solid #FFFFEF" : "",
							borderRadius: "1rem"
						},
						close: {
							color: Base.localTheme.dark ? "#FFFFEF" : ""
						}
					}
				});
			}

			//INHABILITAR SERVICIO
			if (elem.hasAttribute("data-del")){
				Servicios.checkForDelete(_ => Servicios.delete(elem.dataset.del, 3));
			}

			//ELIMINAR SERVICIO
			if (elem.hasAttribute("data-bor")){
				Servicios.checkForDelete(_ => Servicios.delete(elem.dataset.bor, 4));
			}

			e.stopImmediatePropagation();
		}, false);

		//CONTROL DE CAMBIOS
		document.addEventListener("change", e => {
			const 
				elem = e.target,
				names = ["ser_login", "ser_update", "ser_generalLogin"];
			let timeSelect;

			//SI EL ELEMENTO ES EL COMBO DE REQUERIMIENTO DE CREDENCIALES O DE ACTUALIZACIÓN DE CREDENCIALES
			if (names.indexOf(elem.id) > -1){
				//SE REGISTRAN LAS VARIABLES QUE CONTIENEN LAS REFERENCIAS A LOS ELEMENTOS NECESARIOS

				//COMBO DE ACTUALIZACIÓN DE CREDENCIALES
				timeSelect = document.querySelector("#ser_update"),

				//SECCIÓN DEL COMBO DE ACTUALIZACIÓN DE CREDENCIALES
				timeSelectParent = Base.getParent(timeSelect, "section"),

				//CAMPO DEL TIEMPO DE ACTUALIZACIÓN DE CREDENCIALES
				timeInput = document.querySelector("#ser_updatetime"),

				//SECCIÓN DEL CAMPO DEL TIEMPO DE ACTUALIZACIÓN DE CREDENCIALES
				timeParent = Base.getParent(timeInput, "section"),

				//COMBO DE CREDENCIALES GENERALES
				credentialsSelect = document.querySelector("#ser_generalLogin"),

				//SECCIÓN DEL COMBO DE CREDENCIALES GENERALES
				credentialsParent = Base.getParent(credentialsSelect, "section"),

				//SECCIONES DE LOS CAMPOS DE LAS CREDENCIALES GENERALES
				credentialsInputsParents = document.querySelectorAll(".generalLogin");
			}

			//SI SE CAMBIA EL VALOR DEL COMBO QUE INDICA SI SE REQUIERE CREDENCIALES DE ACCESO
			if (elem.id == "ser_login"){
				//SI EL VALOR ES "SÍ"
				if (elem.value < 2){
					//SE MUESTRA EL COMBO DE OPCIONES DE CREDENCIALES GENERALES
					credentialsParent.classList.replace("hide", "flex");

					//SE MUESTRA EL COMBO DE ACTUALIZACIÓN DE CREDENCIALES
					timeSelectParent.classList.replace("hide", "flex");

					//SI EL VALOR DEL COMBO DE ACTUALIZACIÓN DE CREDENCIALES ES "SÍ"
					if (timeSelect.value < 2){
						//SE MUESTRA EL CAMPO DEL TIEMPO DE ACTUALIZACIÓN DE CREDENCIALES
						timeParent.classList.replace("hide", "flex");

						//Y SE VUELVE SER OBLIGATORIO
						timeInput.required = true;
					}
					//CASO CONTRARIO
					else{
						//SE OCULTA
						timeParent.classList.replace("flex", "hide");

						//Y DEJA DE SER OBLIGATORIO
						timeInput.required = false;
					}

					credentialsInputsParents.forEach(section => {
						//SI EL VALOR DEL COMBO DE CREDENCIALES GENERALES ES "SÍ"
						if (credentialsSelect.value < 2){
							//SE MUESTRAN LOS CAMPOS DE LAS CREDENCIALES GENERALES
							section.classList.replace("hide", "flex");

							//Y SE VUELVEN OBLIGATORIOS
							section.querySelector("input").required = true;
						}
						//CASO CONTRARIO
						else{
							//SE OCULTAN LOS CAMPOS DE LAS CREDENCIALES GENERALES
							section.classList.replace("flex", "hide");

							//Y DEJAN DE SER OBLITARIOS
							section.querySelector("input").required = false;
						}
					});
				}
				//CASO CONTRARIO
				else{
					//SE OCULTA EL COMBO DE ACTUALIZACIÓN DE CREDENCIALES
					timeSelectParent.classList.replace("flex", "hide");

					//SE OCULTA EL COMBO DE CREDENCIALES GENERALES
					credentialsParent.classList.replace("flex", "hide");

					//SE OCULTA EL CAMPO DEL TIEMPO DE ACTUALIZACIÓN DE CREDENCIALES
					timeParent.classList.replace("flex", "hide");

					//Y DEJA DE SER OBLIGATORIO
					timeInput.required = false;

					credentialsInputsParents.forEach(section => {
						//SE OCULTAN LOS CAMPOS DE LAS CREDENCIALES GENERALES
						section.classList.replace("flex", "hide");

						//Y DEJAN DE SER OBLIGATORIOS
						section.querySelector("input").required = false;
					});
				}
			}

			//SI SE CAMBIAR EL VALOR DEL COMBO DE ACTUALIZACIÓN DE CREDENCIALES DEL SERVICIO
			if (elem.id == "ser_update"){
				//SI EL VALOR ELEGIDO ES "SÍ"
				if (elem.value < 2){
					//SE MUESTRA EL CAMPO DEL TIEMPO DE ACTUALIZACIÓN DE CREDENCIALES
					timeParent.classList.replace("hide", "flex");

					//SE VUELVE OBLIGATORIO
					timeInput.required = true;

					//Y SE LE DA EL ENFOQUE
					timeInput.focus();
				}
				//CASO CONTRARIO, SE LOS OCULTA
				else{
					//SE OCULTA EL CAMPO DEL TIEMPO DE ACTUALIZACIÓN DE CREDENCIALES
					timeParent.classList.replace("flex", "hide");	

					//Y DEJA DE SER OBLIGATORIO
					timeInput.required = false;
				}
			}

			//SI SE CAMBIA EL VALOR DEL COMBO DE CREDENCIALES GENERALES
			if (elem.id == "ser_generalLogin"){
				credentialsInputsParents.forEach(section => {
					//SI EL VALOR ES "SÍ"
					if (elem.value < 2){
						//SE MUESTRAN LOS CAMPOS DE CREDENCIALES GENERALES
						section.classList.replace("hide", "flex");

						//Y SE VUELVEN OBLIGATORIOS
						section.querySelector("input").required = true;
					}
					//CASO CONTRARIO
					else{
						//SE OCULTAN LOS CAMPOS DE CREDENCIALES GENERALES
						section.classList.replace("flex", "hide");

						//Y DEJAN DE SER OBLIGATORIOS
						section.querySelector("input").required = false;
					}
				});
			}

			//SI SE CAMBIA EL VALOR DEL COMBO DE TIPO DE DOCUMENTO (SERVICIO DE MPILO)
			if (elem.name == "tipodoc"){
				const inputDato = document.querySelector("[name=nomdoc]");

				switch (elem.value){
					//DNI, RUC Y CARNÉ DE EXTRANJERÍA
					case "D": case "R":
						inputDato.classList.replace("string", "number");
						break;

					//NOMBRES Y APELLIDOS
					case "N":
						inputDato.classList.replace("number", "string");
						break;
				}
			}

			//SI SE CAMBIA EL VALOR DEL COMBO DE TIPO DE BÚSQUEDA (SERVICIO DE SUNARP)
			if (elem.name == "busquedaSUNARP"){
				const 
					clases = [".nombrecontribuyente", ".razonsocial", ".partidaregistral", ".numeroplaca"],
					value = elem.value - 1;

				clases.forEach((clase, i) => {
					//Se mostrarán los bloques que correspondan con la opción elegida y sus elementos serán de llenado obligatorio
					if (i == value){
						document.querySelectorAll(clase).forEach(el => el.classList.remove("hide"));
						document.querySelectorAll(`${clase}:has(input, select, textarea)`).forEach(child => child.required = true);
					}
					//Los bloques restantes se ocultarán y sus elementos no serán de llenado obligatorio
					else{
						document.querySelectorAll(clase).forEach(el => el.classList.add("hide"));
						document.querySelectorAll(`${clase}:has(input, select, textarea)`).forEach(child => child.required = false);
					}
				});

				//Se le da el enfoque a la primera caja de texto disponible
				document.querySelector(`${clases[value]} input:not([type=hidden])`)?.focus();
			}

			//SI SE CAMBIA EL VALOR DEL COMBO DE OFICINAS REGISTRALES (SERVICIO DE SUNARP, BÚSQUEDA POR N° DE PARTIDA)
			if (elem.name == "oficinaregistral"){
				const zona = document.querySelector("[name=zonaregistral]");

				//SI SE ELIGE UNA OFICINA REGISTRAL DE LA LISTA
				zona.value = elem.value.length ? elem.options[elem.selectedIndex].dataset.zona : "";
			}

			//SI SE CAMBIA EL VALOR DEL COMBO DE OFICINAS REGISTRALES (SERVICIO DE SUNARP, BÚSQUEDA POR N° DE PLACA)
			if (elem.name == "placaoficinaregistral"){
				const zona = document.querySelector("[name=placazonaregistral]");

				//SI SE ELIGE UNA OFICINA REGISTRAL DE LA LISTA
				zona.value = elem.value.length ? elem.options[elem.selectedIndex].dataset.zona : "";
			}

			//SE REDIMENSIONA LA VENTANA MODAL
			Modal.resize();
		}, false);

		//SE CARGA MÁS CONTENIDO AL LLEGAR AL FINAL DEL SCROLL VERTICAL
		window.addEventListener("scroll", Servicios.loadAtBottom, false);
	},

	flag: true,

	save: form => {
		if (Servicios.flag && Servicios.check.call(form)){
			//Se muestra una ventana de espera
			const wait = Modal.show({
				text: "<img src='../../../img/wait.gif' class='wait' />",
				media: true
			});

			//Se bloquean todos los elementos del formulario
			Servicios.state.call(form);

			//Se bloquea el comodín
			Servicios.flag = false;

			Ajax({
				url: form.action,
				method: form.method,
				data: form,
				type: "json"
			}).done(response => {
				//Si la sesión se ha cerrado, se cancela la petición
				if (Base.sessionClosed(response)) return;

				//Se oculta la ventana de espera
				Modal.hide(wait);

				if (response.estado == "ok"){
					//Se ocultan todas las ventanas modales
					Modal.hideAll();
				}

				//Se muestra el mensaje indicando el resultado de la operación
				Notification.msg({
					text: response.mensaje, 
					time: response.tiempo || false
				});

				Servicios.loadServices(); //Se recarga el listado de servicios
				Servicios.flag = true; //Se reactiva el comodín para procesar los datos
				Servicios.state.call(form); //Se desbloquean todos los elementos del formulario
			}).fail(error => {
				Servicios.flag = true; //Se reactiva el comodín para procesar los datos
				Servicios.state.call(form); //Se desbloquean todos los elementos del formulario
				Modal.hide(wait); //Se oculta la ventana de espera
				Notification.msg(error); //Se muestra el mensaje de error
			});
		}
	},

	check: function(){
		for (let i = 0, f = this.elements, l = f.length; i < l; i++){
			if (f[i].required && !f[i].value.length){
				f[i].classList.add("required");
				Notification.msg({
					text: "⚠️ Tiene que completar todos los campos requeridos",
					onHide: _ => {
						f[i].classList.remove("required");
						f[i].focus();
					}
				});
				return false;
			}

			if (f[i].required && "minLength" in f[i] && f[i].minLength > 0 && f[i].value.length < f[i].minLength){
				const 
					underscorePos = f[i].name.indexOf("_"),
					fieldName = f[i].name.substr(underscorePos > -1 ? underscorePos + 1 : 0),
					minLength = f[i].minLength;

				f[i].classList.add("required");
				Notification.msg({
					text: `⚠️ El texto del campo señalado no puede ser menor a ${minLength} caracteres`,
					onHide: _ => {
						f[i].classList.remove("required");
						f[i].focus();
					}
				});
				return false;
			}

			if (f[i].required && "maxLength" in f[i] && f[i].maxLength > 0 && f[i].value.length > f[i].maxLength){
				const 
					fieldName = f[i].name.substr(f[i].name.indexOf("_") ? f[i].name.indexOf("_") + 1 : 0),
					maxLength = f[i].maxLength;

				f[i].classList.add("required");
				Notification.msg({
					text: `⚠️ El texto del campo señalado no puede ser mayor a ${maxLength} caracteres`,
					onHide: _ => {
						f[i].classList.remove("required");
						f[i].focus();
					}
				});
				return false;
			}
		}

		return true;
	},

	state: function(){
		const 
			self = this && "tagName" in this && this.tagName == "FORM" ? this : document.querySelector("form"),
			elems = ["INPUT", "SELECT", "TEXTAREA"];

		self.querySelectorAll("*").forEach(elem => {
			if (elems.indexOf(elem.tagName) > -1){
				elem.disabled = !elem.disabled;
			}
			else{
				elem.classList.toggle("disabled");
			}
		});
	},

	scrollFlag: true,
	base: 0,

	loadAtBottom: _ => {
		if (Servicios.scrollFlag){
			if (window.innerHeight + window.scrollY >= document.documentElement.scrollHeight){
				//SE DESHABILITA LA CARGA
				Servicios.scrollFlag = false;

				//SE SUMA 50 UNIDADES A LA BASE PARA MOSTRAR LOS SIGUIENTES 50 SERVICIOS
				Servicios.base += 50;

				//SE MUESTRA EL GIF DE CARGA
				document.body.insertAdjacentHTML("beforeend", "<img src='../../../img/wait.gif' class='wait' />");

				//SI LOS CAMPOS DE BÚSQUEDA HAN SIDO LLENADOS APROPIADAMENTE, SE REALIZA LA BÚSQUEDA
				if (Servicios.check.call(Servicios.form)){
					Ajax({
						url: "lista.php",
						data: Ajax.serialize(Servicios.form) + `&base=${Servicios.base}`
					}).done(response => {
						if (Base.sessionClosed(response)) return;

						//SE RETIRA EL GIF DE CARGA
						Servicios.deleteWait();

						//SE MUESTRAN LOS BLOQUES DE LOS SERVICIOS
						if (response.length){
							Servicios.output.innerHTML += response;
						}

						//SE VUELVE A HABILITAR LA CARGA
						setTimeout(_=> Servicios.scrollFlag = true, 1000);
					}).fail(error => Notification.msg(error));
				}
			}
		}
	},

	loadServices: _ => {
		//SE RESTABLECE LA BASE DE REGISTROS A MOSTRAR
		Servicios.base = 0;

		//SE MUESTRA EL GIF DE CARGA
		document.body.insertAdjacentHTML("beforeend", "<img src='../../../img/wait.gif' class='wait' />");

		//SI LOS CAMPOS DE BÚSQUEDA HAN SIDO LLENADOS APROPIADAMENTE, SE REALIZA LA BÚSQUEDA
		if (Servicios.check.call(Servicios.form)){
			Ajax({
				url: "lista.php",
				data: Servicios.form
			}).done(response => {
				if (Base.sessionClosed(response)) return;

				//SE RETIRA EL GIF DE CARGA
				Servicios.deleteWait();

				//SE MUESTRAN LOS BLOQUES DE LOS SERVICIOS
				Servicios.output.innerHTML = response;
			}).fail(error => Notification.msg(error));	
		}
	},

	checkForDelete: callback => {
		Prompt.go({
			mensaje: "Ingrese la clave para eliminar/inhabilitar:", 
			inputType: "password", 
			callback: pass => {
				Ajax({
					url: "../configuracion/checkPass.php",
					data: {
						pass: pass
					},
					type: "json"
				}).done(response => {
					if (Base.sessionClosed(response)) return;
					
					if (response.estado == "ok"){
						callback();
					}
					else{
						Notification.msg({
							text: "🔐 La clave ingresada es incorrecta", 
							onShow: _ => Servicios.checkForDelete(callback), 
							time: 1000
						});
					}
				}).fail(error => Notification.msg(error));
			},
			content: {
				front: {
					backgroundColor: Base.localTheme.dark ? "#15202B" : "",
					border: Base.localTheme.dark ? ".1rem solid #FFFFEF" : "",
					borderRadius: "1rem"
				},
				label: {
					color: Base.localTheme.dark ? "#FFFFEF" : ""
				},
				input: {
					borderBottom: Base.localTheme.dark ? ".1rem solid #FFFFEF" : "",
					color: Base.localTheme.dark ? "#FFFFEF" : ""
				}
			}
		});	
	},

	delete: (id, tipo) => {
		Confirm.go({
			pregunta: `¿Realmente desea ${tipo == 3 ? "inhabilitar" : "eliminar"} este registro?`, 
			callback: _ => {
				Ajax({
					url: "procesar.php",
					method: "post",
					data: {
						id: id,
						tipo: tipo
					},
					type: "json",
				}).done(response => {
					if (Base.sessionClosed(response)) return;

					if (response.estado == "ok"){
						Notification.msg(response.mensaje);
						Servicios.loadServices();
					}
				}).fail(error => Notification.msg({text: error, background: true}));
			},
			content: {
				front: {
					backgroundColor: Base.localTheme.dark ? "#15202B" : "",
					border: Base.localTheme.dark ? ".1rem solid #FFFFEF" : "",
					borderRadius: "1rem"
				},
				question: {
					color: Base.localTheme.dark ? "#FFFFEF" : ""
				}
			}
		});
	},

	deleteLogo: btn => {
		const output = btn.parentNode.querySelector(".preview");

		Ajax({
			url: "procesar.php",
			method: "post",
			data: {
				id: btn.dataset.logo,
				tipo: 5
			},
			type: "json"
		}).done(response => {
			if (Base.sessionClosed(response)) return;

			if (response.estado == "ok"){
				output.src = "../../../img/servicios/default.png";
				output.title = "Logo por defecto";
				btn.dataset.logo = "";
				Notification.msg(response.mensaje);
				Servicios.loadServices();
			}
		}).fail(error => Notification.msg(error));
	},

	loading: _ => Servicios.output.innerHTML = "<img src='../../../img/wait.gif' class='wait' />",

	deleteWait: _ => document.querySelectorAll(".wait").forEach(wait => wait.remove()),

	getParams: form => {
		const data = {};

		form.elements.forEach(elem => {
			if (elem.hasAttribute("data-rest") && elem.name.length){
				data[elem.name] = elem.value;
			}
		});

		return data;
	},

	processSearch: (url, params, callback) => {
		const results = document.querySelector("#results");
		results.innerHTML = "<img src='../../../img/wait.gif' class='wait' />";
		
		Ajax({
			url: url,
			method: "post",
			data: params,
			type: "json"
		}).done(serviceResponse => {
			//Si la sesión se ha cerrado, se cancela la petición
			if (Base.sessionClosed(serviceResponse)) return;

			//SI NO HUBO ERRORES
			if (serviceResponse.estado == "ok"){
				//SE EJECUTA LA LLAMADA DE RETORNO
				Notification.msg("🔎 La búsqueda ha terminado");
				callback && Base.isFunction(callback) && callback(serviceResponse);
			}
			//SI HUBO ALGÚN ERROR
			else{
				//SE NOTIFICA AL USUARIO QUE HA OCURRIDO UN ERROR
				if ("response" in serviceResponse){
					Notification.msg("🔎 La búsqueda ha terminado");			
					Servicios.addData(`<h3 class='${Base.localTheme.dark ? "darkText" : ""}'>${serviceResponse.response}</h3>`);
				}
				else if ("mensaje" in serviceResponse){
					results.innerHTML = "";
					Notification.msg(serviceResponse.mensaje);
				}
				else{
					results.innerHTML = "";
					Notification.msg("✖️ Se produjo un error. Contacte a soporte técnico.");
				}

				//SE REDIMENSIONA LA VENTANA MODAL
				Modal.resize();
			}
		}).fail(error => {
			Notification.msg(error);
			results.innerHTML = "";
		});
	},

	dateFormat: date => {
		const 
			year = date.substring(0, 4),
			month = date.substring(4, 6),
			day = date.substring(6);		

		return `${day}/${month}/${year}`;
	},

	sortOffices: _ => {
		const options = document.querySelectorAll("[name=oficinaregistral] option"),
			temp = [];

		for (const i = 1, l = options.length; i < l; i++){
			temp.push({
				value: options[i].value, 
				text: options[i].text, 
				data: options[i].dataset.zona
			});
		}

		temp.sort((a, b) => a.text > b.text ? 1 : (a.text < b.text ? -1 : 0));

		for (const i = 1, l = options.length; i < l; i++){
			options[i].value = temp[i - 1].value;
			options[i].text = temp[i - 1].text;
			options[i].dataset.zona = temp[i - 1].data;
		}
	},

	addData: data => {
		const output = document.querySelector("#results");

		//Se limpia el contenido anterior
		output.innerHTML = "";

		//Se muestra el título
		output.insertAdjacentHTML("beforeend", "<h2>RESULTADOS DE LA BÚSQUEDA:</h2>");

		if (Base.isObject(data)){
			for (const attr in data){
				output.insertAdjacentHTML("beforeend", `<p class='rest'><b>${attr}:</b> ${data[attr]}</p>`);
			}
		}
		else if (Base.isArray(data)){
			data.forEach((obj, index) => {
				if (Base.isObject(obj)){
					for (const attr in obj){
						output.insertAdjacentHTML("beforeend", `<p class='rest'><b>${attr}:</b> ${obj[attr]}</p>`);	
					}
				}
				else{
					output.insertAdjacentHTML("beforeend", obj);
				}

				if (index < data.length - 1){
					output.insertAdjacentHTML("beforeend", "<hr />");
				}
			});
		}
		else{
			output.insertAdjacentHTML("beforeend", data);
		}

		//SE APLICA EL TEMA OSCURO EN CASO HAYA SIDO SELECCIONADO
		Base.localTheme.dark && [...output.querySelectorAll("*")].forEach(elem => elem.classList.add("darkText"));

		//SE REDIMENSIONA LA VENTANA MODAL
		Modal.resize();
	},

	/**********************************************************
	 AÑADIR TODOS LOS SCRIPTS CORRESPONDIENTES A CADA SERVICIO
	**********************************************************/

	essalud: params => Servicios.processSearch("essalud/check.php", params, data => {
		const response = data.response, responseData = [];

		if (Base.isArray(response)){
			response.forEach(obj => {
				responseData.push({
					"N° de DNI": obj["nu_doc"],
					"Centro de adscripción del asegurado": obj["ce_ads"],
					"Fecha de inicio de vigencia": Servicios.dateFormat(obj["in_vig"]),
					"Fecha de finalización de vigencia": Servicios.dateFormat(obj["fi_vig"])
				});
			});
		}
		else{
			responseData.push({
				"N° de DNI": response["nu_doc"],
				"Centro de adscripción del asegurado": response["ce_ads"],
				"Fecha de inicio de vigencia": Servicios.dateFormat(response["in_vig"]),
				"Fecha de finalización de vigencia": Servicios.dateFormat(response["fi_vig"])
			});
		}

		Servicios.addData(responseData);
	}),

	reniec: params => Servicios.processSearch("reniec/check.php", params, response => {

	}),

	sunarp: params => Servicios.processSearch("sunarp/check.php", params, data => {
		const response = data.response;
		let output = document.querySelector("#results"), datos = [], temp;

		switch (parseInt(params.busquedaSUNARP)){
			case 1: case 2: //SI LA BÚSQUEDA FUE POR EL NOMBRE DEL CONTRIBUYENTE O RAZÓN SOCIAL
				//SE RECORRE EL CONJUNTO DE RESULTADOS
				response.forEach(dominio => {
					//SE ESTABLECE EL ARREGLO QUE ALBERGARÁ LAS PARTIDAS
					let partidas;

					//SE RECORRE EL CONJUNTO DE IMÁGENES DE LA PARTIDA DE LA ITERACIÓN ACTUAL
					if (dominio["img"].length){
						partidas = `<span class="verPartida" title="Ver partida registral" style="display: inline-block;" data-partida="nropartida=${dominio["partida"]}&img[]=${dominio['img'].join('&img[]=')}">Ver partida</span>`;
					}

					//SE GENERA EL CONJUNTO DE DATOS A MOSTRAR
					temp = {
						"Tipo de registro": dominio["tipoRegistro"],
						"Libro al que pertenece": dominio["libro"],
						"Nombre del titular/Razón social": `${dominio["titular"]}`,
						"Tipo de documento": dominio["tipDoc"],
						"N° de documento": dominio["numDoc"] || "-",
						"N° de partida": dominio["partida"],
						"Estado de la partida": dominio["estado"] || "-"
					};

					//SE AÑADE LA DIRECCIÓN FISCAL O N° DE PLACA, SEGÚN CORRESPONDA
					if ("direccion" in dominio) temp["Dirección de la propiedad"] = dominio["direccion"];
					if ("placa" in dominio) temp["N° de placa"] = dominio["placa"];

					//SE AÑADEN LA ZONA Y OFICINA REGISTRAL
					temp["Zona registral"] = dominio["zona"];
					temp["Oficina registral"] = dominio["oficina"];

					//SE AÑADE EL CONJUNTO DE IMÁGENES DE LA PARTIDA DE LA ITERACIÓN ACTUAL
					temp["Partida registral"] = partidas || "No se encontró";

					//SE AÑADE EL CONJUNTO FINAL DE DATOS
					datos.push(temp);
				});
				break;
		
			case 3: //SI LA BÚSQUEDA FUE POR EL N° DE PARTIDA Y OFICINA REGITRAL
				//SE RECORRE EL CONJUNTO DE IMÁGENES DE LA PARTIDA DE LA ITERACIÓN ACTUAL
				if (response["img"].length){
					datos = `<span class="verPartida" title="Ver partida registral" style="display:block; margin: 0 auto; width: max-content;" data-partida="nropartida=${params.nropartida}&img[]=${response['img'].join('&img[]=')}">Ver partida</span>`;
				}
				break;

			case 4: //SI LA BÚSQUEDA FUE POR EL N° DE PLACA Y OFICINA REGISTRAL
				datos.push({
					"N° de placa": response["placa"],
					"N° de serie": response["serie"] || "-",
					"N° de VIN": response["vin"] || "-",
					"N° de motor": response["nro_motor"] || "-",
					"Marca": response["marca"] || "-",
					"Modelo": response["modelo"] || "-",
					"Color": response["color"] || "-",
					"Estado": response["estado"] ? response["estado"].replace("ï¿½", "ó") : "-",
					"Sede": response["sede"] || "-",
					"Año de fabricación": response["anoFabricacion"] || "-",
					"Código de categoría": response["codCategoria"] || "-",
					"Código de tipo de carrocería": response["codTipoCarr"] || "-",
					"Carrocería": response["carroceria"] || "-",
					"Propietario(s)": Base.isArray(response["propietarios"]["nombre"]) ? response["propietarios"]["nombre"].join("; ") : response["propietarios"]["nombre"]
				});
				break;
		}

		//SE MUESTRAN LOS DATOS
		Servicios.addData(datos);
	}),

	sunat: params => Servicios.processSearch("sunat/check.php", params, data => {
		const response = data.response, datos = [];
		
		response.forEach(obj => {
			datos.push({
				"Departamento": obj["datosGenerales"]["desc_dep"]["value"],
				"Provincia": obj["datosGenerales"]["desc_prov"]["value"],
				"Distrito": obj["datosGenerales"]["desc_dist"]["value"],
				"Código de ubigeo": obj["datosGenerales"]["ddp_ubigeo"]["value"],
				"N° de RUC": obj["datosGenerales"]["ddp_numruc"]["value"],
				"Nombre o razón social": obj["datosGenerales"]["ddp_nombre"]["value"],
				"Tipo de persona": obj["datosGenerales"]["desc_identi"]["value"],
				"Actividad económica": obj["datosGenerales"]["desc_ciiu"]["value"],
				"Estado del contribuyente": obj["datosGenerales"]["desc_estado"]["value"],
				"Condición del contribuyente": obj["datosGenerales"]["esHabido"]["value"] ? "HABIDO" : "NO HABIDO",
				"Fecha de alta": obj["datosGenerales"]["ddp_fecalt"]["value"],
				"Fecha de baja": "value" in obj["datosGenerales"]["ddp_fecbaj"] ? obj["datosGenerales"]["ddp_fecbaj"]["value"] : "-",
				"Domicilio legal": obj["domicilioLegal"],
				"Vía": obj["datosGenerales"]["ddp_nomvia"]["value"],
				"Número": obj["datosGenerales"]["ddp_numer1"]["value"],
				"Interior": obj["datosGenerales"]["ddp_inter1"]["value"],
				"Zona": obj["datosGenerales"]["ddp_nomzon"]["value"],
				"Referencia": obj["datosGenerales"]["ddp_refer1"]["value"],
				"Condición del domicilio": obj["datosGenerales"]["desc_flag22"]["value"],
				"Dependencia": obj["datosGenerales"]["desc_numreg"]["value"]
			});
		});

		Servicios.addData(datos);
	}),

	sunedu: params => Servicios.processSearch("sunedu/check.php", params, data => {
		const response = data.response, datos = [];

		if (Base.isArray(response["gtPersona"])){
			response["gtPersona"].forEach(obj => {
				datos.push({
					"Tipo de documento": obj["tipoDocumento"]["value"],
					"N° de documento": obj["nroDocumento"]["value"],
					"Apellido paterno": obj["apellidoPaterno"]["value"],
					"Apellido materno": obj["apellidoMaterno"]["value"],
					"Nombres": obj["nombres"]["value"],
					"Título profesional": obj["tituloProfesional"]["value"],
					"Centro de estudios": obj["universidad"]["value"],
					"País": obj["pais"]["value"],
					"Fecha de emisión": obj["fechaEmision"]["value"],
					"N° de resolución": obj["resolucion"]["value"],
					"Fecha de resolución": obj["fechaResolucion"]["value"],
					"N° de nulidad": obj["nroResolucionNulidad"]["value"],
					"Fecha de nulidad": obj["fechaResolucionNulidad"]["value"]
				});
			});

			Servicios.addData(datos);
		}
		else{
			Servicios.addData({
				"Tipo de documento": response["gtPersona"]["tipoDocumento"]["value"],
				"N° de documento": response["gtPersona"]["nroDocumento"]["value"],
				"Apellido paterno": response["gtPersona"]["apellidoPaterno"]["value"],
				"Apellido materno": response["gtPersona"]["apellidoMaterno"]["value"],
				"Nombres": response["gtPersona"]["nombres"]["value"],
				"Título profesional": response["gtPersona"]["tituloProfesional"]["value"],
				"Centro de estudios": response["gtPersona"]["universidad"]["value"],
				"País": response["gtPersona"]["pais"]["value"],
				"Fecha de emisión": response["gtPersona"]["fechaEmision"]["value"],
				"N° de resolución": response["gtPersona"]["resolucion"]["value"],
				"Fecha de resolución": response["gtPersona"]["fechaResolucion"]["value"],
				"N° de nulidad": response["gtPersona"]["nroResolucionNulidad"]["value"],
				"Fecha de nulidad": response["gtPersona"]["fechaResolucionNulidad"]["value"]
			});
		}
	}),

	minedu: params => Servicios.processSearch("minedu/check.php", params, data => {
		const response = data.response;

		Servicios.addData({
			"Apellido paterno": response["APEPAT"],
			"Apellido materno": response["APEMAT"],
			"Nombres": response["NOMBRES"],
			"Tipo de documento": response["DOCU_TIP"],
			"N° de documento": response["DOCU_NUM"],
			"Institución de la cual egresó": response["NOMBRE_IE"],
			"Nivel de estudios": response["NIVEL"],
			"Ciudad/Región": response["PAIS_REGION"],
			"Título profesional": response["NOMBRE_TITU"],
			"N° del título": response["NUM_TITU"],
			"Fecha de emisión": response["TITU_FEC"]
		});
	}),

	satlima: params => Servicios.processSearch("satlima/check.php", params, data => {
		const response = data.response;

		Servicios.addData({
			"Ubicación del predio": response["vUbiPred"],
			"Fecha de la Declaración Jurada": response["vFecDJ"],
			"Propietario": `${response["vNomProp"]} ${response["vApePro"]}`
		});
	}),

	mparequipa: params => Servicios.processSearch("mparequipa/check.php", params, data => {
		const response = data.response;

		Servicios.addData({
			"Contribuyente": response["nombre_completo"],
			"Registro en la MPA": response["msg"],
			"Predios registrados": response["predio"],
		});
	}),

	mpilo: params => Servicios.processSearch("mpilo/check.php", params, data => {
		const response = data.response, datos = [];

		response.forEach(predio => {
			datos.push({
				"N° de DNI/RUC": predio["chDOC_IDENTIDAD"],
				"Nombre/Razón social": predio["chDATOS"],
				"Ubicación del predio": predio["chDIREPREDIO"],
				"Porcentaje del predio": predio["PORCENTAJE"],
				"Estado del predio": predio["chESTADO"]
			});
		});

		Servicios.addData(datos);
	})
};

document.addEventListener("readystatechange", function(){
    this.readyState == "complete" && Servicios.init();
}, false);