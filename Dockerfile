# Set master image
FROM php:7.3-fpm-alpine

# Copy composer.lock and composer.json
COPY composer.json composer.lock /var/www/

# Set working directory
WORKDIR /var/www

# Install Additional dependencies
RUN apk update && apk add --no-cache \
    build-base shadow vim curl postgresql-dev postgresql-client openssl openssh-client \
    nodejs npm yarn \
    freetype-dev \
    libjpeg-turbo-dev \
    libzip-dev \
    zip unzip curl \
    php7-pear php7-dev gcc musl-dev make git \
    php7 \
    php7-fpm \
    php7-common \
    php7-pdo \
    php7-bcmath \
    php7-pdo_pgsql \
    php7-mysqli \
    php7-mcrypt \
    php7-mbstring \
    php7-xml \
    php7-openssl \
    php7-json \
    php7-phar \
    php7-zip \
    php7-gd \
    php7-dom \
    php7-session \
    php7-zlib

# Add and Enable PHP-PDO Extenstions
RUN docker-php-ext-install pdo pdo_pgsql
RUN docker-php-ext-enable pdo_pgsql

RUN pecl install redis \
    && pecl install xdebug \
    && docker-php-ext-enable redis xdebug

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd

RUN docker-php-ext-configure zip --with-libzip=/usr/include
RUN docker-php-ext-install zip

# Install PHP Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer global require hirak/prestissimo

# Remove Cache
RUN rm -rf /var/cache/apk/*

# Add UID '1000' to www-data
RUN usermod -u 1000 www-data

# Copy existing application directory permissions
COPY --chown=www-data:www-data . /var/www

# Change current user to www
USER www-data

RUN composer install --prefer-dist --no-interaction

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]

ENV PATH="~/.composer/vendor/bin:./vendor/bin:${PATH}"
