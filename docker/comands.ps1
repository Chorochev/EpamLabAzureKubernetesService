# Build an image
docker build --file DockerFile --tag python-docker .

# View local images
docker images

# Run image
docker run --publish 8000:5000 python-docker

# http://localhost:8000

# Stop a docker container
docker stop python-docker