"use strict";

let Base = {
	init: _ => {
		//Se establece el color de fondo previamente elegido
		//Base.loadTheme();		

		//Si se cierra o actualiza la ventana, se coloca el scroll en la cima
		window.addEventListener("beforeunload", _ => window.scrollTo(0, 0), false);

		//Control de clics
		document.addEventListener("click", e => {
			let elem = e.target;

			//Si se pulsa una etiqueta, se le da el enfoque al elemento previo
			Base.getParent(elem, "form") && elem.tagName == "LABEL" && (el => {
				["input", "select", "textarea"].some(tag => {
					const ele = el.parentNode.querySelector(tag);
					ele && ele.focus();
				});
			})(elem);			

			//Si se pulsa sobre un elemento que requiere abrir su contenido por fuera
			if (elem.hasAttribute("data-open")){
				window.open(elem.dataset.open);
			}

			//Si se pulsa sobre una imagen, se muestra en una ventana modal
			if (elem.classList.contains("modalMedia")){
				Modal.show({
					text: `<img src="${elem.src}" />`,
					media: true
				});
			}

			//Si se pulsa una etiqueta, se le da el enfoque al elemento previo
			Base.getParent(e.target, "form") && e.target.tagName == "LABEL" && (elem => {
				let types = ["input", "select", "textarea"];
				
				for (let i = 0, l = types.length, el; i < l; i++){
					el = elem.parentNode.querySelector(types[i]);
					if (el){
						el.focus();
						break;
					}
				}
			})(e.target);

			//Si se pulsa en el botón de cambio de tema
			if (elem.id == "themeBtn"){
				Base.changeTheme();
			}

			//Si el elemento está deshabilitado, se ignora la acción
			if (("disabled" in elem && elem.disabled) || elem.classList.contains("disabled")) return;
		}, false);

		//Se muestra una notificación avisando al usuario cuando la conexión a internet se pierda y restablezca
		window.addEventListener("online", _ => Notification.msg("<img src='../../../img/online.png' class='notificationImg' /> La conexión a internet se ha restablecido"));
		window.addEventListener("offline", _ => Notification.msg({
			text: "<img src='../../../img/offline.png' class='notificationImg' /> Su conexión a internet se ha interrumpido. Le recomendamos esperar a que se restablezca para continuar usando el sistema.",
			time: 5000
		}));

		//Se muestra una ventana modal en caso de detectarse datos adjuntos en la URI
		Base.checkURI();
	},

	loadTheme: _ => {
		//Se recupera la configuración almacenada del tema
		Base.localTheme = localStorage.themePIDE ? JSON.parse(localStorage.themePIDE) : {};

		//Se cambia el tema
		Base.changeElementsTheme();
	},

	changeTheme: _ => {
		//Se cambia el valor guardado del tema
		Base.localTheme.dark = !Base.localTheme.dark;

		//Se cambia el tema
		Base.changeElementsTheme();

		//Se guardan los cambios
		localStorage.themePIDE = JSON.stringify(Base.localTheme);
	},

	changeElementsTheme: _ => {
		//El botón para cambiar el tema
		const 
			themeBtn = document.querySelector("#themeBtn"),
			menuBtn = document.querySelector("#open");

		//Si previamente se ha establecido el tema oscuro
		if (Base.localTheme.dark){
			//Si existe el botón para cambiar el tema
			if (themeBtn){
				//Se establece el ícono del tema claro
				themeBtn.src = "../../../img/light.png";
				themeBtn.title = "Cambiar al tema claro";
				themeBtn.classList.add("iconColor");
			}

			//Se establece un fondo oscuro para el documento
			document.body.classList.add("dark");

			//Se establece un fondo oscuro y texto claro para los elementos de formularios
			[...document.querySelectorAll("[id^=modalFront] :is(h1, h2, h3, h4, h5, span), p, label, input, select, textarea")].forEach(elem => elem.classList.add("darkText"));

			//Se establece un fondo oscuro y texto claro para las opciones de los combos
			[...document.querySelectorAll("option")].forEach(option => option.classList.add("darkSelect"));

			//Se establece un fondo oscuro y texto claro para los botones de envío de los formularios
			[...document.querySelectorAll("[type=submit]")].forEach(btn => btn.classList.add("darkSubmit"));

			//Se establece un fondo oscuro y texto claro para las filas de las tablas
			[...document.querySelectorAll("table tbody tr")].forEach(tr => tr.classList.add("darkRows"));

			//Se establece un color claro para el botón de apertura del menú
			menuBtn.classList.add("darkMenuBtn");
		}
		//Caso contrario
		else{
			//Si existe el botón para cambiar el tema
			if (themeBtn){
				//Se establece el ícono del tema oscuro
				themeBtn.src = "../../../img/dark.png";
				themeBtn.title = "Cambiar al tema oscuro";
				themeBtn.classList.remove("iconColor");
			}

			//Se retira el fondo oscuro del documento
			document.body.classList.remove("dark");

			//Se retira el fondo oscuro y texto claro de las filas de las tablas
			[...document.querySelectorAll("table tbody tr")].forEach(tr => tr.classList.remove("darkRows"));

			//Se retira el fondo oscuro y texto claro de los elementos de formularios
			[...document.querySelectorAll("[id^=modalFront] :is(h1, h2, h3, h4, h5, span), p, label, input, select, textarea")].forEach(elem => elem.classList.remove("darkText"));

			//Se retira el fondo oscuro y texto claro de las opciones de los combos
			[...document.querySelectorAll("option")].forEach(option => option.classList.remove("darkSelect"));

			//Se retira el fondo oscuro y texto claro de los botones de envío de los formularios
			[...document.querySelectorAll("[type=submit]")].forEach(btn => btn.classList.remove("darkSubmit"));

			//Se retira el color claro del botón de apertura del menú
			menuBtn.classList.remove("darkMenuBtn");
		}
	},

	checkURI: _ => {
		let url = document.URL, id, ruta;

		if (url.indexOf("#") > -1){
			id = url.substring(url.indexOf("#") + 1);
			ruta = /\/vistas\/(.*)\//gi.exec(url)[1];
			Ajax({url: "../../clases/checkfile.php", data: {path: ruta}, type: "json"})
				.done(response => {
					if (Base.sessionClosed(response)) return;

					if (response.estado == "ok"){
						Modal.show({
							url: `form.php?id=${id}`, 
							onError: response => Base.sessionClosed(response),
							css: {
								front: {
									backgroundColor: Base.localTheme.dark ? "#15202B" : "",
									border: Base.localTheme.dark ? ".1rem solid #FFFFEF" : "",
									borderRadius: "1rem"
								},
								close: {
									color: Base.localTheme.dark ? "#FFFFEF" : ""
								}
							},
							onShow: Base.changeElementsTheme,
							onHide: _ => history.replaceState({}, "", url.substring(0, url.indexOf("#")))
						});
					}
				})
				.fail(error => Notification.msg(error));
		}
	},

	sessionClosed: response => {
		let json;

		try{
			if ({}.toString.call(response) === "[object Object]"){
				json = response;
			}
			else{
				json = JSON.parse(response);

				if ({}.toString.call(json) !== "[object Object]"){
					return false;
				}
			}
		}
		catch (e){
			return false;
		}

		if (json.estado == "ended"){
			Notification.msg({
				text: "<img src='../../../img/clock.png' class='notificationImg' /> El tiempo de la sesión ha expirado. Se le redirigirá al formulario de identificación.", 
				callback: _ => location = json.url
			});
			return true;
		}

		return false;
	},

	isFunction: fn => {
		return {}.toString.call(fn) === "[object Function]";
	},

	isArray: arr => {
		return {}.toString.call(arr) === "[object Array]";
	},

	isObject: obj => {
		return {}.toString.call(obj) === "[object Object]";
	},

	getParent: (elem, selector) => {
		if (elem.parentNode == document) return false;
		
		if (
			elem.parentNode && 
			(elem.parentNode.id != selector && 
			elem.parentNode.name != selector && 
			!elem.parentNode.classList.contains(selector) && 
			elem.parentNode.tagName.toLowerCase() != selector && 
			!elem.parentNode.hasAttribute(selector))
		){			
			return Base.getParent(elem.parentNode, selector);
		}
		else{
			return elem.parentNode;
		}
	},

	nextClose: (elem, selector) => {
		if (elem.nextElementSibling == null) return elem;

		if (
			elem.nextElementSibling &&
			(elem.nextElementSibling.id != selector && 
			elem.nextElementSibling.name != selector && 
			!elem.nextElementSibling.classList.contains(selector) && 
			elem.nextElementSibling.tagName.toLowerCase() != selector && 
			!elem.nextElementSibling.hasAttribute(selector))
		){			
			return Base.nextClose(elem.nextElementSibling, selector);
		}
		else{
			return elem.nextElementSibling;
		}
	}
};

document.addEventListener("readystatechange", function(){
    switch (this.readyState){
    	default:
    		Base.loadTheme();
    		break;
    	case "complete":
    		Base.init();
    		break;
    }
}, false);