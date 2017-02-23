FROM php:7.1-apache

RUN apt-get -y update && apt-get -y install \
  git \
  zip \
  unzip \
  libghc-postgresql-libpq-dev \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libmcrypt-dev \
  libpng12-dev \
  && docker-php-ext-install -j$(nproc) iconv mcrypt \
  && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install -j$(nproc) gd \
  && docker-php-ext-configure pgsql -with-pgsql=/usr/include/postgresql/ \
  && docker-php-ext-install pgsql pdo pdo_pgsql

RUN a2enmod rewrite

RUN rmdir /var/www/html && ln -s /app /var/www/html
RUN chown www-data:www-data /var/www/html

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php -r "if (hash_file('SHA384', 'composer-setup.php') === '55d6ead61b29c7bdee5cccfb50076874187bd9f21f65d8991d46ec5cc90518f447387fb9f76ebae1fbbacf329e583e30') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
  && php composer-setup.php \
  && php -r "unlink('composer-setup.php');" \
  && chmod +x composer.phar \
  && mv composer.phar /usr/local/bin/composer

