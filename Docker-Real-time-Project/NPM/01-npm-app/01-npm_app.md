# Test Without docker
npm version
## If not install
```sh
# Install package
npm install

# move src folder
cd C:\Users\raghi\Desktop\Docker\Docker-Real-time-Project\NPM\01-npm-app
# run node app
node src/index.js
# open web page to check app
http://localhost:3000/
```
# With Docker docker init
### Ref 
- *https://docs.docker.com/language/nodejs/containerize/*

```sh
cd C:\Users\raghi\Desktop\Docker\Tutorial\01-npm-app
docker init
docker compose up --build -d 
docker compose down
```
# Use containers for Node.js development
- Adding a local database and persisting data
1. update compose.yaml
```yaml
services:
  server:
    build:
      context: .
    environment:
      NODE_ENV: production
      POSTGRES_HOST: db
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD_FILE: /run/secrets/db-password
      POSTGRES_DB: example
    ports:
      - 3000:3000
    depends_on:
      db:
        condition: service_healthy
    secrets:
      - db-password
  db:
    image: postgres
    restart: always
    user: postgres
    secrets:
      - db-password
    volumes:
      - db-data:/var/lib/postgresql/data
    environment:
      - POSTGRES_DB=example
      - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
    expose:
      - 5432
    healthcheck:
      test: [ "CMD", "pg_isready" ]
      interval: 10s
      timeout: 5s
      retries: 5
volumes:
  db-data:
secrets:
  db-password:
    file: db/password.txt
```
- Configuring your container to run a development environment

- Debugging your containerized application