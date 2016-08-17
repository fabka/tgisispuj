#!/bin/sh
MIDDLE_URL="portal" 
NOMBRE_CONTENEDOR="tgisispuj"
NOMBRE_CONTENEDOR_BD=$NOMBRE_CONTENEDOR"db"
NOMBRE_BD=$NOMBRE_CONTENEDOR_BD
DB_USER=$NOMBRE_CONTENEDOR"_user"
DB_USER_PSWD=$(openssl rand -base64 16)
DB_USER_ROOT_PSWD=$(openssl rand -base64 16)

#Contenedor MySQL
docker run --name $NOMBRE_CONTENEDOR_BD \
	-e MYSQL_USER=$DB_USER \
	-e MYSQL_PASSWORD=$DB_USER_PSWD \
	-e MYSQL_ROOT_PASSWORD=$DB_USER_ROOT_PSWD \
	-e MYSQL_DATABASE=$NOMBRE_BD \
        -v /mnt/backUp/pegasus/last/portal:/docker-entrypoint-initdb.d:ro\
	-m 512M\
	-d mysql:5.5 

#Tomado de https://github.com/vishnubob/wait-for-it
./wait-for-it.sh \
	-h $(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $NOMBRE_CONTENEDOR_BD) \
	-p 3306 \
	-t 90

#Contenedor Django
STATIC_URL="http://pegasus.javeriana.edu.co/static/"
docker build -t tgisispuj ./Python
docker run --name tgisispuj \
	--link $NOMBRE_CONTENEDOR_BD:db \
	-e STATIC_URL=$STATIC_URL \
	-e MIDDLE_URL=$MIDDLE_URL \
        -p 192.168.122.1:8084:80\
	-m 512M\
	-d $NOMBRE_CONTENEDOR
