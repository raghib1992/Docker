docker version
docker run hello-world
docker create hello-world
docker stop hello-world
docker start hello-world
# to get logs
docker start -a hello-world
docker log <container id>
docker rm <container id>
# Forcefully remove container
docker rm -f <container id>
docker exec -ti <container id> <command>
dockre exec -ti redis-container redis-cli  # i for interactive session STDIN # t for terminal
# container command promt
docker exec -ti <container id> sh
# starting conatiner with shell
docker run -ti busybox sh 

# Create image from Dockerfile
docker build -t <name of image> .
docker build --progress=plain .
docker build --no-cache --progress=plain .
docker build -t <name> -f Dockerfile.dev .


# Create container from docker image
docker run busybox
docker run <docker image> <command to execute inside container>
### To exit after running the command
docker run <docker image> <command to execute inside container> -- --coverage
docker run -e -true <docker image> <command to execute inside container>
docker run -ti <image> <command>
docker run -d -p <localPort>:<>

# Create a new image using docker commit with this command:
# For Linux
docker commit -c 'CMD ["redis-server"]' CONTAINERID
# For Window
docker commit -c "CMD 'redis-server'" CONTAINERID

# Docker Composes
docker-compose up
docker-compose up -d
docker-compose up -d --build # to ensure that rebuild the container
docker-compose down
docker-compose ps

## restart policy in docker-compose
1. "no"
2. always
3. on-failure
4. unless-stopped





