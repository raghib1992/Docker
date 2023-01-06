## BIND Volumes define while creating a container
```
docker run -d -v <path-in-host>:<path-in-container> --name <container-name> -e "test=123" -p 3306:3306 mysql:5.7  # andsame command is used to map back the volumes into container
```

## NORMAL Volumes
## to create volume in host
```
docker volume create <directory-name>    # this volume create in docker root directory
docker volume ls                         # to list volumes (cannot list bind volumes)

docker run -d -v <volume-name>:<path-to-container> --name <container-name> -p <host-port>:<container port> <image-name>   #in volume data directory contain all data of container 
```
## anonymous volumes
### Dont provide specif folder or location where we can find data and temporary
``` 
docker volume rm <ID>                   # to remove volume
``` 
## to create anonymous volume
```
docker run -d -v <folder in container> --name <container name> <image-name:tag>
```
## to find the anonymous volume
```
docker inspect <container-name/ID>
          "Mounts":
              Name: <anonymous volume name>
```

## to remove volume use flag while destroying container
```
docker rm -fv <container-name/ID>
```
## Dockerfile
```
VOLUME /var/www/html    # to copy the maention contenet in anonymous volume
```
## to get the list of dangling volume
```
docker volume ls -f=dangling=true
docker volume rm $(docker volume ls -f=dangling=true -q)
```
## execute command in container without entering into it i.e. is from host
```
docker exec <container-name> bash -c "command"
```