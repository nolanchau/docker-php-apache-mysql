FROM php:7.2-apache

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Update and install packages.
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

RUN apt-get update -y && apt-get upgrade -y && apt-get install vim zip unzip -y 
RUN apt-get install wget -y

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions gd zip mysqli xdebug

# Extra php's extension
# For more information, see https://github.com/mlocati/docker-php-extension-installer
# Example:
# RUN install-php-extensionns <ext>


# Install Redis.
RUN pecl install -o -f redis\
&&  rm -rf /tmp/pear \
&&  echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini

# Custom config.
COPY ./php/conf.ini /usr/local/etc/php/conf.d/conf.ini
COPY ./php/default.conf /etc/apache2/sites-enabled/000-default.conf


ENTRYPOINT [""]
EXPOSE 80
CMD ["apache2-foreground"]