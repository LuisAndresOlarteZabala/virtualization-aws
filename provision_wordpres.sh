#!/bin/bash

# Actualiza el sistema operativo y sus paquetes.
apt update && apt upgrade

# Instala el servidor web Apache2.
apt install apache2

# Verifica que el servidor Apache2 esté funcionando correctamente.
systemctl status apache2

# Verifica la conexión local con el servidor Apache2.
curl -I http://localhost

# Instala el sistema de gestión de bases de datos MariaDB.
apt install mariadb-server mariadb-client

# Configura la instalación segura de MariaDB.
mysql_secure_installation

# Instala PHP y el controlador MySQL para PHP.
apt install php php-mysql

# Crea un archivo de información PHP.
nano /var/www/html/info.php

# Agrega la información PHP al archivo.
echo "<?php phpinfo(); ?>" > /var/www/html/info.php

# Verifica la conexión local con el servidor PHP.
curl -I http://localhost/info.php

# Verifica la conexión en una red local con el servidor PHP.
curl -I http://192.168.12.18/info.php

# Inicia sesión en MariaDB como root.
mysql -u root -p

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
cd /tmp && wget https://wordpress.org/latest.tar.gz

# Descomprime el archivo de WordPress descargado.
tar -xvf latest.tar.gz

# Copia los archivos de WordPress a la carpeta del servidor web.
cp -R wordpress /var/www/html/

# Cambia los permisos de los archivos para que el servidor web pueda acceder a ellos.
chown -R www-data:www-data /var/www/html/wordpress/

# Establece permisos de lectura, escritura y ejecución para los archivos de WordPress.
chmod -R 755 /var/www/html/wordpress/

# Crea la carpeta para subir archivos a WordPress.
mkdir /var/www/html/wordpress/wp-content/uploads

# Cambia los permisos para que el servidor web pueda acceder a la carpeta de subida de archivos.
chown -R www-data:www-data /var/www/html/wordpress/wp-content/uploads/

# Verifica la conexión local con WordPress.
curl -I http://localhost/wordpress