#!/bin/sh
# Add user stuff
useradd -U -m -u ${DEFAULT_USER_UID} -G sudo,www-data -d /home/magento ${DEFAULT_USER}

nginx
