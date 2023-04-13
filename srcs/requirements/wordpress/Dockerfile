#Specifie l'img de base a partir de laquelle l'img sera construite
FROM debian:buster

#Installation paquets et dependances necessaires a l'appli
RUN apt update && apt -y install wget curl bash php php-cgi php-mysql php-fpm php-pdo php-gd php-cli php-mbstring && rm -rf /var/lib/apt/lists/*

#WP en ligne de commande
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

#Copie les fichiers de config du serveur depuis la machine hote vers le conteneur
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

#Creer fichier run qui lancera le serveur
RUN mkdir /run/php

#Installation WP par sript shell
COPY ./tools/install_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/install_wordpress.sh

#Defini entree principale img Docker
ENTRYPOINT ["/usr/local/bin/install_wordpress.sh"]

#Defini repertoire ou les cmd Dockerfile sont executees
WORKDIR /var/www/html/

#Port autorise
EXPOSE 9000

#Lance seulement le processus en 'run forever' et lui attribue donc le PID1
CMD ["/usr/sbin/php-fpm7.3", "-F"]
