Documentacion de Docker
Johan Alexander Acero Salazar
3145555

Con un formato de docker compose, hize el primer punto que es meter las cuatro bases de datos dentro de docker, cada una corriendo en su propio contenedor independiente.

Indica la version del formato docker compose: 

![alt text](image-25.png)

Aqui creamos el contenedor de MySQL, usamos la imagen oficial de MySQL, creamos un usuario, contraseña y puerto con la cual vamos a poder acceder a ese contenedor desde el motor de base de datos:

![alt text](image-26.png)

Levantamos el contenedor de SQL Server 2022, definimos la contraseña del usuario administrador "sa" con la contraseña "MiPassword123!", el puerto interno 1433 accesible desde el motor de base de datos:

![alt text](image-27.png)

Creamos el contenedor de PostgreSQL 15 con usuario, contraseña y puerto 5432 (interno) expuesto en 5433 (host) con volumen para que no se borren los datos:

![alt text](image-28.png)

Creaamos un contenedor de MongoDB 7 con usuario administrador (admin) con su contraseña, en el puerto 27017 (interno) en 28017 (externo):
![alt text](image-29.png)

Esto sirve para mantener los datos guardados por si los contenedores se eliminan o se recrean de nuevo:

![alt text](image-30.png)




Creamos el contenedor de ubuntu con docker dentro, con los puertos ya preparados para las bases de datos:
![alt text](image-1.png)

Verificamos que se hayan creado:
![alt text](image-4.png)

Entramos al contenedor de ubuntu:

![alt text](image-9.png)

Consulta los servidores para saber que actualizaciones existen:

![alt text](image-10.png)

Descarga y agrega repositorios seguros y externos como el de docker:
![alt text](image-11.png)

Crea la carpeta donde se guarda la llave GPG que validan los paquetes del sitio oficial:
![alt text](image-12.png)

Descarga y guarda la GPG  de docker que ubuntu usa:
![alt text](image-13.png)

Añade el repositorio de docker al sistema para poder instalarlo desde alli:
![alt text](image-14.png)

Actualizamos e instalamos docker dentro del contenedor de ubuntu:
![alt text](image-15.png)

Iniciamos docker dentro del contenedor de ubuntu:
![alt text](image-16.png)

Creamos la red de docker:
![alt text](image-17.png)

Creamos una red interna que se llama redes_bd en docker donde conectaremos todos los contenedores de base de datos:
![alt text](image-18.png)

Crea un contenedor de MySQL 8.0 listo para usar, en la red redes_bd:
![alt text](image-19.png)

Crea un contenedor con PostgreSQL 15 listo para usar, en la red redes_bd:
![alt text](image-20.png)

Crea un contenedor con MongoDB version 6 listo para usar, en la red redes_bd:
![alt text](image-21.png)

Crea un contenedor con SQL Server 2019 listo para usar, en la red redes_bd:
![alt text](image-22.png)

Verificamos que se hayan creado:
![alt text](image-23.png)

Nos deberia mostrar algo como esto:
![alt text](image-24.png)
Y ya con esto nos podemos conectar en los 4 motores de base de datos con el host, user y password que le pusimos anteriormente.

Para inicializar el docker:

- Con esto podemos abrir el ubuntu que creamos:
![alt text](image.png)

- Con esto podemos mirar si el contenedor de docker esta activo dentro del ubuntu: 

    ![alt text](image-2.png)

- Con esto podremos levantar el docker interno del ubuntu:
    ![alt text](image-8.png)

- Y esto nos ayudara a saber si las bases estan activas dentro del ubuntu:
![alt text](image-3.png)

- Con Ctrl + D o exit se cierra el root de ubuntu