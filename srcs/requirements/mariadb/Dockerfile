FROM debian:bullseye

RUN set -eux; \
        apt-get update; \
        DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        mariadb-server \
        tini

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.conf
COPY ./tools/init.sh /docker-entrypoint-initdb.d/init.sh
COPY ./tools/init.sql /docker-entrypoint-initdb.d/init.sql

RUN chmod +x /docker-entrypoint-initdb.d/init.sh

EXPOSE 3306

ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["sh", "/docker-entrypoint-initdb.d/init.sh"]
