Informe del Proyecto Docker con MySQL, PHP, Apache en Linux
1. Configuración del Entorno
1.1 Instalación de Docker y Docker Compose

Se instaló Docker y Docker Compose en el sistema operativo Linux para facilitar el despliegue y la gestión de contenedores.

# Instalación de Docker
sudo apt-get update
sudo apt-get install docker.io

# Instalación de Docker Compose
sudo apt-get install docker-compose
1.2 Estructura del Proyecto

Se creó la estructura del proyecto en el directorio /home/jaider/Documentos/proyecto/www/:

Copiar código
proyecto/
├── docker-compose.yml
├── Dockerfile
www├── index.php
    ├── register.php  
    ├── myDb.sql
    ├── config.php
    ├── fetch_departamento.php
      └── fetch_municipios.php
docker-compose.yml: Archivo para definir y ejecutar la aplicación con Docker.
Dockerfile: Archivo para configurar la imagen de Docker.
index.php: Página principal del CRUD PHP.
guardar_persona.php: Script PHP para guardar registros en la base de datos.
consultar.php: Script PHP para consultar registros en la base de datos.
2. Desarrollo del CRUD
2.1 Configuración de MySQL en Docker

Se configuró un servicio MySQL en Docker usando docker-compose.yml:

version: '3.7'

services:
  db:
    image: mysql:5.7
    volumes:
      - db_data:/var/lib/mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: ubicaciones
      MYSQL_USER: user
      MYSQL_PASSWORD: userpass
    ports:
      - "3306:3306"

  php:
    image: php:7.4-apache
    depends_on:
      - db
    volumes:
      - ./www:/var/www/html
    ports:
      - "8080:80"
    restart: always

volumes:
  db_data:
MySQL: Se utilizó la imagen oficial de MySQL 5.7, configurando la base de datos ubicaciones con usuario y contraseña.

PHP: Se utilizó la imagen oficial de PHP 7.4 con Apache para servir el código PHP.

2.2 Desarrollo del CRUD

Se desarrolló un CRUD básico utilizando PHP para interactuar con la base de datos MySQL:

index.php: Página principal con un formulario para agregar registros y listarlos.

guardar_persona.php: Script PHP para guardar registros en la base de datos.

consultar.php: Script PHP para consultar registros en la base de datos.

3. Ejecución del Proyecto
3.1 Construcción y Ejecución con Docker


# Construir y levantar los servicios
docker-compose up -d
3.2 Acceso a la Aplicación

PHP: La aplicación PHP está disponible en http://localhost:8080/.
4. Conclusiones y Resultados
Se logró implementar con éxito un entorno de desarrollo Dockerizado con MySQL, PHP, y Apache en Linux. Se desarrolló un CRUD básico utilizando PHP para interactuar con la base de datos MySQL.

5. Lecciones Aprendidas
Se aprendió sobre Docker y Docker Compose para configurar un entorno de desarrollo.
Se implementó un CRUD básico con PHP y MySQL.
6. Recomendaciones
Mantener actualizadas las imágenes y dependencias utilizadas.
Realizar pruebas exhaustivas antes de la implementación en producción.
Documentar y comentar adecuadamente el código para facilitar el mantenimiento.
7. Futuras Mejoras
Implementar seguridad adicional en la aplicación web.
Implementar un sistema de autenticación y roles de usuario en la aplicación PHP.
Este informe resume el proyecto desde la configuración inicial hasta la implementación exitosa de un entorno Dockerizado con MySQL, PHP, y Apache en Linux, desarrollando un CRUD básico con PHP para interactuar con la base de datos MySQL.
