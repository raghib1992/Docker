# Test Without docker
npm version
## If not install
npm install
cd C:\Users\raghi\Desktop\Docker\Tutorial\01-npm-app

node src/index.js

http://localhost:3000/

# With Docker docker init
### Ref 
- *https://docs.docker.com/language/nodejs/containerize/*
cd C:\Users\raghi\Desktop\Docker\Tutorial\01-npm-app
docker init
docker compose up --build

# Use containers for Node.js development
- Adding a local database and persisting data
- Configuring your container to run a development environment
- Debugging your containerized application