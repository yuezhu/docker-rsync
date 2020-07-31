FROM alpine:3.10
RUN \
    apk add --no-cache bash tzdata shadow rsync

RUN \
    sed -i 's/^CREATE_MAIL_SPOOL=yes/CREATE_MAIL_SPOOL=no/' /etc/default/useradd && \
    groupmod -g 100 users && \
    useradd -u 1024 -U -d /app -s /bin/false app && \
    usermod -G users app

VOLUME /backup

ENV TZ=America/New_York

ADD ./entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
