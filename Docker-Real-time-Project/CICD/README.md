# Developer --> push code to feature branch in guthub --> Pull Request to MAster Branch --> Travis CI pull the code and test --> Merge the Pull Request to Master --> Deploy it to AWS host (Elastic Beanstalk)

# For Develoment of Project locally
1. Install node js locally in laptop
2. create react project
```
npx create-react-app <project name>
```
3. go project folder
```
cd <project name>
```
4. Run following command
```
npm run start -- Start up development server. for development use only
nppm run test -- Run test associated with project
npm run build -- build the production version of project -- This will create build directory
```
5. Check build/static directory 

# For Developemnt in Container
1. Create Dockerfile
### Name = Dockerfile.dev
```
FROM no
USER node
RUN mkdir -p /home/node/app
WORKDIR /home/node/app
COPY --chown=node:node ./package.json ./
RUN npm install
COPY --chown=node:node ./ ./
CMD ["npm", "run", "start"]
```

### Create docker-compose file
```
version: '3'
services:
  react-app:
    build:
      context: .
      dockerfile: Dockerfile.dev
    ports:
      - "3000:3000"
    volumes:
      - /home/node/app/node_modules
      - .:/home/node/app
```
## Continer for Development Purpose
## Keep editing app file locally and same done in container
1. Create volume and link app script in local to container and keep editing app script locally and same reflect inside the container
```
-v local-directory:container-directory
```
2. To remove any container directory or sub diretory to not to map to local directory and leave it as it is, then
```
-v container-directory
```
# Attach STDIN, STDOUT, STDERR of primary program to local terminal
docker attach <container id >

# To Test


# For Production
## Phase 1
### Build Phase
1. Use node:alpnie (or any)
2. Copy package.josn (or any other file to download dependencies)
3. Install Dependencies
4. Run 'npm run build' (Build the pacakge to run on Production environment)

## Phase 2
### Run Phase
1. Use Nginx (Other web server like Tomcat)
2. Copy Build File
3. Start Nginx

## Dockerfile
```
FROM node:16-alpine as builder
USER node
RUN mkdir -p /home/node/app
WORKDIR /home/node/app
COPY --chown=node:node ./package.json ./
RUN npm install
COPY --chown=node:node ./ ./
CMD ["npm", "run", "build"]

FROM nginx
COPY --from=builder /home/node/app/build /usr/share/nginx/html
```