#!/bin/sh
DB_ROOT_PSWD=$(openssl rand -base64 7)
NOMBRE_CONTENEDOR="tgisispuj"
NOMBRE_CONTENEDOR_BD=$NOMBRE_CONTENEDOR"db"
NOMBRE_BD=$NOMBRE_CONTENEDOR_BD
DB_USER="root"
DB_USER_PSWD=$(openssl rand -base64 7)
DB_USER_ROOT_PSWD=$(openssl rand -base64 7)

#Contenedor MySQL
docker build -t $NOMBRE_CONTENEDOR_BD ./MySQL
docker run --name $NOMBRE_CONTENEDOR_BD \
	-e MYSQL_USER=$DB_USER \
	-e MYSQL_ROOT_PASSWORD=$DB_USER_ROOT_PSWD \
	-e MYSQL_DATABASE=$NOMBRE_BD \
	-d $NOMBRE_CONTENEDOR_BD

#Tomado de https://github.com/vishnubob/wait-for-it
./wait-for-it.sh \
	-h MYSQL_HOST \
	-p 3306 \
	-t 30

#Contenedor Django
STATIC_URL="http://pegasus.javeriana.edu.co/static/"
docker build -t tgisispuj ./Python
docker run --name tgisispuj \
	--link tgisispujdb:tgisispujdb \
	-e STATIC_URL=$STATIC_URL \
	-p 80:80 \
	-d tgisispuj
