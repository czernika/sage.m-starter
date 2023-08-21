#!/bin/bash

set -x

CORE_PATH=/app/www
THEME_PATH=/app/theme
WP_CORE_PATH="${CORE_PATH}/web/wp"

yellow='\033[1;33m'
reset='\033[0m'

if wp plugin is-installed redis-cache --path=${WP_CORE_PATH}; then
    echo -e "${yellow}Redis cache plugin already installed. Skipping...${reset}"
    exit 0
fi

echo -e "${yellow}Enabling Redis cache...${reset}"

wp plugin install redis-cache --activate --path=${WP_CORE_PATH}

CONFIG_FILE="${CORE_PATH}/config/environments/development.php"

if [ ! $(grep -q 'Redis Object Cache settings' ${CONFIG_FILE}) ]; then
cat << EOT >> ${CONFIG_FILE}

/**
 * Redis Object Cache settings
 */
Config::define('WP_REDIS_HOST', 'cache');
Config::define('WP_REDIS_PORT', 6379);
EOT
fi

wp redis enable --path=${WP_CORE_PATH}
