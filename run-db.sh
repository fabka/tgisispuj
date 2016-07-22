DB_ROOT_PSWD=$(openssl rand -base64 7)
DB_NAME="tgisispujdb"
DB_USER="tgisispujdb"
DB_USER_PSWD=$(openssl rand -base64 7)

docker build -t tgisispujdb ./MySQL
docker run --name tgisispujdb \
	-v /var/tgisispuj:/var/lib/mysql \
	-p 3306:3306 \
	-e MYSQL_USER=root \
    -e MYSQL_ROOT_PASSWORD=$DB_USER_PSWD \
    -e MYSQL_DATABASE=$DB_NAME \
    -d tgisispujdb

