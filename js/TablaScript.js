/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function genera_tabla() {
    // Obtener la referencia del elemento body
    var body = document.getElementsByTagName("body")[0];

    // Crea un elemento <table> y un elemento <tbody>
    var tabla   = document.createElement("table");
    var cabeza = document.createElement("thead");
    var cuerpo = document.createElement("tbody");
    
    var c = ["Codigo", "Nombre trabajo de grado", "Autores", "Director", 
        "Grupo", "Mención", "Año entrega", "Pagina web"];
    
    var fila = document.createElement("tr");
    for( i=0; i<c.length; i++){
        var celda = document.createElement("td");
        var textoCelda = document.createTextNode(c[i]);
        celda.appendChild(textoCelda);
        fila.appendChild(celda);
    }
    cabeza.appendChild(fila);
    tabla.appendChild(cabeza);
    
    // Crea las celdas
    for (var i = 0; i < 2; i++) {
      // Crea las hileras de la tabla
      var hilera = document.createElement("tr");

      for (var j = 0; j < 2; j++) {
        // Crea un elemento <td> y un nodo de texto, haz que el nodo de
        // texto sea el contenido de <td>, ubica el elemento <td> al final
        // de la hilera de la tabla
        var celda = document.createElement("td");
        var textoCelda = document.createTextNode("celda en la hilera "+i+", columna "+j);
        celda.appendChild(textoCelda);
        hilera.appendChild(celda);
      }

      // agrega la hilera al final de la tabla (al final del elemento tblbody)
      cuerpo.appendChild(hilera);
    }
    
    // posiciona el <tbody> debajo del elemento <table>
    tabla.appendChild(cuerpo);
    // appends <table> into <body>
    body.appendChild(tabla);
    // modifica el atributo "border" de la tabla y lo fija a "2";
    tabla.setAttribute("border", "2");
}

function leer(){
    var file = fopen( "tablas/prueba.txt", "r" );
    var file_length = flength(file); 
    var content = fread(file, file_length); 
    console.log("Hola");
    document.getElementById("miDiv").innerText = content;
}