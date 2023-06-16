"use strict";

let Buttons = {
	init: _ => {
		document.addEventListener("click", e => {
			let elem = e.target;

			//Añadir
			if (elem.classList.contains("add")){
				Buttons.add(elem);
			}

			//Eliminar
			if (elem.classList.contains("del")){
				Buttons.del(elem);
			}
		}, false);
	},

	add: btn => {
		let parent = btn.parentNode.parentNode,
			blocks = parent.querySelectorAll("." + btn.dataset.class),
			next = btn.parentNode.nextElementSibling,
			copy = next.cloneNode(true),
			elems = copy.querySelectorAll("input, textarea, select");

		Buttons.clean(copy);
		parent.insertBefore(copy, blocks[blocks.length - 1].nextElementSibling);
		elems[0].focus();
	},

	del: btn => {
		let parent = btn.parentNode.parentNode,
			actual = btn.parentNode,
			hidden = actual.querySelectorAll("[type=hidden]"),
			blocks = parent.querySelectorAll("." + btn.dataset.class), 
			count = Buttons.countRemove("." + btn.dataset.class),
			id = {}, name;

		//Si hay bloques que pueden clonarse
		if (blocks.length){
			//Si hay elementos ocultos en el bloque
			if (hidden){
				//Si alguno de los elementos ocultos tiene un dato
				if (Buttons.checkContent(hidden)){
					Confirm.go({
						pregunta: "¿Realmente desea eliminar este dato?", 
						callback: _ => {
							Buttons.remove(hidden, btn.dataset.tipo, btn.dataset.modo, btn.dataset.dato, _ => Buttons.removeOrClean(actual, count));
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
				//Si los elementos ocultos están vacíos
				else{
					//Si alguno de los elementos visibles contiene datos
					if (Buttons.checkContent(actual.querySelectorAll("*"))){
						Confirm.go({
							pregunta: "¿Realmente desea eliminar este dato?", 
							callback: _ => Buttons.removeOrClean(actual, count),
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
					//Si ningún elemento visible contiene datos
					else{
						Buttons.removeOrClean(actual, count);
					}
				}
			}
			//Si no hay elementos ocultos
			else{
				//Si alguno de los elementos visibles contiene datos
				if (Buttons.checkContent(actual.querySelectorAll("*"))){
					Confirm.go({
						pregunta: "¿Realmente desea eliminar este dato?", 
						callback: _ => Buttons.removeOrClean(actual, count),
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
				//Si ningún elemento visible contiene datos
				else{
					Buttons.removeOrClean(actual, count);
				}
			}
		}
	},

	remove: (hide, type, modo, dato, callback) => {
		let name, data = {};

		if (type && {}.toString.call(type) !== "[object Function]" && type.length) data['tipo'] = type;
		if (dato && {}.toString.call(dato) !== "[object Function]" && dato.length) data['dato'] = dato;

		//Se almacenan los ID contenidos en los elementos ocultos
		[...hide].forEach(el => {
			if (el.name.indexOf("id_") > -1){
				name = el.name.indexOf("[") > -1 ? el.name.substring(0, el.name.indexOf("[")) : el.name;
				data[name] = el.value;
			}
		});

		//Si hay datos que eliminar de la base de datos
		if (Object.keys(data).length){
			//Se eliminan
			Ajax({
				url: "php/modulos/main/procesar_" + modo + ".php",
				method: "post",
				data: data,
				type: "json"
			}).done(response => {
				if (Base.sessionClosed(response)) return;
				callback && callback();
				Notification.msg("El dato fue eliminado");
			}).fail(error => Notification.msg(error));
		}
		//Caso contrario, se elimina el bloque
		else{
			callback && callback();
		}
	},

	clean: block => {
		//Se limpian los elementos contenidos en el bloque
		[...block.querySelectorAll("*")].forEach(el => {
			switch (el.tagName.toLowerCase()){
				case "input": 
					switch (el.type){
						case "checkbox":
						case "radio":
							el.checked = false;
							break;
						default:
							el.value = "";
							break;
					}
					break;
				case "textarea":
					el.value = "";
					break;
				case "select":
					el.selectedIndex = 0;
					break;
			}
		});
	},

	checkContent: elems => {
		//Se verifica si el elemento contiene un dato o está marcado
		for (let i = 0, l = elems.length; i < l; i++){
			if ("value" in elems[i] && elems[i].value.length){
				return true;
			}

			if ("checked" in elems[i] && elems[i].checked){
				return true;
			}
		}

		return false;
	},

	countRemove: identifier => {
		//Se devuelve el número de elementos que poseen el identificador recibido
		let result = document.querySelectorAll(identifier);
		return "length" in result ? result.length : -1;
	},

	removeOrClean: (block, count) => {
		//Si hay más de un bloque, se elimina el bloque seleccionado
		if (count > 1){
			block.remove();
		}
		//Caso contrario, se limpia el contenido de sus elementos
		else if (count > 0){
			Buttons.clean(block);
		}
	}
};

document.addEventListener("readystatechange", function(){
    this.readyState == "complete" && Buttons.init();
}, false);