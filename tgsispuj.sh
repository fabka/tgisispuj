docker build -t tgisispujdb ./MySQL
docker run --name tgisispujdb \
	-v /var/tgisispuj:/var/lib/mysql \
	-p 3306:3306 \
	-e MYSQL_USER=root \
    -e MYSQL_ROOT_PASSWORD=root \
    -e MYSQL_DATABASE=tgisispuj \
    -d tgisispujdb
docker build -t tgisispuj ./Django
docker run --name tgisispuj \
	-p 80:8000 \
	--link tgisispujdb:tgisispujdb \
	-d tgisispuj