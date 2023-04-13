#Specifie l'img de base a partir de laquelle l'img sera construite
FROM debian:buster

#Installation paquets et dependances necessaires a l'appli
RUN apt-get update \
	&&  apt-get install -y nginx openssl

#Creer dossier correspondant pour cles SSL
RUN mkdir /etc/nginx/ssl

#Pour les tests: un certificat ssl signe
RUN openssl req -x509 -nodes -days 365 -sha256 -newkey rsa:4096 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=FR/ST=Angouleme/L=Angouleme/O=42/OU=mcloarec/CN=mcloarec.42.fr/"

#Copie les fichiers de config du serveur depuis la machine hote vers le conteneur
COPY ./conf/ssl.conf /etc/nginx/conf.d

#Creer fichier run qui lancera le serveur
RUN mkdir -p /run/nginx

#Port autorise
EXPOSE 443

#Lance seulement le processus et lui attribue donc le PID1
CMD ["nginx", "-g", "daemon off;"]
