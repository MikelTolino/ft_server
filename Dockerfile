FROM debian:buster

RUN apt update && \
	apt -y upgrade && \
	apt install -y nginx mariadb-server \
	php-fpm \
	php-mysql \
	php-mbstring \
	openssl \
	curl

COPY	srcs/wordpress /var/www/wordpress/
COPY	srcs/phpMyAdmin-4.9.4-all-languages /var/www/phpMyAdmin/
COPY	srcs/ft_server.com /etc/nginx/sites-avalibles/
#COPY	srcs/config.sql   
RUN		ln -s /etc/nginx/sites-available/ft_server.com /etc/nginx/sites-enabled/


#CMD service nginx start && \
#	service mysql start && \
#	bash
