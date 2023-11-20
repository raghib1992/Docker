# Project Ref
- This project is for learning purpose.
- Source of this project is Udemy
- REF: *https://www.udemy.com/course/docker-kubernetes-the-practical-guide/learn/lecture/22166778#overview*


# To Run application locally
1. Setup mongodb locally
2. Create backend application
- install dependencies
```sh
npm install
```
- Start application
```sh
node app.js
```
3. Create frontend
- install dependencies
```sh
npm install
```
- Start application
```sh
npm start
```

# To Run Application in Container
1. Create mongodb container
```
docker run -d -p 27017:27017 --name mongo mongo
```
2. Create backend
- Write dockerfile
- Create Image
```
docker build -t backend:1 .
```
- create container
```
docker run -d -p 80:80 --name goal-backend --rm backend:1
```
3. Create frontend
- Write dockerfile
- Create Image
```
docker build -t frontend:1 .
```
- create container
```
docker run -d -p 3000:3000 --name goal-frontend --rm frontend:1
```