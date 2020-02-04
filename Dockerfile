FROM debian:buster

RUN apt update && \
	apt install -y nginx mariadb-server 

CMD service nginx start && \
	service mysql start && \
	bash
