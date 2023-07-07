"use strict";

const Menu = {
	menubar: document.querySelector("#menu") || null,
	open: document.querySelector("#open") || null,
	close: document.querySelector("#salir") || null,
	indicator: document.querySelector("#indicator") || null,
	init: _ => {
		//Botón para mostrar el menú
		Menu.open.addEventListener("click", function(e){
			Menu.toggle();
			e.stopImmediatePropagation();
		}, false);

		//Botón para cerrar la sesión
		Menu.close && Menu.close.addEventListener("click", function(e){
			Menu.menubar.className == "menuShow" && Menu.toggle();
			Confirm.go({
				pregunta: "¿Está seguro/a de que desea cerrar la sesión?", 
				callback: _ => {
					Ajax({
						url: "../acceso/salir.php",
						type: "json"
					}).done(response => {
						if (Base.sessionClosed(response)) return;
						if (response.estado == "ok"){
							location = e.target.getAttribute("data-link");
						}
						else{
							Notification.msg({text: response.mensaje, onShow: _ => response.url && (location = response.url)});
						}
					}).fail(error => Notification.msg(error));
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
		}, false);

		//Si se pulsa una opción del menú
		Menu.menubar.addEventListener("click", e => {
			const elem = e.target;
			if (elem.tagName == "LI" && elem.hasAttribute("data-url")){
				location = elem.dataset.url;
			}
		}, false);

		//Si el menú está desplegado y se pulsa sobre alguna parte fuera del menú, este se replegará
		document.addEventListener("click", e => {		
			const elem = e.target;
			if (Menu.menubar.classList.contains("menuShow")){
				if (["NAV", "LI"].indexOf(elem.tagName) < 0 || (elem.classList.contains("closeButton") || elem.id == "close")){
					Menu.toggle();
				}
			}
		}, false);

		//Si se da un clic derecho a una opción del menú
		window.addEventListener("contextmenu", e => {
			const elem = e.target;
			if (elem.tagName == "LI" && elem.hasAttribute("data-url")) window.open(elem.dataset.url);
		}, false);

		//Si se posa el cursor sobre una opción del menú, se colocar el indicar sobre esta
		document.addEventListener("mouseover", e => {
			const elem = e.target;
			let li;

			//Si es una opción del menú
			if (elem.tagName == "LI"){
				li = elem;
			}
			//Si su ancestro es una opción del menú
			else if (elem.parentNode.tagName == "LI"){
				li = elem.parentNode;
			}

			//Si contiene la clase "closeButton" o si su ancestro contiene la clase "closeButton"
			if (li?.classList.contains("closeButton") || li?.parentNode.classList.contains("closeButton")){
				li = null;
			}

			//Si se logró capturar a la opción del menú, se llama al método over()
			if (li){
				Menu.over(li);
			}
		}, false);
	},

	toggle: callback => {
	    if (Menu.menubar.className == "menuShow"){
	    	Menu.open.classList.replace("hide", "show");
	    	Menu.menubar.className = "";
	    	Menu.indicator.classList.remove("showIndicator");
	    }
	    else{
	    	Menu.open.classList.replace("show", "hide");
	    	Menu.menubar.className = "menuShow";
	    }
	    
        callback && {}.toString.call(callback) === "[object Function]" && callback();
	},

	over: li => {
		if (!Menu.indicator.classList.contains("showIndicator")){
			Menu.indicator.classList.add("showIndicator");
		}

		Menu.indicator.style.top = li.offsetTop + "px";
		Menu.indicator.style.height = li.offsetHeight + "px";
	}
};

document.addEventListener("readystatechange", function(){
    this.readyState == "complete" && Menu.init();
}, false);