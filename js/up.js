"use strict";

const Subir = {
	init: _ => {
		//Se almacena el botón
		Subir.boton = document.querySelector("#subir");

		//Se registran los eventos
		Subir.events();		
	},

	events: _ => {
		window.addEventListener("scroll", _ => {
			//Si el usuario se ha desplazado hasta la mitad de la altura de la ventana, se muestra el botón
			if (window.scrollY >= document.documentElement.clientHeight / 2){
				Subir.boton.style.display = "block";
				Subir.boton.style.opacity = .8;
				setTimeout(_ => Subir.boton.style.transform = "scale(1)", 150);
			}
			//Caso contrario, se lo oculta
			else if (getComputedStyle(Subir.boton).display != "none"){
				Subir.boton.style.opacity = 0;
				Subir.boton.style.transform = "scale(0)";
				setTimeout(_ => Subir.boton.style.display = "none", 150);
			}
		}, false);

		Subir.boton.addEventListener("click", Subir.go, false);
		Subir.boton.addEventListener("mouseover", Subir.over, false);
		Subir.boton.addEventListener("mouseout", Subir.out, false);
	},

	go: _ => document.documentElement.scrollIntoView({behavior: "smooth"}),

	over: _ => window.scrollY >= document.documentElement.clientHeight / 2 && (Subir.boton.style.opacity = 1) && (Subir.boton.style.cursor = "pointer"),

	out: _ => window.scrollY >= document.documentElement.clientHeight / 2 ? (Subir.boton.style.opacity = .8) : (Subir.boton.style.opacity = 0),	
};

document.addEventListener("readystatechange", function(){
    this.readyState == "complete" && Subir.init();
}, false);