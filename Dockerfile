FROM php:7.1.0-apache
#COPY config/php.ini /usr/local/etc/php/
# COPY / /var/www/html/

RUN apt-get -y update && apt-get -y install libghc-postgresql-libpq-dev \
	&& docker-php-ext-configure pgsql -with-pgsql=/usr/include/postgresql/ \
	&& docker-php-ext-install pgsql

RUN apt-get -y update && apt-get -y install php-pear libyaml-dev \
	&& pecl install yaml

RUN rmdir /var/www/html && ln -s /app /var/www/html
RUN chown www-data:www-data /var/www/html
