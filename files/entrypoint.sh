#!/bin/sh
# Add user stuff
useradd -U -m -u ${DEFAULT_USER_UID} -G sudo,www-data -d /home/magento ${DEFAULT_USER}
sed -i "s/user www-data/user ${DEFAULT_USER}/" /etc/nginx/nginx.conf

mkdir /tmp/nginx;
chmod -R 777 /tmp/nginx;

nginx
