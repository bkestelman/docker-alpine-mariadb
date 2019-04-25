FROM alpine:3.9

RUN apk add mariadb mariadb-client

ENV DB_DATA_PATH="/var/lib/mysql"
ENV DB_ROOT_PASS="root"
#ENV DB_USER="root"
#ENV DB_PASS="mariadb_user_password"
#ENV MAX_ALLOWED_PACKET="200M"

# Install Mariadb
RUN mysql_install_db --user=mysql --datadir=${DB_DATA_PATH} \
	&& mysql_install_db --user=mysql --datadir=${DB_DATA_PATH} \
	&& mkdir /run/mysqld \
	&& chown mysql:mysql /run/mysqld 

COPY entrypoint.sh entrypoint.sh
COPY startup.sh startup.sh

CMD ./entrypoint.sh
