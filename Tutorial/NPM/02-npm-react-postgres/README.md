# App Workflow

- *ReactJS* --> *NodeJS* --> *Postgres DB*

## Install Postges DB

- **PostgreSQL DB COntainer**
- *Postgresql base image --> Init Scripts --> Latest DB Backup --> Dockerfile --> Build Image --> Launch Container*

### Steps
1. Create Dockerfile
2. Create scripts/initial_setup.sh
3. Create scripts/postgres.conf.sample
4. Build image
```
docker build -t postgresk8s:14-alpine .
```
5. Create container
```
docker run -d --name postgres -e POSTGRES_USER=postgres -e POSTGRES_DB=k8sengineers -e POSTGRES_PASSWORD=test12345 -v psql-data:/var/lib/postgresql postgresk8s:14-alpine
```

## Insdockr tall NodeJS
- Node base Image --> ENV File --> Dockerfile --> Build Image --> launch Container

1. Create Dockerfile
2. Update .env
3. Create docker image
```
docker build -t k8sbacken:18-alpine .
```
4. Launch conatainer
```
docker run 0d --name k8sbackend 
```

