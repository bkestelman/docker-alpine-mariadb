# MariaDB on Alpine

Need a database real quick? Here's one!

```
docker build -t mariadb .
docker run -it mariadb
```

Installs, initializes, and starts MariaDB server. 

Also runs /bin/sh so you get a shell when you run `docker run -it...` (you can detach from the container with ctrl+p,ctrl+q or use `docker run -it -d...` to detach immediately)

The root password is 'root' :P 

By default, root only has permissions on localhost (in the container)

You can run additional sql files by putting them in the sql/ directory and passing them as entrypoint args:

```
docker run -it mariadb sql/*
```

Files you want to run this way must go in the sql/ directory. 

As an example, you can try:

```
docker run -it mariadb sql/open_remote.sql
```

Which will grant permissions to root from the docker host. You can test with the python script:

```
python connect.py
```

Which should create the table test.foo

TODO: Use persistent volume

TODO: Beef up security... encryption? keys?

TODO: Add more config options - e.g. accept a my.cnf file
