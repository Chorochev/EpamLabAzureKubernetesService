######################################################
# build python app
# go to ..\app\
Set-Location app

python3 -m pip install --upgrade pip

python3 -m pip install Flask
python3 -m pip install redis

# create requirements.txt
python3 -m pip freeze > requirements.txt

# run python app localy
# python3 -m flask run

# go back
Set-Location ..

######################################################
# create greetings app image
# Build an image
docker build --file DockerFile --tag greetings:v4 .


# Checking
# Run image
docker run --publish 8000:5000 greetings:v4
# Stop a docker container
docker stop greetings


docker tag greetings:v4 chorochev/greetings:v4
docker push chorochev/greetings:v4


######################################################
# build redis
# go to ..\redis\
Set-Location redis

# Build an image
docker build --file DockerFile --tag greetings-redis:v1 .
	
docker run -v /myredis/conf:/usr/local/etc/redis --name myredis redis redis-server /usr/local/etc/redis/redis.conf

docker run --name redis -d redis