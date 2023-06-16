"use strict";

let Check = {
	init: () => {
		//Control de escritura
		document.addEventListener("keypress", (e) => {
			let elem = e.target;

			//Si es un <input>
			if (elem.tagName == "INPUT" || elem.tagName == "TEXTAREA"){
			    //Cualquier caracter
			    elem.classList.contains("all") && !Check.analize(String.fromCharCode(e.which), "all") && e.preventDefault();
			    
				//Cadenas de texto
				elem.classList.contains("string") && !Check.analize(String.fromCharCode(e.which), "string") && e.preventDefault();

				//Valores numéricos
				elem.classList.contains("number") && !Check.analize(String.fromCharCode(e.which), "number") && e.preventDefault();	

				//Código catastral
				elem.classList.contains("code") && !Check.analize(String.fromCharCode(e.which), "code") && e.preventDefault();			

				//Número de teléfono
				elem.classList.contains("phone") && !Check.analize(String.fromCharCode(e.which), "phone") && e.preventDefault();

				//Coordenadas
				elem.classList.contains("coords") && !Check.analize(String.fromCharCode(e.which), "coords") && e.preventDefault();
			}
		}, false);

		//Control de pegado
		document.addEventListener("paste", (e) => {
			let elem = e.target, copy = e.clipboardData.getData("text").trim();

			//Si es un <input>
			if (elem.tagName == "INPUT" || elem.tagName == "TEXTAREA"){
			    //Cualquier caracter
				elem.classList.contains("all") && !Check.analize(copy, "all") && e.preventDefault();
			    
				//Cadenas de texto
				elem.classList.contains("string") && !Check.analize(copy, "string") && e.preventDefault();

				//Valores numéricos
				elem.classList.contains("number") && !Check.analize(copy, "number") && e.preventDefault();

				//Código catastral
				elem.classList.contains("code") && !Check.analize(copy, "code") && e.preventDefault();

				//Número de teléfono
				elem.classList.contains("phone") && !Check.analize(copy, "phone") && e.preventDefault();

				//Coordenadas
				elem.classList.contains("coords") && !Check.analize(copy, "coords") && e.preventDefault();
			}
		}, false);
	},

	analize: (valor, tipo) => {
		switch (tipo.toUpperCase()){
		    //Cualquier caracter
			case "ALL":
				return /^.*$/gi.test(valor);
				break;
		    
			//Cadenas de texto
			case "STRING":
				return /^[A-Za-záéíóúÁÉÍÓÚÑñÜü\¿\?\¡\!0-9\s\.\,\;\:\|\-\#\'\"\°\*\_\+\(\)\[\]\{\}\/\@\n\r]*$/gi.test(valor);
				break;

			//Valores numéricos
			case "NUMBER":
				return /^[0-9\.\-\n\r]*$/gi.test(valor);
				break;

			//Únicamente números
			case "DIGITS":
				return /^[0-9]*$/gi.test(valor);
				break;

			//Código catastral
			case "CODE":
				return /^[0-9\-\n\r]*$/gi.test(valor);

			//Número de teléfono
			case "PHONE":
				return /^[0-9\-\+\(\)\s\n\r]*$/gi.test(valor);
				break;

			//Coordenadas
			case "COORDS":
				return /^[0-9\.\-\,\s\n\r]*$/gi.test(valor);
				break;

			default:
				return false;
				break;
		}
	}
};

document.addEventListener("readystatechange", function(){
    this.readyState == "complete" && Check.init();
}, false);