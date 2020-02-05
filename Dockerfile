FROM debian:buster

RUN apt update && \
	apt -y upgrade && \
	apt install -y nginx mariadb-server \
	php-fpm \
	php-mysql \
	php-mbstring \
	openssl

COPY	srcs/wordpress /var/www/wordpress/
COPY	srcs/phpMyAdmin-4.9.4-all-languages/* /var/www/phpMyAdmin/
COPY	srcs/default  /etc/nginx/sites-avalibles/
COPY	srcs/config.sql  /home/

#RUN	chown -R www-data:www-data /var/www/* && \
#	chmod -R 755 /var/www/* 
RUN		service mysql start && \
		mysql -u root --password= < /home/config.sql

EXPOSE 80

CMD service nginx start && \
	service mysql start && \
	service php-fpm start && \
	bash
