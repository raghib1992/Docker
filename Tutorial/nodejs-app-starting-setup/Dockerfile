# Creating docker image from node base image and copy my source code
FROM node

# creating working directory in container
WORKDIR /app

# Copying all my node js source in containers
COPY . ./

# download all dependecies for my source code
RUN npm install

# exposing port on containers for my app
EXPOSE 80

# Start my server, whenever my container create(this command run in container)
CMD ["node", "server.js"]