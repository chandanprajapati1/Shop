# Use the official PHP image as base
FROM php:7.4-apache

# Update package lists and install necessary dependencies
RUN apt-get update && apt-get install -y \
    libicu-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    zlib1g-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    libmcrypt-dev \
    libxml2-dev \
    libxslt-dev \
    libonig-dev \
    mysql-client \
    && docker-php-ext-install \
    bcmath \
    ctype \
    curl \
    dom \
    gd \
    intl \
    json \
    mbstring \
    pdo \
    pdo_mysql \
    simplexml \
    soap \
    xml \
    xsl \
    zip

# Enable Apache rewrite module
RUN a2enmod rewrite

# Install MySQL server
RUN apt-get update && apt-get install -y mysql-server

# Copy MySQL configuration file
COPY ./my.cnf /etc/mysql/my.cnf

# Expose ports
EXPOSE 80
EXPOSE 3306
