FROM php:7.2-fpm-alpine
RUN apk add --update \
		autoconf \
		g++ \
		libtool \
                libjpeg-turbo-dev \
		libpng-dev \
		make \
		freetype-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo pdo_mysql mysqli
