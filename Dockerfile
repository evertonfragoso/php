FROM php:7.1-apache

RUN apt-get -y update && apt-get -y install libghc-postgresql-libpq-dev \
  && docker-php-ext-configure pgsql -with-pgsql=/usr/include/postgresql/ \
  && docker-php-ext-install pgsql

RUN a2enmod rewrite

RUN rmdir /var/www/html && ln -s /app /var/www/html
RUN chown www-data:www-data /var/www/html
