FROM php:8.0-apache

WORKDIR /var/www/html

COPY ./index.php ./index.php

HEALTHCHECK --interval=10s --timeout=3s \ 
  CMD curl -f http://localhost/ || exit 1

EXPOSE 80