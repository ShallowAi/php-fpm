FROM php:fpm

ADD https://github.com/mlocati/docker-php-extension-installer/releases/download/2.12.3/install-php-extensions /usr/bin/install-php-extensions

RUN printf 'Acquire::Retries "5";\n' > /etc/apt/apt.conf.d/80-ci-retries && chmod +x /usr/bin/install-php-extensions

RUN install-php-extensions gd
RUN install-php-extensions zip
RUN install-php-extensions imagick
RUN install-php-extensions intl
RUN install-php-extensions exif
RUN install-php-extensions redis
RUN install-php-extensions mysqli
RUN install-php-extensions opcache
