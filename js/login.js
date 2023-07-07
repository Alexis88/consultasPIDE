"use strict";

const Login = {
	flag: true,
	init: _ => {
		//Se cargan los datos del almacenamiento local
		Login.loadStorage();

		//Se registran los eventos
		Login.events();
	},

	events: _ => {
		//Envío de datos para identificar al usuario
		document.addEventListener("submit", e => {
			e.preventDefault();
			
			//Si existe un almacén local para recordar los datos
			if (Login.remember){
				Login.saveStorage(); //Se guardan los datos en el almacenamiento local
			}
			
			Login.save.call(e.target);
		}, false);

		//Control de clics
		document.addEventListener("click", e => {
			const elem = e.target;

			//Si se pulsa en el slider o en su etiqueta
			if (elem.classList.contains("slide")){
				Login.slide();
			}
		}, false);
	},

	slide: _ => {
		const 
			slider = document.querySelector("#slider"),
			sliderBtn = document.querySelector("#sliderBtn");

		if (slider.classList.contains("on")){
			slider.classList.replace("on", "off");
			sliderBtn.textContent = "No";
		}
		else{
			slider.classList.replace("off", "on");	
			sliderBtn.textContent = "Sí";
		}

		sliderBtn.classList.toggle("move");
	},

	loadStorage: _ => {
		Login.remember = localStorage.loginPIDE ? JSON.parse(localStorage.loginPIDE) : {};

		//Si hay una configuración anterior, se copian los datos y se elimina dicha configuración
		if (localStorage.rememberPIDE){
			const temp = JSON.parse(localStorage.rememberPIDE);

			Login.remember = {
				user: temp.check ? temp.user : "",
				pass: temp.check ? temp.pass : "",
				state: temp.check
			};

			localStorage.loginPIDE = JSON.stringify(Login.remember);
			localStorage.removeItem("rememberPIDE");
		}

		if (Object.values(Login.remember).length){
			const 
				user = document.querySelector("#user"),
				pass = document.querySelector("#pass"),
				slider = document.querySelector("#slider"),
				sliderBtn = document.querySelector("#sliderBtn");

			if (Login.remember.state){
				slider.classList.replace("off", "on");
				sliderBtn.classList.add("move");
				sliderBtn.textContent = "Sí";
				user.value = Login.remember.user;
				pass.value = Login.remember.pass;
			}
			else{
				slider.classList.replace("on", "off");	
				sliderBtn.classList.remove("move");
				sliderBtn.textContent = "No";
			}
		}
	},

	saveStorage: _ => {
		const 
			user = document.querySelector("#user"),
			pass = document.querySelector("#pass"),
			slider = document.querySelector("#slider"),
			state = slider.classList.contains("on");

		Login.remember = {
			user: state ? user.value : "",
			pass: state ? pass.value : "",
			state: state
		};

		localStorage.loginPIDE = JSON.stringify(Login.remember);
	},

	save: function(){
		const 
			btn = this.querySelector("[type=submit]"),
			aux = btn.value;

		if (Login.flag && Login.check.call(this)){
			//Se muestra un mensaje de espera en el botón de guardado
			btn.value = "Espere...";

			//Se bloquean todos los elementos del Loginulario
			Login.state.call(this);

			//Se bloquea el comodín
			Login.flag = false;

			Ajax({
				url: this.action,
				method: this.method,
				data: this,
				type: "json"
			}).done(response => {	
				//Si se produjo un error
				if (response.estado == "error"){
					Notification.msg({text: response.mensaje, time: 5000});
				}
				//Si no se produjo un error
				else{
					//Si hay una dirección hacia la cual redireccionar
					if (response.url){
						location = response.url;
					}
				}
			}).fail(error => Notification.msg({
				text: error, 
				onHide: _ => location.reload(true), 
				background: true
			})).always(_ => {
				Login.flag = true; //Se reactiva el comodín para procesar los datos
				btn.value = aux; //El botón de envío obtiene su texto inicial
				Login.state.call(this); //Se desbloquean todos los elementos del formulario
			});
		}
	},

	check: function(){
		for (let i = 0, f = this.elements, l = f.length; i < l; i++){
			if (f[i].required && !f[i].value.length){
				Notification.msg({text: "Tiene que completar todos los campos requeridos", background: true});
				return false;
			}
		}

		return true;
	},

	state: function(){
		const self = this && "tagName" in this && this.tagName == "FORM" ? this : document.querySelector("form");

		[...self.querySelectorAll("*")].forEach(elem => {
			if (["INPUT", "SELECT", "TEXTAREA"].indexOf(elem.tagName) > -1){
				elem.disabled = !elem.disabled;
			}
			else{
				elem.classList.toggle("disabled");
			}
		});
	}
};

document.addEventListener("readystatechange", function(){
    this.readyState == "complete" && Login.init();
}, false);