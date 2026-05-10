FROM danuk/shm-api:latest AS api
COPY nginx/nginx.conf /etc/nginx/
COPY entry-api.sh /entry.sh


FROM danuk/shm-core-base:latest AS core
COPY entry-core.sh /entry.sh
COPY app /app
COPY patches/telegram_oidc_proxy.pl /tmp/telegram_oidc_proxy.pl
RUN perl /tmp/telegram_oidc_proxy.pl /app/lib/Core/Transport/Telegram.pm && rm /tmp/telegram_oidc_proxy.pl

