STATIC_URL="http://pegasus.javeriana.edu.co/static/"

docker build -t tgisispuj ./Python
docker run --name tgisispuj \
	--link tgisispujdb:tgisispujdb \
	-e STATIC_URL=$STATIC_URL \
	-p 80:80 \
	-d tgisispuj
