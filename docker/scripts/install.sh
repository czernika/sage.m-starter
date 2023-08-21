#!/bin/bash

set -x

sudo chown -R vscode:www-data /app

CORE_PATH=/app/www
THEME_PATH=/app/theme
WP_CORE_PATH="${CORE_PATH}/web/wp"

yellow='\033[1;33m'
reset='\033[0m'

if wp core is-installed --path=${WP_CORE_PATH}; then
    echo -e "${yellow}WordPress already installed. Exiting...${reset}"
    exit 0
fi

echo -e "${yellow}Installing WordPress...${reset}"

# Source env variables
. ${THEME_PATH}/.env

# Install WordPress core
composer -d ${CORE_PATH} create-project roots/bedrock . --prefer-dist

cp ${THEME_PATH}/.env ${CORE_PATH}

cd ${CORE_PATH}

wp core install --url=${WP_HOME} --title="${APP_TITLE}" --admin_user=${APP_ADMIN_USER} --admin_password=${APP_ADMIN_PASSWORD} --admin_email=${APP_ADMIN_EMAIL} --skip-email

wp language core install ${APP_LOCALE} --activate

wp rewrite structure '%postname%' --hard

wp package install aaemnnosttv/wp-cli-dotenv-command:^2.0
wp dotenv salts regenerate

ln -fs ${THEME_PATH}/sage ${CORE_PATH}/web/app/themes

wp theme activate sage

# Install theme dependencies
cd ${THEME_PATH}/sage

if [ ! -f '.env' ]; then
    sed -i "s/APP_URL='127.0.0.1'/APP_URL='${WP_HOME}'/" .env.example
    cp .env.example .env
fi

composer install --optimize-autoloader --prefer-dist --no-interaction

pnpm install && pnpm build

wp plugin install query-monitor --activate
