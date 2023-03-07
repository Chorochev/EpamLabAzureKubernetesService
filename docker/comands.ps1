# Build an image
docker build --file DockerFile --tag python-docker .

# View local images
docker images

# Run image
docker run --publish 8080:5000 python-docker

# Stop a docker container
docker stop python-docker