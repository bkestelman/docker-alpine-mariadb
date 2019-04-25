# MariaDB on Alpine

Need a database real quick? Here's one!

:warning: This project is under construction. Don't expect it to be highly secure! :warning:

Runs MariaDB's mysqld, then runs /bin/sh so you can access the container with `docker run -it...`

Currently, to finish the MariaDB setup, you need to run `./startup.sh` in the container before accessing the mysql client with `mysql -u root -p`  

The root password is root :P

No configuration has been set besides the bare minimum to get MariaDB working.

