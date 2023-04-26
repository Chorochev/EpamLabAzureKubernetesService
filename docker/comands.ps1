# go to ..\docker\python
pip install flask
pip install redis
# run python app
python3 -m flask run
# create requirements.txt
python3 -m pip freeze > requirements.txt

######################################################
# Build an image
# go to ..\docker
docker build --file DockerFile --tag python-docker .

# View local images
docker images

# Run image
docker run --publish 8080:5000 python-docker

# Stop a docker container
docker stop python-docker

# update version
docker tag chorochev/simple-python-app-service:latest chorochev/simple-python-app-service:v1
docker push chorochev/simple-python-app-service:v1

# Create a tag for the image
docker tag python-docker chorochev/simple-python-app-service:latest

# Download the image to DockerHub
docker push chorochev/simple-python-app-service:latest
