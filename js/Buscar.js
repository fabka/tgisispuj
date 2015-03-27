
function buscar(nombre){
tabla= document.getElementById('tblTabla');
filas= tabla.rows;
for (var i = filas.length - 1; i >= 1; i--) {
	alert(filas[i].cells[1].textContent);
	if(filas[i].cells[2].textContent != nombre){
		tabla.deleteRow(i);
	}
}
}

