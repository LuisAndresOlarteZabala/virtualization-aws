#!/bin/bash

# Actualiza el sistema operativo y sus paquetes.
sudo apt update && apt upgrade

# Instala el servidor web Apache2.
sudo apt install apache2

# Verifica que el servidor Apache2 esté funcionando correctamente.
sudo systemctl status apache2

# Verifica la conexión local con el servidor Apache2.
sudo curl -I http://192.168.12.18

# Instala el sistema de gestión de bases de datos MariaDB.
sudo apt install mariadb-server mariadb-client

# Configura la instalación segura de MariaDB.
sudo mysql_secure_installation

# Instala PHP y el controlador MySQL para PHP.
sudo apt install php php-mysql

# Crea un archivo de información PHP.
sudo vim /var/www/html/info.php

# Agrega la información PHP al archivo.
sudo echo "<?php phpinfo(); ?>" > /var/www/html/info.php

# Verifica la conexión en una red local con el servidor PHP.
curl -I http://192.168.12.18/info.php

# Inicia sesión en MariaDB como root.
sudo mysql -u root -p

# Crea una base de datos para WordPress.
CREATE DATABASE wordpress_db;

# Crea un usuario y le otorga una contraseña para la base de datos.
CREATE USER 'wp_user'@'localhost' IDENTIFIED BY 'ubuntu';

# Otorga todos los permisos necesarios al usuario creado en la base de datos de WordPress.
GRANT ALL ON wordpress_db.* TO 'wp_user'@'localhost' IDENTIFIED BY 'ubuntu';

# Aplica los cambios realizados en la base de datos.
FLUSH PRIVILEGES;

# Sale de MariaDB.
Exit;

# Descarga la última versión de WordPress en la carpeta temporal.
sudo cd /tmp && wget https://wordpress.org/latest.tar.gz

# Descomprime el archivo de WordPress descargado.
sudo tar -xvf latest.tar.gz

# Copia los archivos de WordPress a la carpeta del servidor web.
sudo cp -R wordpress /var/www/html/

# Cambia los permisos de los archivos para que el servidor web pueda acceder a ellos.
sudo chown -R www-data:www-data /var/www/html/wordpress/

# Establece permisos de lectura, escritura y ejecución para los archivos de WordPress.
sudo chmod -R 755 /var/www/html/wordpress/

# Crea la carpeta para subir archivos a WordPress.
sudo mkdir /var/www/html/wordpress/wp-content/uploads

# Cambia los permisos para que el servidor web pueda acceder a la carpeta de subida de archivos.
sudo chown -R www-data:www-data /var/www/html/wordpress/wp-content/uploads/

# Verifica la conexión local con WordPress.
curl -I http://192.168.12.18/wordpress