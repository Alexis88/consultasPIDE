"use strict";

var Files = {
	init: _ => {
		Files.form = document.querySelector("form");

		//Cuando se arrastre elementos sobre el objetivo
		document.addEventListener("dragover", e => e.target.classList.contains("droppable") && Files.dragOver(e), false);

		//Cuando se suelte elementos en el objetivo
		document.addEventListener("drop", e => {
			let elem = e.target;

			//Si el elemento está deshabilitado, no se hace nada
			if (elem.classList.contains("disabled")){
				e.preventDefault();
				e.stopImmediatePropagation();
			}

			//Si el elemento puede recibir contenido
			if (elem.classList.contains("droppable")){				
				Files.dropChange(e, elem.parentNode.querySelector("input"));
				e.stopImmediatePropagation();
			}
		}, false);

		//Cuando se ha seleccionado archivos
		document.addEventListener("change", e => {
			let elem = e.target;

			if (elem.type == "file"){
				//Si el elemento está deshabilitado, no se hace nada
				if (elem.classList.contains("disabled")){
					e.preventDefault();
					e.stopImmediatePropagation();
				}
				//Caso contrario, se ejecuta el método dropChange
				else if (elem.files.length){
					Files.dropChange(e, elem);
				}				
			}
		}, false);

		//MIME types
		Files.mimes = ["image/jpeg", "image/png", "image/bmp"];

		//Si se pulsa un elemento deshabilitado, se cancela la acción
		document.addEventListener("click", e => {
			if (e.target.classList.contains("disabled")){
				e.preventDefault();
				e.stopImmediatePropagation();
			}
		}, false);
	},

	dragOver: e => {
		e.preventDefault();
		e.stopImmediatePropagation();
		e.dataTransfer.dropEffect = "copy";
	},

	dropChange: (e, btnFile) => {
		let files, reader = new FileReader(), dropText;

		//Si se arrastra y suelta el archivo
		if ("dataTransfer" in e){
			e.preventDefault();
			if (!e.dataTransfer.files.length) return;
			files = e.dataTransfer.files;
		}
		//Si se selecciona el archivo
		else{
			if (!e.target.files.length) return;
			files = e.target.files;
		}

		//Se deshabilitan los elementos del formulario
		Files.state.call(Files.form);

		//Se asigna el archivo al botón de selección de archivos
		btnFile.files = files;

		//Texto del cuadro de selección de archivos
		dropText = btnFile.parentNode.querySelector(".textDrop");

		//Se muestra un GIF de espera
		dropText.innerHTML = "<img src='../../../img/wait.gif' class='wait' />";

		//Si el tipo de archivo no es válido, se rechaza la solicitud
		if (Files.mimes.indexOf(files[0].type) < 0){
			dropText.innerHTML = dropText.dataset.text;
			Notification.msg("❎ Tiene que seleccionar un archivo de imagen en formato JPG, PNG o BMP");			
			btnFile.files = null;
			Files.state.call(Files.form);
			return;
		}

		//Se verifica que el archivo sea una imagen
		Files.fileInfo(btnFile, files[0], dropText, info => {
			//El elemento <img> que mostrará la vista previa
			let preview = btnFile.parentNode.parentNode.querySelector(".preview"),
				btn = btnFile.parentNode.parentNode.querySelector(".del");

			//Una vez terminada la carga del archivo
			reader.addEventListener("load", event => {
				//Previsualizar archivo si es de un tipo admitido
				if (Files.mimes.indexOf(files[0].type) > -1){
					preview.classList.replace("hide", "show");
					preview.classList.add("modalMedia");
					preview.src = event.target.result;
					preview.title = "Logo del servicio";
					btn.dataset.logo = "temp";
					dropText.innerHTML = dropText.dataset.text;
				}

				//Se habilitan los elementos del formulario
				Files.state.call(Files.form);

				//Se notifica al usuario
				Notification.msg("✅ Archivo adjuntado exitosamente");
			}, false);

			//Se lee el archivo adjuntado
			reader.readAsDataURL(files[0]);
		});		
	},

	fileInfo: (elem, file, dropText, callback) => {
		//Se añade el archivo seleccionado a un objeto FormData
		let data = new FormData();
		data.append("file", file);

		//Si el archivo pesa más de 10 MB, se rechaza la solicitud
		if (file.size > 10485760){
			Notification.msg("❎ El archivo no debe pesar más de 10 MB");
			elem.files = null;
			return;
		}

		//Se envía el archivo al lado del servidor para obtener sus propiedades
		Ajax({
			url: "fileInfo.php",
			method: "post",
			data: data,
			type: "json"
		}).done(response => {
			if (Base.sessionClosed(response)) return;
			
			//Si el archivo es válido
			if (response.estado == "ok"){
				//Si el archivo pesa más de 10 MB, se rechaza la solicitud
				if (response.size > 10485760){
					Notification.msg("❎ El archivo no debe pesar más de 10 MB");
					elem.files = null;
					return;
				}
				//Caso contrario, se ejecuta la llamada de retorno con la información del archivo
				else{
					callback(response);
				}
			}
			//Caso contrario
			else{
				Notification.msg("❎ El archivo no es válido. Intente con otro.");
				dropText.innerHTML = dropText.dataset.text;

				//Se habilitan los elementos del formulario
				Files.state.call(Files.form);
			}
		}).fail(error => Notification.msg(error));
	},

	state: function(){
		let self = this && "tagName" in this && this.tagName == "FORM" ? this : document.querySelector("form");

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
    this.readyState == "complete" && Files.init();
}, false);