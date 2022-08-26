Backend server user node js  code and communicate with mongodb and frontend

Frintend is React one page web app


cerate docker network
```
docker network create fav-net
```
Dockerizing Mongo DB
```
docker run -d --name mongodb --network fav-net --rm -p 27017:27017 -v data:/data/db -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=root mongo
```

Dockerizing backned
Create backend image
Dockerfile
```
FROM node

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 80

CMD ["node", "app.js"]
```

Create image
```
docker build -t node:v1 .
```

Run container
```
docker run -d --name node --network fav-net -p 80:80 --rm node:v1
```

Containerizing frontend application
Create dockerfile
```
FROM node

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
```
Create image from dockerfile
``
docker build -t goal-react:v1 .
```

create container
```
docker run -d --name goal -p 3000:3000 --network fav-net --rm -ti goal-react:v1
```
to make node container restart whenever code changes
bind volume
"devdependencies": {
    "nodemon": "^2.0.4"
}

Inscripts section
add
"start": "nodemon app.js"

In Dockerfile 
CMD ["npm", "start"]

make node app dynamic adding mongo username and password
`mongodb://${process.env.MONGO_USERNAME}:${process.env.MONGO_PASSWORD}@mongodb:27017/course-goals?authSource=admin`


Dockerfile
ENV MONGO_USERNAME=root
ENV MONGO_PASSWORD=secret