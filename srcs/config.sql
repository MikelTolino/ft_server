CREATE DATABASE WordPress CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

GRANT ALL ON WordPress.* TO WordPressUser @'localhost' IDENTIFIED BY 'tu contraseña';

FLUSH PRIVILEGES;

EXIT;