"use strict";

let Form = {
	flag: true,
	save: function(time, checkCall){
		let form = this,
			btn = form.querySelector("[type=submit]"),
			aux = btn.value;

		if (Form.flag && Form.check.call(form)){
			//Se muestra un mensaje de espera en el botón de guardado
			btn.value = "Procesando datos...";

			//Se bloquean todos los elementos del formulario
			Form.state.call(form);

			//Se bloquea el comodín
			Form.flag = false;

			Ajax({
				url: form.action,
				method: form.method,
				data: form,
				type: "json"
			}).done(response => {				
				if (Base.sessionClosed(response)) return;

				if (response.estado == "ok"){
					//Se ocultan las ventanas modales
					Modal.hideAll();
				}

				//Se muestra el mensaje indicando el resultado de la operación
				Notification.msg({text: response.mensaje, time: response.tiempo || false});

				//Si hay una tabla presente, se actualiza su contenido y formato de visualización
				if (document.querySelector("table") && response.estado == "ok"){
					Lista.search(); //Se recarga el listado
					Tablas.load(); //Se da formato al listado
				}
				
				Form.flag = true; //Se reactiva el comodín para procesar los datos
				btn.value = aux; //El botón de envío obtiene su texto inicial
				Form.state.call(form); //Se desbloquean todos los elementos del formulario
			}).fail(error => Notification.msg(error));
		}
	},

	check: function(){
		for (let i = 0, f = this.elements, l = f.length; i < l; i++){
			if (f[i].required && !f[i].value.length){
				Notification.msg({text: "Tiene que completar todos los campos requeridos"});
				return false;
			}
		}

		return true;
	},

	state: function(){
		let self = this && "tagName" in this && this.tagName == "FORM" ? this : document.querySelector("form");

		[].forEach.call(self.querySelectorAll("*"), elem => {
			if (["INPUT", "SELECT", "TEXTAREA"].indexOf(elem.tagName) > -1){
				elem.disabled = !elem.disabled;
			}
			else{
				elem.classList.toggle("disabled");
			}
		});
	}
};

document.addEventListener("submit", (e) => {
	e.preventDefault();
	Form.save.call(e.target, e.target.hasAttribute("data-time") ? e.target.dataset.time : null, e.target.hasAttribute("data-check") ? e.target.dataset.check : null);
}, false);