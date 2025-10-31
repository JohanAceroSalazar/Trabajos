# Documentación Docker

Johan Alexander Acero Salazar 

Ficha: 3145555

# Punto N1 Docker

# Crear archivo

version: "3.9"

services:
  mysql:
    image: mysql:8.0
    container_name: mysql-container
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: MiPassword123
      MYSQL_DATABASE: mi_base
    ports:
      - "3307:3306"
    volumes:
      - mysql_data:/var/lib/mysql

  sqlserver:
    image: mcr.microsoft.com/mssql/server:2022-latest
    container_name: sqlserver-container
    restart: always
    environment:
      ACCEPT_EULA: "Y"
      SA_PASSWORD: "MiPassword123!"
    ports:
      - "1433:1433"
    volumes:
      - sqlserver_data:/var/opt/mssql

  postgres:
    image: postgres:15
    container_name: postgres-container
    restart: always
    environment:
      POSTGRES_USER: miusuario
      POSTGRES_PASSWORD: MiPassword123
      POSTGRES_DB: mi_base
    ports:
      - "5433:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data

  mongodb:
    image: mongo:7
    container_name: mongo-container
    restart: always
    environment:
      MONGO_INITDB_ROOT_USERNAME: admin
      MONGO_INITDB_ROOT_PASSWORD: MiPassword123
    ports:
      - "28017:27017"
    volumes:
      - mongo_data:/data/db

volumes:
  mysql_data:
  sqlserver_data:
  postgres_data:
  mongo_data:

# Creamos una carpeta para guardar el archivo y abrimos la terminal donde tenemos el archivo:

![alt text](image-32.png)

# Y ejecutamos dentro de la terminal para levantar los servicios:

docker compose up -d

Y ya con esto tendremos dentro de docker los 4 contenedores funcionales con puerto, usuario y contraseña para ingresar al manejador de base de datos.

# Punto N2 Ubuntu

Creamos una carpeta, donde dentro de ella creamos un archivo de Dockerfile para crear la imagen personalizada de ubuntu para conectarnos a MySQL, PostgreSQL, MongoDB y SQL Server:

# Imagen base Ubuntu
FROM ubuntu:22.04

# Evitar preguntas interactivas
ENV DEBIAN_FRONTEND=noninteractive

# Actualizamos paquetes e instalamos herramientas necesarias
RUN apt-get update && apt-get install -y \
    wget curl apt-transport-https ca-certificates gnupg lsb-release \
    software-properties-common nano sudo

# Instalamos MySQL Client, PostgreSQL Client, MongoDB Client y SQL Server tools
RUN apt-get install -y mysql-client postgresql-client mongodb-clients

# Instalamos herramientas de SQL Server (sqlcmd y bcp)
RUN curl -s https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/ubuntu/22.04/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && ACCEPT_EULA=Y apt-get install -y mssql-tools18 unixodbc-dev && \
    echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc

# Configuramos bash como shell por defecto
CMD ["/bin/bash"]

# En la misma carpeta creamos un archivo docker-compose.yml para montar los 4 servicios con usuario, contraseña y puertos:

version: "3.9"
services:
  ubuntu_env:
    build: .
    container_name: ubuntu_multi_db
    tty: true
    stdin_open: true
    networks:
      - db_network
    depends_on:
      - mysql
      - postgres
      - mssql
      - mongodb
    volumes:
      - ./data:/data
    ports:
      - "2222:22"   # opcional si quieres SSH dentro del contenedor

  mysql:
    image: mysql:8.0
    container_name: mysql_db
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: root123
      MYSQL_DATABASE: testdb
    ports:
      - "3306:3306"
    networks:
      - db_network
    volumes:
      - mysql_data:/var/lib/mysql

  postgres:
    image: postgres:15
    container_name: postgres_db
    restart: always
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: root123
      POSTGRES_DB: testdb
    ports:
      - "5432:5432"
    networks:
      - db_network
    volumes:
      - postgres_data:/var/lib/postgresql/data

  mssql:
    image: mcr.microsoft.com/mssql/server:2022-latest
    container_name: mssql_db
    restart: always
    environment:
      ACCEPT_EULA: "Y"
      SA_PASSWORD: "Root123!"
    ports:
      - "1433:1433"
    networks:
      - db_network
    volumes:
      - mssql_data:/var/opt/mssql

  mongodb:
    image: mongo:7
    container_name: mongodb_db
    restart: always
    ports:
      - "27017:27017"
    networks:
      - db_network
    volumes:
      - mongodb_data:/data/db

networks:
  db_network:
    driver: bridge

volumes:
  mysql_data:
  postgres_data:
  mssql_data:
  mongodb_data:

# Dentro de la carpeta que creamos con dockerfile y docker-compose.yml abrimos la terminal y ejecutamos lo siguiente para crear la imagen de ubuntu:
docker-compose build

# Una vez construida la imagen levantamos los contenedores: 
docker-compose up -d

# Verificamos que esten corriendo y esto seria todo:
docker ps

# Punto N3 Ubuntu + docker

# Creamos el contenedor de ubuntu con docker dentro, con los puertos ya preparados para las bases de datos:
docker run -itd --privileged `
  -p 3316:3316 -p 5445:5445 -p 27110:27110 -p 1438:1438 `
  --name ubuntu_docker ubuntu:22.04

# Verificamos que se hayan creado:
docker ps --format "{{.Names}}\t{{.Ports}}"

# Entramos al contenedor de ubuntu:
docker exec -it ubuntu_docker bash

# Instalamos docker dentro del ubuntu

apt update
apt install -y ca-certificates curl gnupg lsb-release apt-transport-https

mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
  | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
> /etc/apt/sources.list.d/docker.list

apt update
apt install -y docker-ce docker-ce-cli containerd.io

# Iniciamos docker dentro del contenedor de ubuntu:
dockerd >/var/log/dockerd.log 2>&1 & disown
sleep 4
docker version

# Creamos la red y las 4 bases:
docker network create redes_bd 2>/dev/null || true

# MySQL
docker run -d --name mysql_db \
  --network redes_bd \
  -p 3316:3306 \
  -e MYSQL_ROOT_PASSWORD=RootPass123! \
  -e MYSQL_DATABASE=mi_basedatos \
  -e MYSQL_USER=usuario_mysql \
  -e MYSQL_PASSWORD=PassMysql123! \
  -v mysql_data:/var/lib/mysql \
  --restart unless-stopped \
  mysql:8.0

# PostgreSQL
docker run -d --name postgres_db \
  --network redes_bd \
  -p 5445:5432 \
  -e POSTGRES_USER=usuario_pg \
  -e POSTGRES_PASSWORD=PassPG123! \
  -e POSTGRES_DB=mi_basedatos_pg \
  -v pg_data:/var/lib/postgresql/data \
  --restart unless-stopped \
  postgres:15

# MongoDB
docker run -d --name mongo_db \
  --network redes_bd \
  -p 27110:27017 \
  -e MONGO_INITDB_ROOT_USERNAME=usuario_mongo \
  -e MONGO_INITDB_ROOT_PASSWORD=PassMongo123! \
  -v mongo_data:/data/db \
  --restart unless-stopped \
  mongo:6

# SQL Server
docker run -d --name mssql_db \
  --network redes_bd \
  -p 1438:1433 \
  -e ACCEPT_EULA=Y \
  -e SA_PASSWORD=MiPassw0rdSQL! \
  -v mssql_data:/var/opt/mssql \
  --restart unless-stopped \
  mcr.microsoft.com/mssql/server:2019-latest

# Verificamos que se hayan creado:

docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Ports}}"

# Nos deberia mostrar algo como esto:
![alt text](image-24.png)
Y ya con esto nos podemos conectar en los 4 motores de base de datos con el host, user y password que le pusimos anteriormente.

# Conexion con los servicios de SQL Server creados en cada contenedor con diferentes puertos en SQL Server todos funcionales:
![alt text](image-34.png)

# Conexion con los servicios de Postgresql creados en cada contenedor con diferentes puertos en Postgresql todos funcionales:
![alt text](image-35.png)

# Conexion con los servicios de MySQL creados en cada contenedor con diferentes puertos en MySQL todos funcionales:
![alt text](image-36.png)

# Conexion con los servicios de MongoDB creados en cada contenedor con diferentes puertos en MongoDB todos funcionales:
![alt text](image-37.png)

# Para inicializar el docker:

- Con esto podemos abrir el ubuntu que creamos:
![alt text](image.png)

- Con esto podemos mirar si el contenedor de docker esta activo dentro del ubuntu: 

    ![alt text](image-2.png)

- Con esto podremos levantar el docker interno del ubuntu:
    ![alt text](image-8.png)

- Y esto nos ayudara a saber si las bases estan activas dentro del ubuntu:
![alt text](image-3.png)

- Con Ctrl + D o exit se cierra el root de ubuntu