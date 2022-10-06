### to check docker version
docker -v
### To get the docker client and docker server version
docker version
### to get the system info 
docker system info
### to check the events while creating a container
docker events

### To create container
```
docker run <image-name>
docker run -d <image-name>         # -d for detach mode(background)
docker container create <image-name>
docker run -d --name <container-name> -p <host-port:container-port> <image-name>
```
```
docker container run <image name>
docker container run -i (interactive) -t (tty) <image name> sh
```
## To check container in docker host
docker ps
docker ps -l    # for latest container
docker pa -n 2  # latest 2 continer
docker ps -a    # for all docker running and exited (--all)
docker ps -q    # Id of all container
docker container ls         # same as docker ps
docker ps --no-trunc


## to enter into container
docker exec -ti <id/name> /bin/bash
## to run a command insde container 
docker exec <id/name> <command>

### To pause the container, it stop the app, but conatiner will not die
docker pause <id/name>
docker unpuase <id/name>

### To stop Container
docker stop <id/name>
docker start <id/name>

### disk uasge
docker system df

## To remove or rename container
docker rm <name/ID>
docker rm -f $(docker ps -a -q)
docker rm -f <name/ID>                  # to remove running container by force
docker rename <old name> <new-name>

## map port to docker host
docker run -idt -P <image name>
docekr run -d -p 8080:8080 <image name>

### To rename docker 
docker rename <id/name> new-name

### Inspect docker detials
docker inspect <name/id>

## CGroup 
### How much resources consumed by comtainer
docker stats

###  update the memory usage by contanier
docker update -m 400M <container name/ID>
docker update --cpu-shares 512 <id/name>
docker run -dit <container name> --cpu-shares=1024 <image> <app> --cpu 1

**********************************************************
# Build Image
## Imperative way (Java Image)
### Base Centos

1. Install jdk
2. install mvn
3. mvn compile
### Base java and mvn image
1. clone source code from github repo
```
git clone https://github.com/schoolofdevops/voting-app-worker.git
```
2. run docker container
```
docker run -tid --name interim schoolofdevops/voteapp-mvn:v0.1.0
```
3. copy src code to container
```
docker cp voting-app-worker/src interim:/code
```
4. connect to container
```
docker exec -ti iterim sh
```
5. build package
```
cd /code
mvn --version
mvn package
java -version
java -jar target/worker-jar-with-dependencies.jar
```
6. commit the
```
docker login
docker commit interim raghib1992/voteworker:v1
```
7. To check docker image details
```
docker image history <image id/name>
```
```
docker image inspect <image id/name>
```
8. test the image
```
docker run -tid raghib1992/voteworker:v1 java -jar target/worker-jar-with-dependencies.jar
```
```
docker ps -l
docker logs <container id>
```
9. Push the image to registry
```
docker login
docker image push raghib1992/vote-worker:v1
```
## Dockerfile
```
FROM schoolofdevops/voteapp:v0.1.0

WORKDIR /code

COPY pom.xml /code/
COPY src/main /code/src/main

RUN mvn package

CMD ["java", "target/worker-jar-with-dependencies.jar"]
```
### Create image from 
```
docker image build -t raghib1992/vote-wrker:v2 .
```

### docker image build without using cache
```
docker image build --no-cache -t raghib1992/vote-wrker:v2 .
docker image push raghib1992/vote-wrker:v2
```
### docker image list
```
docker image ls
```
### to clean danggling image
```
docker image prune
```
*************************************
# Network
1. Bridge Network
2. Host Nwtwork
3. No Network

## Inspect Default Network
### List the network
docker network ls

docker network inspect bridge

docker network -d bridge <network name>

### Create container to attach to your new network
docker run -itd --network app-net <image>

docker run -itd --network none <image>

docker run -itd --network host <image>

************************************************

## Variable in container
docker run -d -e --name <container-name> "test=<value>" <image-name>    # to pass env for container
env | grep test                                 # to check var

## test container
docker inspect <container-name/ID>
 
 ## Apply limit
docker run -d --name <container-name> --memory "200mb" --cpuset-cpus 0-1 <image-name> 
 0-1        Range
 0,3        0 and 3
 # check your docker host resources
 free -h
 
 # check no. of CPU
 grep "model name" /proc/cpuinfo |wc -l
 
 # to check the resources container using
 docker stats <ID/container-name>
 
## Enter into container
docker exec -ti <container-name> bash  #bash terminal we use here

exit  # back to machine

## copy file in running container
docker cp <file-name> container-name:<path-of-directory-in-container>

## copy file from conatiner to host
docker cp container-name:<path/file> <path/host>

## Turn container into image
docker commit <ID/Container-name> <image-name:tag>


## CMD in creating  (after image name)
docker run -d --name centos -p 80:80 <image-name> python -m SimpleHTTPServer 80 


## Destroy container automatically when we exit container
docker run --rm -ti centos bash    # to go inside container to test and destroy when you exit


## Change docker root location
docker info    # information about info
/var/lib/docker   # default docker root directory

#stop all container
docker stop $(docker ps -a -q)

# stop docker service
sudo systemctl stop docker

#edit docker.service file
sudo vi /lib/systemd/system/docker.service  # contain all configuration
ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock -data-root /mnt/docker

# restar daemon
systemctl daemon-reload

# restart docker
systemctl restart docker

# to check
docker info |grep -i root

# clear /mnt directory
rm -rf /mnt

# move docker file to mnt directory
mv docker /mnt

# restart docker services
systemctl restart docker


















