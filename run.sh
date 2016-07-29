#!/bin/sh
DB_ROOT_PSWD=$(openssl rand -base64 7)
DB_NAME="tgisispujdb"
DB_USER="tgisispujdb"
DB_USER_PSWD=$(openssl rand -base64 7)
printenv

docker build -t tgisispujdb ./MySQL
docker run --name tgisispujdb \
	-v /var/tgisispuj:/var/lib/mysql \
	-p 3306:3306 \
	-e MYSQL_USER=root \
    -e MYSQL_ROOT_PASSWORD=$DB_USER_PSWD \
    -e MYSQL_DATABASE=$DB_NAME \
    -d tgisispujdb

#Tomado de https://github.com/vishnubob/wait-for-it
./wait-for-it.sh \
	-h MYSQL_HOST \
	-p 3306 \
	-t 30

STATIC_URL="http://pegasus.javeriana.edu.co/static/"
docker build -t tgisispuj ./Python
docker run --name tgisispuj \
	--link tgisispujdb:tgisispujdb \
	-e STATIC_URL=$STATIC_URL \
	-p 80:80 \
	-d tgisispuj
