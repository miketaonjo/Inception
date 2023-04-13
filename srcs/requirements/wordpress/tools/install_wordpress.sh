#!/bin/bash

#Verifie si deja existant
if [ -f ./wp-config.php ]
then
	echo "WP already downloaded"
else
	#Installe archive WP
	wget http://wordpress.org/latest.tar.gz

	#Decompression
	tar xfz latest.tar.gz

	#Deplace fichiers WP vers repertoire courant
	mv wordpress/* .

	#Supprime archive et dossier wordpress
	rm -rf latest.tar.gz
	rm -rf wordpress

	#Importe les variable d'environement dans le fichier de config
	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php

	cp wp-config-sample.php wp-config.php
	wp user create mcloarec mcloarec@student.42angouleme.fr --role=administrator --user_pass="Meghann42!" --allow-root
	#Desactive 'visitor' de la co WP
	wp user update Visitor --allow-root --role=none
fi
#Execute la cmd passee en param du script
exec "$@"
