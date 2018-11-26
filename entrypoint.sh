 #!/bin/bash

if [[ "$ENABLE_BATCH_DAEMON" = true ]]; then
    cp /opt/glue/google-batch-daemon.conf /opt/docker/etc/supervisor.d/google-batch-daemon.conf
fi

if [[ "$ENABLE_LARAVEL_NGINX" = true ]]; then
    cp /opt/glue/laravel-nginx.conf /opt/docker/etc/nginx/vhost.conf
fi

if [[ "$ENABLE_LARAVEL_HORIZON" = true ]]; then
    cp /opt/glue/laravel-horizon.conf /opt/docker/etc/supervisor.d/laravel-horizon.conf
fi

if [[ "$ENABLE_COMPOSER" = true ]]; then
    su application -c "cd $WEB_DOCUMENT_ROOT && composer install"
fi