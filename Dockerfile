From ubuntu:20.04
RUN apt-get update
RUN sudo apt -y install software-properties-common \
-------
FROM php:7.4-fpm

WORKDIR /tmp

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

RUN apt-get update \
    && apt-get install -y git \
                          lsb-release \
    && git clone https://github.com/BlexrDevOps/happs.git

ADD https://repo.mysql.com//mysql-apt-config_0.8.13-1_all.deb /tmp

RUN dpkg -i mysql-apt-config_0.8.13-1_all.deb

-------
FROM php:7.1.1

WORKDIR /tmp

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');"

RUN mv composer.phar /usr/local/bin/composer

RUN apt-get update \
    && apt-get install -y git \
    && git clone https://github.com/BlexrDevOps/happs.git

RUN apt-get install -y mysql-server mysql-client

-------
FROM php:7.3-apache
#Install git
RUN apt-get update \
    && apt-get install -y git
RUN docker-php-ext-install pdo pdo_mysql mysqli
#Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=. --filename=composer
RUN mv composer /usr/local/bin/
EXPOSE 80
----------------
FROM mysql:8.0-debian

# Select the Working directory
WORKDIR /tmp

# Install git and clone app repo
RUN apt-get update \
    && apt-get install -y git \
    && git clone https://github.com/BlexrDevOps/happs.git

# Install php
RUN apt-get -y install php7.4

# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer

ENV MYSQL_ROOT_PASSWORD password
ENV MYSQL_DATABASE happs

EXPOSE 3306