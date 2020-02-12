FROM debian:buster
MAINTAINER mmateo-t <mmateo-t@42.student.com>

RUN apt update && \
	apt -y upgrade && \
	apt install -y nginx mariadb-server \
	php-fpm \
	php-mysql \
	php-mbstring \
	openssl \
	wget

COPY	srcs/wordpress /var/www/html/wordpress/
COPY	srcs/phpMyAdmin-5.0.1-all-languages/ /var/www/html/phpmyadmin/
COPY	srcs/config.inc.php	/var/www/html/phpmyadmin/
COPY	srcs/default  /etc/nginx/sites-available/
COPY	srcs/config.sql  /tmp/
COPY	srcs/wordpress.sql  /tmp/

RUN	chown -R www-data:www-data /var/www/* && \
	chmod -R 755 /var/www/*

RUN		service mysql start && \
		mysql -u root --password= < /tmp/config.sql && \
		mysql wordpress -u root --password= < /tmp/wordpress.sql

RUN mkdir ~/mkcert && \
	cd ~/mkcert && \
	wget https://github.com/FiloSottile/mkcert/releases/download/v1.1.2/mkcert-v1.1.2-linux-amd64 && \
	mv mkcert-v1.1.2-linux-amd64 mkcert && \
	chmod +x mkcert && \
	./mkcert -install && \
	./mkcert localhost

	CMD service nginx start && \
	service mysql start && \
	service php7.3-fpm start && \
	bash
