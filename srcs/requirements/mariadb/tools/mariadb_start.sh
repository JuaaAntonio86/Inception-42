#! /bin/bash

#Start the service if it is not running
service mariadb start

#Configuration of mysql database

#(enter) no root password yet
#(n) no unix_socket authentication
#(Y) change root password
#new password
#new password
#(Y) remove anonymous users
#(Y) disallow root login remotely, only allowed from localhost
#(Y) remove test database
#(Y) reload privilege tables so changes will take effect
mysql_secure_installation << FB_EOF

n
Y
$DB_ROOT_PASS
$DB_ROOT_PASS
Y
Y
Y
Y
FB_EOF

if [ ! -d /var/lib/mysql/$DB_NAME ]
then
	mysql -u $DB_ROOT -p$DB_ROOT_PASS -e "CREATE DATABASE $DB_NAME;"
	mysql -e "CREATE USER 'DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
	mysql -e "GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS' WITH GRANT OPTION;"
	mysql -e "FLUSH PRIVILEGES;"
	echo "User created in db successfully"
fi

service mariadb stop
mysqld
