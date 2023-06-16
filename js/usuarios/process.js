"use strict";

let Usuarios = {
	init: _ => {
		document.addEventListener("input", e => {
			let elem = e.target;

			//AUTOCOMPLETADO DE DATOS
			if (elem.classList.contains("autocomplete")){
				Autocomplete.go({
					source: `${elem.dataset.url}.php`,
					input: elem,
					extraData: `field=${elem.dataset.field}&table=${elem.dataset.table}`,
					show: "data",
					hideScroll: "[id^=modalFront]",
					select: data => {
						if (elem.nextElementSibling.type == "hidden"){
							elem.nextElementSibling.value = data.id;
						}
					}
				});
			}
		}, false);

		//CONTROL DE CLICS
		document.addEventListener("click", e => {
			let elem = e.target;

			//AÑADIR DATOS DE IDENTIFICACIÓN DEL USUARIO EN UN SERVICIO
			if (elem.id == "addService") Usuarios.addService();

			//ELIMINAR DATOS DE IDENTIFICACIÓN DEL USUARIO EN UN SERVICIO
			if (elem.classList.contains("delService")) Usuarios.delService(elem);
		}, false);

		//SE HABILITAN/INHABILITAN LOS CAMPOS DE USUARIO Y CONTRASEÑA EN CASO DE QUE EL SERVICIO ELEGIDO LOS REQUIERA O NO
		document.addEventListener("change", e => {
			let elem = e.target, tr;

			if (elem.name.indexOf("servicio") > -1){
				tr = Base.getParent(elem, "tr");
				
				if (elem.options[elem.selectedIndex].value > 0){
					Usuarios.checkService(tr, elem.value);	
				}
				else{
					Usuarios.cleanRow(tr);
				}
			}
		}, false);
	},

	addService: _ => {
		let tbody = document.querySelector("#services tbody"),
			tr = [...tbody.querySelectorAll("tr")].pop().cloneNode(true);

		tbody.appendChild(tr);
		
		Ajax({url: "services.php"})
			.done(options => {
				if (Base.sessionClosed(options)) return;
				
				let select = tr.querySelector("[name^=servicio]");
				
				if (select){
					select.innerHTML = options;
					Base.changeElementsTheme();
				}
			}).fail(error => Notification.msg(error));

		tr.animate([{
			transform: "scaleY(0)",
			opacity: 0
		}, {
			transform: "scaleY(1)",
			opacity: 1
		}], {
			duration: 300
		});

		Usuarios.cleanRow(tr);
		Usuarios.firstFocus(tr);
	},

	delService: btn => {
		let rows = document.querySelectorAll("#services tbody tr"), 
			tr = Base.getParent(btn, "tr");

		if (Usuarios.checkData(btn)){
			Confirm.go({
				pregunta: "¿Realmente desea eliminar estos datos?", 
				callback: _ => {
					if (rows.length > 1){
						if (btn.hasAttribute("data-id")){
							Usuarios.deleteData(btn, _ => {
								tr.animate([{
									transform: "scaleY(1)",
									opacity: 1
								}, {
									transform: "scaleY(0)",
									opacity: 0
								}], {
									duration: 300
								});

								setTimeout(_ => tr.remove(), 300);
							});
						}
						else{
							tr.animate([{
								transform: "scaleY(1)",
								opacity: 1
							}, {
								transform: "scaleY(0)",
								opacity: 0
							}], {
								duration: 300
							});
							
							setTimeout(_ => tr.remove(), 300);					
						}
					}
					else{
						if (btn.hasAttribute("data-id")){
							Usuarios.deleteData(btn, _ => Usuarios.cleanRow(tr));
						}
						else{
							Usuarios.cleanRow(tr);
						}
					}
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
		else if (rows.length > 1){
			tr.animate([{
				transform: "scaleY(1)",
				opacity: 1
			}, {
				transform: "scaleY(0)",
				opacity: 0
			}], {
				duration: 300
			});
						
			setTimeout(_ => tr.remove(), 300);
		}
		else if (rows.length === 1 && !Usuarios.checkData(btn)){
			Usuarios.cleanRow(tr);
		}
	},

	checkData: btn => {
		let tr = Base.getParent(btn, "tr"),
			elems = tr.querySelectorAll("input, .delService");

		for (let i = 0, l = elems.length; i < l; i++){
			if (("value" in elems[i] && elems[i].value.length) || elems[i].hasAttribute("data-id")){
				return true;
			}
		}

		return false;
	},

	checkService: (row, idService) => {
		Ajax({
			url: "checkLogin.php",
			data: {
				id: idService
			},
			type: "json"
		}).done(response => {
			if (Base.sessionClosed(response)) return;

			if (response.estado == "ok"){
				let inputs = row.querySelectorAll("input"), credentialsLength;

				[...inputs].forEach(input => {
					if (response.login == "yes"){
						credentialsLength = Object.values(response.credentials).length;

						input.disabled = credentialsLength ? true : false;
						input.placeholder = "";

						if (credentialsLength){
							if (input.name.indexOf("user") > -1){
								input.value = response.credentials.user;
							}

							if (input.name.indexOf("pass") > -1){
								input.value = response.credentials.pass;
							}
						}
						else{
							input.value = "";							
						}
					}
					else{
						input.disabled = true;
						input.placeholder = "No requiere";
						input.value = "";
					}
				});

				Usuarios.firstFocus(row);
			}
			else{
				Notification.msg("El servicio no se encuentra disponible. Por favor, elija otro.");
			}
		}).fail(error => Notification.msg(error));
	},

	deleteData: (btn, callback) => {
		Ajax({
			url: "procesar.php",
			method: "post",
			data: {
				id: btn.dataset.id,
				user: btn.dataset.user,
				servicio: Base.getParent(btn, "tr").querySelector("[name^=servicio]").value,
				tipo: 5
			},
			type: "json"
		}).done(response => {
			if (Base.sessionClosed(response)) return;
			Notification.msg(response.mensaje);
			response.estado == "ok" && callback && Base.isFunction(callback) && callback();			
		}).fail(error => Notification.msg(error));
	},

	cleanRow: row => {
		[...row.querySelectorAll("input, select, [data-id], [data-user]")].forEach(elem => {
			if (elem.tagName == "INPUT"){
				elem.value = "";
				elem.placeholder = "";
				elem.disabled = true;
			}
			else if (elem.tagName == "SELECT"){
				elem.selectedIndex = 0;
			}
			else if (elem.hasAttribute("data-id")){
				elem.removeAttribute("data-id");		
			}
			else if (elem.hasAttribute("data-user")){
				elem.removeAttribute("data-user");		
			}
		});
	},

	firstFocus: row => row.querySelector("input").focus()
};

document.addEventListener("readystatechange", function(){
    this.readyState == "complete" && Usuarios.init();
}, false);