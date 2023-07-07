/**
 * TABLAS DE DISEÑO ADAPTABLE
 * 
 * Este script adapta a todas las tablas HTML presentes en el documento 
 * a las dimensiones del dispositivo del usuario
 *
 * MODO DE USO: Tablas.load();
 *
 *
 * @author		Alexis López Espinoza
 * @version		1.0
 * @param		None
 */

"use strict";

const Tablas = {
	load: _ => {
		Tablas.th = Tablas.th || [];
		Tablas.nodes = document.querySelectorAll("table");
		Tablas.nodes && Tablas.change();
	},

	change: _ => {
		Tablas.nodes.forEach((tabla, index) => {
			let tr = tabla.querySelectorAll("tbody tr"), //Filas de la tabla
				th,	//Variable que almacenará a la primera cabecera
				thContent = {content: [], padding: []}, //Objeto con el contenido de las cabeceras de la tabla
				ths = tabla.querySelectorAll("th"), //Cabeceras de la tabla
				length; //Variable que almacenará el total de cabeceras

			//Se recorre el conjunto de cabeceras
			ths.forEach(t => {
				//Si la fila tiene contenido
				if (t.innerHTML.length){
					//Se toma el contenido de cada cabecera y se almacena en la propiedad "content" del objeto que contiene un arreglo
					thContent.content.push(t.textContent);

					//Se toma el valor del padding de cada cabecera y se almacena en la propiedad "padding" del objeto que contiene un arreglo
					thContent.padding.push(getComputedStyle(t).padding);
				}
			});

			//Si se guardaron datos de las cabeceras (vista grande)
			if (thContent.content.length){
				//Se añade el objeto al arreglo de cabeceras			
				Tablas.th[index] = thContent;
			}

			//Se toma a la primera cabecera
			th = tabla.querySelector("th");

			//Se calcula el total de cabeceras actuales
			length = tabla.querySelectorAll("th").length;

			//Pantalla chica
			if (window.innerWidth <= 850){
				//Se eliminan los encabezados posteriores al primero
				ths = tabla.querySelectorAll("th");
				if (length > 1) for (let i = 1; i < length; ths[i].parentNode.removeChild(ths[i]), i++);

				//Se borra el texto del primer encabezado
				th.textContent = "";

				//Se quita el padding del primer encabezado
				th.style.padding = 0;

				//Se recorren todas las filas del cuerpo de la tabla
				tr.forEach(f => {
					let td = f.querySelectorAll("td"), //Conjunto de celdas de la fila
						div, //<div> que almacenará todo el contenido de la fila
						arr = [], //Arreglo que almacenará a todos los <div>
						txt; //Variable que almacenará el contenido de la celda

					//Si solo hay una celda en la fila, se pasa a la siguiente iteración
					if (td.length < 2) return;

					//Se recorren todas las celdas de cada fila
					td.forEach((c, i) => {
						//Se toma el texto de la cabecera correspondiente
						txt = Tablas.th[index]?.content[i];

						//Se añaden los contenidos a un nuevo <div>
						div  = "<div>";
						div += txt.length ? "<span><b>" + txt + ":</b></span>" : "";			
						div += c.innerHTML ? "<span class='content'> " + c.innerHTML + "</span>" : "";
						div += "</div>";	

						//Se añade el <div> a un arreglo
						arr.push(div);
					});

					//Se elimina el resto de celdas
					for (let i = 1, l = td.length; i < l; f.removeChild(td[i]), i++);

					//Se limpia la primera celda
					td[0].innerHTML = "";

					//Se insertan todos los <div> a la primera celda
					for (let i = 0, l = arr.length; i < l; td[0].innerHTML += arr[i], i++);
				});				
			}

			//Pantalla grande
			else{
				let c, //Variable que almacenará a cada cabecera nueva
					thead = tabla.querySelector("thead tr"), //Fila de las cabeceras de la tabla
					td, //Variable que almacenará a cada celda
					first, //Variable que almacenará a la primera celda de cada fila
					arr = []; //Arreglo que almacenará el contenido de las celdas

				//Se limpian las cabeceras actuales (en vista chica, solo una)
				thead.innerHTML = "";

				//Se restauran las cabeceras
				Tablas.th[index]?.content.forEach((t, i) => {
					c = document.createElement("th");
					c.textContent = t;
					c.style.padding = Tablas.th[index].padding[i] == "0px" ? "auto" : Tablas.th[index].padding[i];
					thead.appendChild(c);
				});

				//Se hace una copia de los contenidos de cada celda
				tabla.querySelectorAll("tbody tr").forEach((tr, i) => {
					arr[i] = [];
					tr.querySelectorAll("td .content").forEach(c => arr[i].push(c.innerHTML));
				});

				//Se restauran las celdas con sus contenidos
				tabla.querySelectorAll("tbody tr").forEach((tr, i) => {
					first = tr.querySelector("td");
					
					//Si hay contenido para la primera celda, se restaura
					if (arr[0].length){
						first.innerHTML = arr[i][0];

						//Se hace lo mismo con el resto
						for (let j = 1, l = arr[i].length; j < l; j++){
							td = tr.insertCell();
							td.innerHTML = arr[i][j];
						};
					}
				});				
			}
		});
	}
};

window.addEventListener("resize", Tablas.load, false);
window.addEventListener("orientationchange", Tablas.load, false);