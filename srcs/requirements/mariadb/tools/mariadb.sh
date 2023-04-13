#!/bin/sh

#Initialise systeme BDD en amont de l'utilisation du serveur de BDD
mysql_install_db

#Demarre le serveur BDD
/etc/init.d/mysql start

#Verifie si BDD deja existante
if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ];
then
	echo "database already exists"
else
#Cmd qui configure opts de secu pour le serveur de BDD
mysql_secure_installation << EOF

Y
Meghann42!
Meghann42!
Y
n
Y
Y
EOF

#Accorde tous les privileges a root
echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

#Creer BDD et accorde privilege au user de la VAR
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -u root

#Exportation script BDD sous SQL pour reimportation dans BDD destination MariaDB
mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/wordpress.sql
fi

#Stop le serveur BDD
/etc/init.d/mysql stop

exec "$@"
