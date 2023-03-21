ARG

Available inside dockerfile but not accessible in CMD or any other code application

Set arg when build the image
```
docker build --build-arg <value>
```

ENV
available inside docekrfile and in application code 

Set 
```
docker run --env PORT=8000
```

or create env file <.env>

docker run --env-file  ./.env

