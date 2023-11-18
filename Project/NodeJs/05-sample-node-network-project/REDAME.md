- This project is for learning purpose.
- Source of this project is Udemy
- REF: *https://www.udemy.com/course/docker-kubernetes-the-practical-guide/learn/lecture/22166778#overview*

# container communication between
1. From www
```
```
2. to Host Machine
```sh
# get host internal
host.docker.internal
```
3. from other container
1. Approch1
- Get container Ip address
```
docker inspect <container name>
```
- Paste ip to host domain name in app file


2. Approach2
- Create network
```
docker network create <name>  
```
- add all container to same network
```
--network <name>
```
- Use container name in place of host name in app file