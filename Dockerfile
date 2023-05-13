FROM php:7.4-apache

WORKDIR /var/www/html/presentacion

COPY ./ /var/www/html


RUN apt-get update && apt-get install

RUN docker-php-ext-install pdo pdo_mysql




EXPOSE 80

