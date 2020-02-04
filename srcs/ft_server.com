# Redirect HTTP -> HTTPS
server {
listen 80;
server_name www.ft_server.com ft_server.com;

include snippets/letsencrypt.conf;
return 301 https://ft_server.com$request_uri;
}

# Redirect WWW -> NON-WWW
server {
listen 443 ssl http2;
server_name www.ft_server.com;

ssl_certificate /etc/letsencrypt/live/ft_server.com/fullchain.pem;
ssl_certificate_key /etc/letsencrypt/live/ft_server.com/privkey.pem;
ssl_trusted_certificate /etc/letsencrypt/live/ft_server.com/chain.pem;
include snippets/ssl.conf;

return 301 https://ft_server.com$request_uri;
}

server {
listen 443 ssl http2;
server_name ft_server.com;

root /var/www/html/ft_server.com;
index index.php;

# SSL parameters
ssl_certificate /etc/letsencrypt/live/ft_server.com/fullchain.pem;
ssl_certificate_key /etc/letsencrypt/live/ft_server.com/privkey.pem;
ssl_trusted_certificate /etc/letsencrypt/live/ft_server.com/chain.pem;
include snippets/ssl.conf;include snippets/letsencrypt.conf;

# log files
access_log /var/log/nginx/ft_server.com.access.log;
error_log /var/log/nginx/ft_server.com.error.log;

location = /favicon.ico {
log_not_found off;
access_log off;
}

location = /robots.txt {
allow all;
log_not_found off;
access_log off;
}

location / {
try_files $uri $uri/ /index.php?$args;
}

location ~ \.php$ {
include snippets/fastcgi-php.conf;
fastcgi_pass unix:/run/php/php7.2-fpm.sock;
}

location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg)$ {
expires max;
log_not_found off;
}
}