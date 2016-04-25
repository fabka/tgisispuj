docker run --name tgisispujdb \
	-v /var/tgisispuj:/var/lib/mysql \
        -e MYSQL_ROOT_PASSWORD=root \
        -e MYSQL_DATABASE=tgisispuj\
        -d mysql:5.7

docker build -t tgisispuj ./Django
docker run --name tgisispuj \
	-p 80:8000 \
	--link tgisispujdb:tgisispujdb \
	-d tgisispuj
