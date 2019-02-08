FROM nginx:stable-alpine

ADD conf/nginx.conf /etc/nginx/nginx.conf
#ADD conf/service.conf /etc/nginx/conf.d/service.conf

ADD script/entrypoint.sh /entrypoint.sh
ADD script/le.sh /le.sh

RUN \
 rm /etc/nginx/conf.d/default.conf && \
 chmod +x /entrypoint.sh && \
 chmod +x /le.sh && \
 apk add  --update certbot tzdata openssl && \
 rm -rf /var/cache/apk/*

# Prototype for healthcheck but if fails to get certificate with it (some kind of race condition, nginx works correctly on :80)
# HEALTHCHECK --interval=1m30s --timeout=10s --retries=3 --start-period=3m CMD wget -q -s http://localhost/__ping.ping || exit 1

CMD ["/entrypoint.sh"]