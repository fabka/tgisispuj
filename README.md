# Aplicación para la gestión de trabajos de grado
## Ingenieria de Sistemas, Pontificia universidad javeriana.
**ES:** Aplicación web que gestiona la información de los trabajos de grado presentados al departamento de ingeniería de sistemas de la Pontificia Universidad Javeriana.
**EN:** Web application for managing degree works of the Pontifical Xavierian University's Systems Engineering department.

Especial agradecimiento a [@davidcalle9430](https://github.com/davidcalle9430) durante el desarrollo del proyecto. 

#Resumen

Este branch está dedicado para pruebas del servidor. Por lo tanto el archivo ejecutable para ejecutar este proyecto es ./run_test.sh. La diferencia radica en el host usado (0.0.0.0) y una parte del script dedicada a poblar la base de datos con datos de prueba. 

#Correr el proyecto
Para correr el proyecto solo es necesario tener instalado [docker](https://docker.com). El proyecto se puede ejecutar desde el archivo **_/run.sh** que desde una consola de linux, sería:
```
./run_test.sh
```

#Importante
Si se quiere guardar una copia de la base de datos se debe ejecutar el siguiente comando antes de parar o matar el contenedor mysql:
```
sudo docker exec -i tgisispujdb bash -c 'mysqldump -p"$MYSQL_ROOT_PASSWORD" tgisispujdb' > MYSQL/dump.sql
```