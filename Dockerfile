FROM php:8.2-fpm

ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN apt-get update && apt-get -y install --no-install-recommends \
        ghostscript \
        libfreetype6-dev \
        libjpeg-dev \
        libmagickwand-dev \
        libpng-dev \
        libzip-dev \
        mariadb-client \
        less \
        nano \
        zip \
        unzip \
        cron \
        git

# Install PHP extensions
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions \
    mysqli \
    pdo \
    pdo_mysql \
    dom \
    exif \
    igbinary \
    imagick \
    intl \
    mbstring \
    openssl \
    xml \
    zip \
    opcache \
    redis \
    bcmath \
    filter \
    iconv \
    simplexml \
    gd \ 
    xdebug \
    ssh2 \
    ftp \
    sockets

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer clear-cache

# Install WP Cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# Install NodeJS
RUN apt-get update && apt-get install -y ca-certificates curl gnupg sudo

RUN mkdir -p /etc/apt/keyrings

RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
    && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_18.x nodistro main" > /etc/apt/sources.list.d/nodesource.list

RUN apt-get update && apt-get install -y nodejs \
    && npm install -g npm \
    && npm install -g pnpm

# Create user
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Cleanings
RUN apt-get -y autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

USER $USERNAME

# In case of changes run `docker compose up --build --force-recreate`
