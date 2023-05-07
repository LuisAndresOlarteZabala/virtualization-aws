# Instalación de la aplicación web

Este código es un conjunto de comandos que instala y configura un servidor web Apache con PHP, una base de datos MariaDB y la plataforma de blogs WordPress.

A continuación se describe cada comando:

1. Actualiza los repositorios del sistema y las aplicaciones instaladas a la última versión disponible.

    ```shell
    apt update && apt upgrade
    ```

2. Instala el servidor web Apache.

    ```shell
    apt install apache2
    ```

3. Muestra el estado del servicio Apache para verificar si se ha iniciado correctamente.

    ```shell
    systemctl status apache2
    ```

4. Prueba el servidor Apache instalado en la máquina local.

    ```shell
    curl http://localhost
    ```

5. Instala la base de datos MariaDB y el cliente de línea de comandos.

    ```shell
    apt install mariadb-server mariadb-client
    ```

6. Configura una contraseña para el usuario root de la base de datos MariaDB y elimina cuentas de usuario anónimas y accesos remotos.

    ```shell
    mysql_secure_installation
    ```

7. Instala PHP y la extensión MySQL para permitir la conexión entre PHP y la base de datos.

    ```shell
    apt install php php-mysql
    ```

8. Crea un archivo PHP de información del servidor en la ruta especificada.

    ```shell
    nano /var/www/html/info.php
    ```

9. Código PHP que muestra información detallada sobre la configuración del servidor.

    ```php
    <?php phpinfo(); ?>
    ```

10. Muestra la información del servidor PHP instalado en la máquina local.

    ```shell
    curl http://localhost/info.php
    ```

11. Inicia la línea de comandos de MySQL como usuario root.

    ```shell
    mysql -u root -p
    ```

12. Crea una base de datos llamada "wordpress_db".

    ```mysql
    CREATE DATABASE wordpress_db;
    ```

13. Crea un usuario llamado "wp_user" con la contraseña "ubuntu" que solo puede conectarse desde el localhost.

    ```mysql
    CREATE USER 'wp_user'@'localhost' IDENTIFIED BY 'ubuntu';
    ```

14. Otorga todos los permisos al usuario "wp_user" para la base de datos "wordpress_db".

    ```mysql
    GRANT ALL ON wordpress_db.* TO 'wp_user'@'localhost' IDENTIFIED BY 'ubuntu';
    ```

15. Actualiza los permisos de la base de datos.

    ```mysql
    FLUSH PRIVILEGES;
    ```

16. Sale de la línea de comandos de MySQL.

    ```mysql
    Exit;
    ```

17. Cambia al directorio temporal y descarga el archivo de instalación de WordPress.

    ```shell
    cd /tmp && wget https://wordpress.org/latest.tar.gz
    ```

18. Extrae el archivo descargado.

    ```shell
    tar -xvf latest.tar.gz
    ```

19. Copia el directorio de instalación de WordPress en el directorio predeterminado de Apache.

    ```shell
    cp -R wordpress /var/www/html/
    ```

20. Establece el usuario y el grupo propietarios del directorio de WordPress en www-data.

    ```shell
    chown -R www-data:www-data /var/www/html/wordpress/
    ```

21. Establece los permisos del directorio de WordPress para permitir.

    ```shell
    chmod -R 755 /var/www/html/wordpress/
    ```
