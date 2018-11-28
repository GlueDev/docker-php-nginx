### PHP + Nginx for Docker

This is a docker image containing PHP & Nginx. This image is tailored specifically to our needs.
An example docker file to use:

``` Dockerfile
FROM gluedev/php-nginx:7.2

# Copy the application to Docker
COPY --chown=application:application . /app

# Install dependencies
RUN su application -c "composer install --working-dir=/app --no-scripts --no-interaction"

# Glue ENV variables
ENV ENABLE_BATCH_DAEMON true
ENV ENABLE_COMPOSER false
ENV ENABLE_LARAVEL_HORIZON false
ENV ENABLE_LARAVEL_NGINX true
ENV RUN_CLEAR_CACHES true
ENV RUN_MIGRATIONS true

EXPOSE 80
```