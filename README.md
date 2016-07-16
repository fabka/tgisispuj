# Trabajos de grado, Ingenieria de Sistemas
## Pontificia universidad javeriana.
**ES:** Página web para los trabajos de grados del departamento de ingeniería de sistemas de la Pontificia Universidad Javeriana.

**EN:** Website for degree works of the Pontifical Xavierian University's Systems Engineering department.

Especial agradecimiento a [@davidcalle9430](https://github.com/davidcalle9430) durante el desarrollo del proyecto. 

#Resumen

El backend del proyecto está realizado en Django conectado a una base de datos sql, el front end está hecho con **html5** **css3** y *javascript** utilizando **JQuery**. Las versiones necesarias para el buen funcionamiento se describen en el archivo **_/Django/requirements.txt_** sin embargo se muestran a continuación.

```
Django:1.9
Pillow:2.3.0
mysqlclient:1.3.6
```

#Correr el proyecto
Para correr el proyecto solo es necesario tener instalado [docker](https://docker.com). El proyecto se puede ejecutar desde el archivo **_/run.sh** que desde una consola de linux, sería:
```
./run.sh
```

#Información
Los datos mostrados en la página web corresponden a los trabajos de grado de pregrado y maestría del departamento de Ingeniería de sistemas de la Pontificia Uiversidad Javeriana. Ademas de la tabla, la información de los trabajos de grado se puede obtener a través de **_http://pegasus.javeriana.edu.co/api_**.
##Filtros
La aplicación cuenta con los siguientes filtros:
- **general:** Busca en los nombres de los trabajos de grado, el nombre de los autores y/o sus directores
- **modalidad:** Modalidad del trabajo de grado (aplicación, emprendimiento o investigación)*.
- **grupoInvestigacion:** Grupo de investigación al que pertenece el trabajo de grado (ISTAR, SIDRE, TAKINA)*
- **mencionHonor:** Indica si el trabajo de grado obtuvo reconocimiento. (Sí, no, por definir)*
- **anio:** Año de presentación del trabajo de grado. (desde 2004)
- **semestre:** Periodo académico en el cual se presentó el trabajo de grado (1 o 3)
- **tituloAplicado:** Indica a que título está optando el autor del trabajo de grado (Pregrado o maestría)*.

\*Valores sujetos a cambios.

Es decir que una solicitud se debería realizar de la siguiente forma
```
http://pegasus.javeriana.edu.co/api/busqueda?general='foo'&modalidad=foo&grupoInvestigacion=foo&mencionHonor=foo&anio=foo&semestre=foo&tituloAplicado=foo;
```

Por ejemplo la petición
```
http://pegasus.javeriana.edu.co/api/busqueda?general=&modalidad=&grupoInvestigacion=&mencionHonor=&anio=2015&semestre=3&tituloAplicado=
```
Encontraría los trabajos de grado realizados en el 2015 durante el tercer periodo académico.

