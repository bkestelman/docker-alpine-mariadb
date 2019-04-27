FROM alpine:3.9

RUN apk add mariadb mariadb-client

ENV DB_DATA_PATH="/var/lib/mysql"
ENV DB_ROOT_PASS="root"

# Install Mariadb
RUN mkdir /run/mysqld \
	&& chown mysql:mysql /run/mysqld \
	&& mysql_install_db \
		--user=mysql \
		--datadir=${DB_DATA_PATH} 
		# --skip-test-db \

COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod u+x /usr/bin/entrypoint.sh

EXPOSE 3306

RUN mkdir /sql
COPY sql/* /sql/

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
