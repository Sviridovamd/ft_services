#!/bin/bash

# Initializes the DB data directory and creates the system tables
# in the mysql database, if they do not exist.
mysql_install_db --datadir=/var/lib/mysql

# Starts mysqld with some extra safety features
mysqld_safe -u root & sleep 5

#MARIADB
mysql -u root -e  "CREATE DATABASE wmadison_db; \
                  GRANT ALL PRIVILEGES ON wmadison_db.* TO 'wmadison'@'%' \
				  IDENTIFIED BY 'wmadison'; \
                  FLUSH PRIVILEGES;"

# Imports database backup
 mysql wmadison_db -u root < wmadison_db.sql

# Avoids container to stop
sleep infinity & wait