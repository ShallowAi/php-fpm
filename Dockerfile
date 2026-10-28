FROM php:fpm

# 快速安装PHP拓展脚本
# Official source, pinned: a floating "latest" pulls installer code that was
# never built with this Dockerfile, and the pinned URL stays cacheable.
ADD https://github.com/mlocati/docker-php-extension-installer/releases/download/2.12.3/install-php-extensions /usr/bin/install-php-extensions

# Acquire::Retries: deb.debian.org intermittently drops connections from CI
# runners, and the installer's bare `apt-get update` aborts the whole build.
RUN printf 'Acquire::Retries "5";\n' > /etc/apt/apt.conf.d/80-ci-retries \
    && chmod +x /usr/bin/install-php-extensions \
    && install-php-extensions gd zip imagick intl exif redis mysqli opcache
