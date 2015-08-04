<html>
    <head>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        <title>Trabajos de grado | Ingeniería de sistemas | Pontificia Universidad Javeriana</title>
        <meta name = "viewport" content="width=device-width, initial-scale=1.0">
        <link href = "css/Tablas.css" media="screen" rel="StyleSheet" type="text/css">
        <script src = "js/TablaScript.js"></script>
        <script type = "text/javascript" src="js/ext/jquery-1.8.2.min.js"></script>
        <script type = "text/javascript" src="js/buscar-en-tabla.js"></script>
        <script type = "text/javascript" src="js/FileRead.js"></script>
    </head>
    <body>
        <div>
            <div class="divEnLinea">
                <img src="Imagenes/JaveBanner.jpg" alt="Logo javeriana" >
            </div>
            <div class="divEnLinea">
                <h1>
                    Trabajos de grado <br>
                    Ingenierí­a de sistemas <br>
                    Pontificia Universidad Javeriana <br>
                </h1>
            </div>
        </div>

        <div id="Links" >
            <label>Filtrar Por año |</label>
            <a href="2004.html" > 2004 </a>
            <label>|</label>
            <a href="2005.html" > 2005 </a>
            <label>|</label>
            <a href="2006.html" > 2006 </a>
            <label>|</label>
            <a href="2007.html" > 2007 </a>
            <label>|</label>
            <a href="2008.html" > 2008 </a>
            <label>|</label>
            <a href="2009.html" > 2009 </a>
            <label>|</label>
            <a href="2010.html" > 2010 </a>
            <label>|</label>
            <a href="2011.html" > 2011 </a>
            <label>|</label>
            <a href="2012.html" > 2012 </a>
            <label>|</label>
            <a href="2013.html" > 2013 </a>
            <label>|</label>
            <a href="2014.html" > 2014 </a>
            <br>
            <a href="MencionDeHonor.html" > Mostrar solo mencion de honor </a>
            <label>|</label>
            <a href="Index.html" > Sin filtro </a>
            <br>
            <br>
        </div>

        <br>
        <div>

            <!--
            <script type="text/javascript">
                genera_tabla();
                leer();
            </script>
            -->

            <div id="buscar">
                <label for="txtBuscar">Buscar: </label>
                <input type="search" id="txtBuscar" autofocus
                placeholder="Digite el texto que desea encontrar y presione la ENTER. Para cancelar la tecla ESCAPE.">
            </div>

            <br>
            <table id="tblTabla" >
                <thead>
                    <td> Codigo </td>
                    <td> Nombre trabajo de grado </td>
                    <td> Autores </td>
                    <td> Director </td>
                    <td> Grupo </td>
                    <td> Mención </td>
                    <td> Año entrega </td>
                    <td> Pagina web </td>
                    <td> Modalidad </td>
                </thead>

                <tbody>


        <?php
            header('Content-type: text/html; charset=utf-8');

            $servername = "127.0.0.1";
            $username = "root";
            $password = "tgisispuj";
            $dbname = "TGISISPUJ";

            // Create connection
            $conn = new mysqli($servername, $username, $password, $dbname);
            $conn->set_charset('utf8');
            // Check connection
            if ($conn->connect_error) {
                echo "error de coneción";
                die("Connection failed: " . $conn->connect_error);
            }

            $sql = "SELECT * FROM trabajosGrado";
            $result = $conn->query($sql);


            if ($result->num_rows > 0) {
                // output data of each row
                while($row = $result->fetch_assoc()) {
                    //fila
                    echo "<tr height=34 style='height:25.5pt' class=\"row\">";
                    echo " <td height=34 class=xl74 width=90 style='height:25.5pt;width:68pt' class=\"code\">". $row["code"]."</td>";
                    echo " <td height=34 class=xl74 width=90 style='height:25.5pt;width:68pt' class=\"name\">". $row["name"]."</td>";
                    echo " <td height=34 class=xl74 width=90 style='height:25.5pt;width:68pt' class=\"authors\">". $row["authors"]."</td>";
                    echo " <td height=34 class=xl74 width=90 style='height:25.5pt;width:68pt' class=\"director\">". $row["director"]."</td>";
                    echo " <td height=34 class=xl74 width=90 style='height:25.5pt;width:68pt' class=\"branch\">". $row["branch"]."</td>";
                    echo " <td height=34 class=xl74 width=90 style='height:25.5pt;width:68pt' class=\"modality\">". $row["modality"]."</td>";
                    echo " <td height=34 class=xl74 width=90 style='height:25.5pt;width:68pt' class=\"mention\">". $row["mention"]."</td>";
                    echo " <td height=34 class=xl74 width=90 style='height:25.5pt;width:68pt' class=\"year\">". $row["year"]."</td>";
                    echo " <td height=34 class=xl74 width=90 style='height:25.5pt;width:68pt' class=\"website\">". $row["website"]."</td>";

                    echo "</tr>";
                    //fin fila

                }
            } else {
                echo "0 results";
            }
            $conn->close();
        ?>

                </tbody>
            </table>
        </div>
    </body>
</html>
