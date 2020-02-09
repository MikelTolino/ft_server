FROM debian:buster
MAINTAINER mmateo-t <mmateo-t@42.student.com>

RUN apt update && \
	apt -y upgrade && \
	apt install -y nginx mariadb-server \
	php-fpm \
	php-mysql \
	php-mbstring \
	openssl

COPY	srcs/wordpress /var/www/wordpress/
COPY	srcs/phpMyAdmin-4.9.4-all-languages/* /var/www/phpmyadmin/
COPY	srcs/config.inc.php	/var/www/phpmyadmin/
COPY	srcs/default  /etc/nginx/sites-available/
COPY	srcs/config.sql  /tmp/

RUN	chown -R www-data:www-data /var/www/* && \
	chmod -R 755 /var/www/*

RUN		service mysql start && \
		mysql -u root --password= < /tmp/config.sql

CMD service nginx start && \
	service mysql start && \
	service php7.3-fpm start && \
	bash
