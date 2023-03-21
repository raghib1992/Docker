## To create container
```
docker run <image-name>
docker container create <image-name>
```
### -d is ffor detach mode(background)
```
docker run -d <image-name>                 
```
### To start interactive session on conatiner -t for tty and -i for interactive
```
docker run -ti <image name>
```
### TO delete container automatically when stop
```
docker run --rm <image>
```

## To check container in docker host
docker ps
docker ps -a                              # for all docker running and exited (--all)
docker ps -a -q                           # Id of all container
docker container ls
docker ps --no-trunc

## To remove or rename container
docker rm <name/ID>
docker rm -f <name/ID>                  # to remove running container by force
docker rename <old name> <new-name>

## Start Stop Map port
# map port to docker host
docker run -d --name <container-name> -p <host-port:jenkins-port> <image-name>

# to stop
docker stop <docker-name>

# to start
docker start <docker-name>


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


















