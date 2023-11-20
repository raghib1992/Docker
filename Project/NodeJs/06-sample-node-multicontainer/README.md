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
0. **Create Network**
```sh
docker network create goals-net
```
1. **Create mongodb container**
- Simaple container
```
docker run -d -p 27017:27017 --name mongo mongo
```
- Container with data persistence and security
```sh
docker run -d -v data:/data/db --rm --name mongodb --network goals-net -e MONGO_INITDB_ROOT_USERNAME=raghib -e MONGO_INITDB_ROOT_PASSWORD=secret mongo
```
2. **Create backend**
- Write dockerfile
- Edit host name in app.js
```sh
# to connect db in localhost
'mongodb://host.docker.internal:27017/course-goals'

# to connect to container with cred
'mongodb://raghib:secret@mongodb:27017/course-goals?authSource=admin'

# Pass username and password as ENV value
`mongodb://${process.env.MONGODB_USERNAME}:${process.env.MONGODB_PASSWORD}@mongodb:27017/course-goals?authSource=admin`

# Add ENV value in Dockerfile
ENV MONGODB_USERNAME=root
ENV MONGODB_PASSWORD=secret
```
- Create Image
```sh
docker build -t backend:latest .
```
- create container
```sh
# Create container with network
docker run -d -p 80:80 --name goal-backend --network goals-net --rm backend:latest
# Create container with bind mount volume forlive code update
docker run -d -p 80:80 --name goal-backend -v "C:\Users\raghi\Desktop\Docker\Project\NodeJs\06-sample-node-multicontainer\backend:/app" -v logs:/app/logs -v back:/app/node_modules --network goals-net --rm backend:latest

# add env value
docker run -d -p 80:80 --name goal-backend -v "C:\Users\raghi\Desktop\Docker\Project\NodeJs\06-sample-node-multicontainer\backend:/app" -e MONGODB_USERNAME raghib -v logs:/app/logs -v back:/app/node_modules --network goals-net --rm backend:latest
```
- To make application restart for every change
    - Add in package.json
```json
//In script section
"start": "nodemon app.js"
// new section
"devDependencies": {
    "nodemon": "^2.0.4"
}
```
    - In dockerfile
```sh
CMD ["npm", "start"]
```
3. **Create frontend**
- Write dockerfile
- Create Image
```sh
docker build -t frontend:latest .
```
- create container
```sh
docker run -d -p 3000:3000 -v "C:\Users\raghi\Desktop\Docker\Project\NodeJs\06-sample-node-multicontainer\frontend\src:/app/src" --name goal-frontend --rm frontend:latest
```