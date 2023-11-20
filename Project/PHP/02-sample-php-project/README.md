Docker-compse use for this project

1. nginx server
- create nginx services in docker-compose file
2. Create php
3. Create Mysql
4. Create composer
5. Create laravel project using utility-container composer
- REF for documentation: *https://laravel.com/docs/10.x*
- Create project
```
docker-compose run --rm composer create-project --prefer-dist laravel/laravel .
```
- Update src/.env file
```
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=homestead
DB_USERNAME=homestead
DB_PASSWORD=secret
```
- Start other services
```
docker-compose up -d server mysql php
```
- down 
```
docker-compose down
```
- up
```
docker-compose up -d server
```
- Force to rebuild image
```
docker-compose up -d --build server
```
6. Add artisan
7. Add npm
8. Create artisan 
- make sure server, php and mysql services are runing
```
docker-compose run --rm artisan migrate
```