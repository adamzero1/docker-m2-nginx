# Pull base image.
FROM ubuntu:xenial

# Install Nginx.
RUN \
  apt-get update && \
  apt-get install -y software-properties-common && \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
WORKDIR /etc/nginx

COPY files/entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

# Define default command.
ENTRYPOINT ["/entrypoint.sh"]

# Expose ports.
EXPOSE 8081 80 443
