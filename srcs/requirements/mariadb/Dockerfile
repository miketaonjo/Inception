#Specifie l'img de base a partir de laquelle l'img sera construite
FROM debian:buster

#Installation paquets et dependances necessaires a l'appli
RUN apt update
RUN apt install mariadb-server mariadb-client -y \
	&& rm -rf /var/lib/apt/lists/*

#Creer dossier pour fichier temp MariaDB, change son proprietaire et donne permissions a tous les utilisateurs du systeme
RUN mkdir -p /var/run/mysqld \
	&& chown -R mysql:mysql /var/run/mysqld \
	&& chmod 777 /var/run/mysqld

#Port autorise
EXPOSE 3306

#Scipt et SQL avec les droits d'exec dans le repertoire de l'img
COPY ./tools/mariadb.sh /usr/local/bin/
COPY ./conf/wordpress.sql /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh
RUN chmod +x /usr/local/bin/wordpress.sql

#On run mariadb et on autorise l'ecoute globale
#Script comme point d'entree de l'img
ENTRYPOINT [ "/usr/local/bin/mariadb.sh" ]

#Cmd par defaut au demarrage du container, soit le demarrage serveur MariaDB pour ecouter sur toutes les interfaces reseau
CMD ["mysqld", "--bind-address=0.0.0.0"]

