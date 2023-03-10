# go to ..\docker\python
pip install flask
pip install redis
# run python app
python3 -m flask run
# create requirements.txt
python3 -m pip freeze > requirements.txt

# View local images
docker images
# View local containers
docker ps
# connect to docker container
docker exec -it 212833c20def /bin/sh
	
# docker run -d --name redis -d -p 6379:6379 redis:latest

docker run --name redis -p 6379:6379 redis:latest
docker exec -it redis redis-cli

######################################################
# Build an image
# go to ..\docker
docker build --file DockerFile --tag greetings .

# Run image
docker run --publish 8080:5000 greetings

# Stop a docker container
docker stop greetings

######################################################
docker pull redis:latest
docker run --publish 6379:6379 redis:latest
