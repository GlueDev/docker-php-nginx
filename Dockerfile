FROM webdevops/php-nginx:7.2

# Install dependencies
RUN apt-get update && apt-get upgrade -y
RUN apt-get install autoconf gcc make
RUN pecl install opencensus-alpha
RUN docker-php-ext-enable opencensus

# Install parallel composer
RUN su application -c "composer global require hirak/prestissimo"

# PHP settings
ENV PHP_DATE_TIMEZONE Europe/Amsterdam

# Glue ENV variables
ENV ENABLE_BATCH_DAEMON false
ENV ENABLE_COMPOSER true
ENV ENABLE_LARAVEL_HORIZON false
ENV ENABLE_LARAVEL_NGINX true

# Glue config & entrypoint
COPY ./config /opt/glue/
COPY ./entrypoint.sh /entrypoint.d/glue.sh

EXPOSE 80