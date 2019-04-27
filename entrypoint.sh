#!/bin/sh
mysqld_safe --skip-networking=0 &

echo 'Waiting for mysqld to start...'
until mysqladmin ping &>/dev/null; do
	echo -n .	
	sleep 0.2
done
mysqladmin -u root password ${DB_ROOT_PASS}

if [ $@ ]; then
	mysql -u root -p${DB_ROOT_PASS} < $@
fi

/bin/sh
