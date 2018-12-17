FROM webdevops/php-nginx:7.2

# Install apt dependencies
RUN apt-get update && apt-get install vim htop libz-dev -y

# Install Google tracing dependencies
RUN pecl channel-update pecl.php.net
RUN pecl install opencensus-alpha grpc protobuf
RUN docker-php-ext-enable opencensus grpc protobuf

# Install parallel composer
RUN su application -c "composer global require hirak/prestissimo"

# PHP settings
ENV PHP_DATE_TIMEZONE Europe/Amsterdam

# Glue ENV variables
ENV ENABLE_BATCH_DAEMON false
ENV ENABLE_COMPOSER false
ENV ENABLE_LARAVEL_HORIZON false
ENV ENABLE_LARAVEL_NGINX true
ENV RUN_CLEAR_CACHES true
ENV RUN_MIGRATIONS true

# Glue config & entrypoint
COPY ./config /opt/glue/
COPY ./entrypoint.sh /entrypoint.d/glue.sh

EXPOSE 80