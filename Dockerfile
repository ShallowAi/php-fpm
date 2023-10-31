FROM php:8.1-fpm
# 快速安装PHP拓展脚本
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/bin/
# 安装所需拓展
RUN chmod +x /usr/bin/install-php-extensions \
    && install-php-extensions gd zip imagick intl exif redis mysqli pdo_mysql\
    && docker-php-ext-enable opcache
