
### Create redis container, its communicate on port 6379 but, no port mapping as it was not required to access from outside00
docker run -idt --name redis redis:alpine

docker container logs redis

docker run -dit --name vote -P schoolofdevops/vote

docker logs -f vote

## Connect vote contaier to redis container, first redis is container name second redis is vote alias
docker run -dit --name vote --link redis:redis -P schoolofdevops/vote
### launch worker
docker run -dit --name worker --link redis:redis -P schoolofdevops/vote-worker
### Doing above task using docker-compose
docker-compose.yaml
```
version: "3"

services:
  vote:
    name: vote
    image: schoolofdevops/vote
    volumes:
      - ./result:/app
    ports: 
      - "5000:80"
      - "5858:5858"
    links: 
      - redis:redis
    networks:
      - front-tier
      - back-tier
    depends_on:
        - redis

  redis:
    container_name: redis
    image: redis:alpine
    ports: ["6379"]
    networks:
      - back-tier

  worker:
    image: schoolofdevops/vote-worker
    links:
      - redis:redis
    networks:
      - back-tier
    depends_on:
      - redis
  
  db:
    image: postgres:9.4
    container_name: db
    volumes:
      - "db-data:/var/lib/postgresql/data"
    networks:
      - back-toer

networks:
  front-tier:
  back-tier

volumes:
  db-data:
```
### Create app stack using docker-compose file
docker-compose up -d
### Consolidated logs
docker-compose logs
