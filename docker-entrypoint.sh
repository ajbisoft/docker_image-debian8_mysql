#!/bin/sh

# Fix to bypass mysql daemon on demand
case "$1" in
        *sh)
                exec "$@"
                exit 1
        ;;
esac

# Fix to populate external volume on first startup
if [ ! -f /var/lib/mysql/auto.cnf ]; then 
	chmod 750 /var/lib/mysql/
	chown mysql:mysql /var/lib/mysql/
	cp -a /var/lib/mysql_orig/* /var/lib/mysql/
fi

# Run icinga2 daemon in foreground mode
exec /usr/bin/mysqld_safe
