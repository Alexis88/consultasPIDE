"use strict";

const Lista = {
	init: _ => {
		Lista.form = document.querySelector("#search"); //Formulario de búsqueda
		Lista.table = document.querySelector("#list"); //Listado
		Lista.tbody = Lista.table.querySelector("tbody"); //Cuerpo del listado
		Lista.source = "lista.php"; //Fuente de datos

		//Se registran los eventos
		Lista.events();

		//Responsive tables		
		Tablas.load();

		//Se carga el listado
		Lista.search();
	},

	events: _ => {
		//Si se dispara el evento submit, se cancela la operación
		Lista.form.addEventListener("submit", e => e.preventDefault(), false);

		//Si se produce un cambio en los inputs
		Lista.form.addEventListener("change", function(e){
			e.target.tagName == "SELECT" && Lista.search.call(this);			
		}, false);

		//Si se digita en los inputs
		Lista.form.addEventListener("input", function(e){
			e.target.tagName == "INPUT" && Lista.search.call(this);
		}, false);

		//Control de pulsación en botones
		document.addEventListener("click", e => {
			const btn = e.target;

			//Si se pulsa el botón para añadir nuevos registros
			btn.id == "crear" && Modal.show({
				text: "<img src='../../../img/wait.gif' class='wait' />", 
				url: btn.dataset.url, 
				onError: response => Base.sessionClosed(response),
				onShow: _ => {
					const input = document.querySelector("[id^=modalFront] input")
					input && input.focus();

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

			//Si se pulsa el botón para editar registros
			btn.hasAttribute("data-edit") && Modal.show({
				text: "<img src='../../../img/wait.gif' class='wait' />", 
				url: btn.dataset.edit, 
				onError: response => Base.sessionClosed(response),
				onShow: _ => {
					const input = document.querySelector(".modalBack input");
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

			//Si se pulsa el botón para inhabilitar registros
			if (btn.hasAttribute("data-del")){
				Lista.checkForDelete(_ => Lista.delete(btn.dataset.del, 3));
			}

			//Si se pulsa el botón para eliminar registros
			if (btn.hasAttribute("data-bor")){
				Lista.checkForDelete(_ => Lista.delete(btn.dataset.bor, 4));
			}			
		}, false);

		//Si se detecta que la barra de desplazamiento ha tocado el fondo, se cargan nuevas filas en la tabla
		window.addEventListener("scroll", _ => {
			if ("Scroll" in window && Scroll.bottom()){
				Scroll.base += 50;
				Scroll.load({
					url: Lista.source,
					data: Lista.form,
					base: Scroll.base,
					th: Lista.tbody.parentNode.querySelectorAll("th").length,
					tbody: Lista.tbody,
					callback: _ => Base.changeElementsTheme()
				});
			}
		}, false);
	},

	search: (event, source) => {
		//Se establece en cero la base de registros a mostrar
		if ("Scroll" in window) Scroll.base = 0;

		//El total de cabeceras de la tabla
		const th = Lista.tbody.parentNode.querySelectorAll("th").length;
		
		//GIF de espera
		const waitGIF = document.createElement("img");
		waitGIF.src = "../../../img/wait.gif";
		waitGIF.classList.add("wait");

		//Se inserta el GIF de espera por debajo de la tabla
		Lista.table.parentNode.insertBefore(waitGIF, Lista.table.nextElementSibling);

		//Se deshabilita la carga por scroll
		Scroll.flag = false;

		//Se carga la lista de clientes
		Ajax({
			url: source || Lista.source,
			data: Lista.form
		}).done(response => {
			if (Base.sessionClosed(response)) return;			

			if (response.length && response.indexOf("<tr>") < 0){
				Lista.tbody.innerHTML = "";
				Notification.msg({text: "Ocurrió un error. Por favor, vuelva a intentarlo o póngase en contacto con el desarrollador de la aplicación.", background: true});
			}
			else{
				Lista.tbody.innerHTML = response;	

				if (Base.localTheme?.dark){
					//Se establece un fondo oscuro y texto claro para las filas de las tablas
					document.querySelectorAll("table:not(.modalFront table) tbody tr").forEach(tr => tr.classList.add("darkRows"));
				}
				else{
					//Se retira el fondo oscuro y texto claro de las filas de las tablas
					[...document.querySelectorAll("table:not(.modalFront table) tbody tr")].forEach(tr => tr.classList.remove("darkRows"));
				}
			}

			//Se habilita la carga por scroll
			setTimeout(_ => Scroll.flag = true, 3000);
			
			//Se da formato a la tabla
			Tablas.load();
		}).fail(error => {
			Notification.msg({text: "Ocurrió un error. Por favor, vuelva a intentarlo o póngase en contacto con el desarrollador de la aplicación.", background: true});
			Lista.tbody.innerHTML = "";
		}).always(_ => {
			//Se elimina el GIF de espera
			waitGIF.remove();

			//Se habilita la carga por scroll
			Scroll.flag = true;
		});
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
							text: "La clave ingresada es incorrecta", 
							onShow: _ => Lista.checkForDelete(callback), 
							time: 1000
						});
					}
				}).fail(error => {
					Notification.msg(error);
				});
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
					Notification.msg(response.mensaje);
					Lista.search();
					Tablas.load();
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
	}
};

document.addEventListener("readystatechange", function(){
    this.readyState == "complete" && Lista.init();
}, false);