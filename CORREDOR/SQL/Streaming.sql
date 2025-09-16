CREATE DATABASE Streaming;
USE Streaming;

CREATE OR ALTER PROCEDURE crear_tablas_streaming
AS
BEGIN
    IF OBJECT_ID('Usuario', 'U') IS NULL
    BEGIN
    CREATE TABLE Usuario (
        id_usuario INT PRIMARY KEY,
        nombre VARCHAR(100),
        correo VARCHAR(100)
    );
    END;

    IF OBJECT_ID('Perfil', 'U') IS NULL
    BEGIN
    CREATE TABLE Perfil (
        id_perfil INT PRIMARY KEY,
        id_usuario INT,
        nombre VARCHAR(50),
        FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
    );
    END;

    IF OBJECT_ID('Pelicula', 'U') IS NULL
    BEGIN
    CREATE TABLE Pelicula (
        id_pelicula INT PRIMARY KEY,
        titulo VARCHAR(100),
        duracion_min INT
    );
    END;

    IF OBJECT_ID('Categoria', 'U') IS NULL
    BEGIN
    CREATE TABLE Categoria (
        id_categoria INT PRIMARY KEY,
        nombre VARCHAR(50)
    );
    END;

    IF OBJECT_ID('Dispositivo', 'U') IS NULL
    BEGIN
    CREATE TABLE Dispositivo (
        id_dispositivo INT PRIMARY KEY,
        nombre VARCHAR(100),
        tipo VARCHAR(50)
    );
    END;

    IF OBJECT_ID('Pelicula_Categoria', 'U') IS NULL
    BEGIN
    CREATE TABLE Pelicula_Categoria (
        id_pelicula INT,
        id_categoria INT,
        PRIMARY KEY (id_pelicula, id_categoria),
        FOREIGN KEY (id_pelicula) REFERENCES Pelicula(id_pelicula),
        FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria)
    );
    END;

    IF OBJECT_ID('Perfil_Pelicula', 'U') IS NULL
    BEGIN
    CREATE TABLE Perfil_Pelicula (
        id_perfil INT,
        id_pelicula INT,
        id_dispositivo INT,
        fecha DATETIME,
        PRIMARY KEY (id_perfil, id_pelicula, fecha),
        FOREIGN KEY (id_perfil) REFERENCES Perfil(id_perfil),
        FOREIGN KEY (id_pelicula) REFERENCES Pelicula(id_pelicula),
        FOREIGN KEY (id_dispositivo) REFERENCES Dispositivo(id_dispositivo)
    );
    END;
END;

EXEC crear_tablas_streaming;

CREATE OR ALTER PROCEDURE insertar_datos_streaming
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Usuario)
    BEGIN
        INSERT INTO Usuario VALUES 
        (1,'Juan Perez','juan@example.com'),
        (2,'Maria Lopez','maria@example.com'),
        (3,'Carlos Ruiz','carlos@example.com'),
        (4,'Ana Torres','ana@example.com'),
        (5,'Luis Gomez','luis@example.com'),
        (6,'Sofia Martinez','sofia@example.com'),
        (7,'Pedro Sanchez','pedro@example.com'),
        (8,'Laura Diaz','laura@example.com'),
        (9,'Miguel Castro','miguel@example.com'),
        (10,'Valentina Rios','valentina@example.com');
    END;

    IF NOT EXISTS (SELECT 1 FROM Perfil)
    BEGIN
        INSERT INTO Perfil VALUES 
        (101,1,'Perfil Juan'),
        (102,2,'Perfil Maria'),
        (103,3,'Perfil Carlos'),
        (104,4,'Perfil Ana'),
        (105,5,'Perfil Luis'),
        (106,6,'Perfil Sofia'),
        (107,7,'Perfil Pedro'),
        (108,8,'Perfil Laura'),
        (109,9,'Perfil Miguel'),
        (110,10,'Perfil Valentina');
    END;

    IF NOT EXISTS (SELECT 1 FROM Pelicula)
    BEGIN
        INSERT INTO Pelicula VALUES 
        (201,'Inception',148),
        (202,'Titanic',195),
        (203,'Avatar',162),
        (204,'The Matrix',136),
        (205,'The Godfather',175),
        (206,'Interstellar',169),
        (207,'Joker',122),
        (208,'Frozen',102),
        (209,'Coco',105),
        (210,'Shrek',90);
    END;

    IF NOT EXISTS (SELECT 1 FROM Categoria)
    BEGIN
        INSERT INTO Categoria VALUES 
        (301,'Accion'),
        (302,'Drama'),
        (303,'Comedia'),
        (304,'Animacion'),
        (305,'Terror'),
        (306,'Ciencia Ficcion'),
        (307,'Romance'),
        (308,'Musical'),
        (309,'Aventura'),
        (310,'Documental');
    END;

    IF NOT EXISTS (SELECT 1 FROM Dispositivo)
    BEGIN
        INSERT INTO Dispositivo VALUES 
        (401,'Smart TV','Televisor'),
        (402,'Laptop','Computador'),
        (403,'Tablet','Movil'),
        (404,'Smartphone','Movil'),
        (405,'Consola Xbox','Consola'),
        (406,'Consola PlayStation','Consola'),
        (407,'Proyector','Video'),
        (408,'iPad','Tablet'),
        (409,'PC Escritorio','Computador'),
        (410,'Smartwatch','Reloj');
    END;

    IF NOT EXISTS (SELECT 1 FROM Pelicula_Categoria)
    BEGIN
        INSERT INTO Pelicula_Categoria VALUES 
        (201,301),
        (202,302),
        (203,306),
        (204,301),
        (205,302),
        (206,306),
        (207,302),
        (208,304),
        (209,304),
        (210,303);
    END;

    IF NOT EXISTS (SELECT 1 FROM Perfil_Pelicula)
    BEGIN
        INSERT INTO Perfil_Pelicula VALUES 
        (101,201,401,'2025-01-10 14:30:00'),
        (102,202,402,'2025-01-11 16:00:00'),
        (103,203,403,'2025-01-12 18:45:00'),
        (104,204,404,'2025-01-13 20:15:00'),
        (105,205,405,'2025-01-14 21:10:00'),
        (106,206,406,'2025-01-15 19:00:00'),
        (107,207,407,'2025-01-16 22:30:00'),
        (108,208,408,'2025-01-17 13:20:00'),
        (109,209,409,'2025-01-18 17:55:00'),
        (110,210,410,'2025-01-19 12:40:00');
    END;
END;

EXEC insertar_datos_streaming;

CREATE VIEW UsuariosPerfiles AS
SELECT u.id_usuario, u.nombre AS Usuario, p.id_perfil, p.nombre AS Perfil
FROM Usuario u
INNER JOIN Perfil p ON u.id_usuario = p.id_usuario;

CREATE VIEW PeliculasCategorias AS
SELECT pc.id_pelicula, pel.titulo, cat.nombre AS Categoria
FROM Pelicula_Categoria pc
INNER JOIN Pelicula pel ON pc.id_pelicula = pel.id_pelicula
INNER JOIN Categoria cat ON pc.id_categoria = cat.id_categoria;

CREATE VIEW PerfilesPeliculas AS
SELECT pp.id_perfil, p.nombre AS Perfil, pel.titulo, pp.fecha
FROM Perfil_Pelicula pp
INNER JOIN Perfil p ON pp.id_perfil = p.id_perfil
INNER JOIN Pelicula pel ON pp.id_pelicula = pel.id_pelicula;

CREATE VIEW DispositivosUsados AS
SELECT d.id_dispositivo, d.nombre AS Dispositivo, COUNT(pp.id_perfil) AS VecesUsado
FROM Dispositivo d
LEFT JOIN Perfil_Pelicula pp ON d.id_dispositivo = pp.id_dispositivo
GROUP BY d.id_dispositivo, d.nombre;

CREATE VIEW TopPeliculas AS
SELECT pel.titulo, COUNT(pp.id_perfil) AS VecesVistas
FROM Pelicula pel
INNER JOIN Perfil_Pelicula pp ON pel.id_pelicula = pp.id_pelicula
GROUP BY pel.titulo;

CREATE OR ALTER PROCEDURE ver_vistas_streaming
AS
BEGIN
    SELECT * FROM UsuariosPerfiles;
    SELECT * FROM PeliculasCategorias;
    SELECT * FROM PerfilesPeliculas;
    SELECT * FROM DispositivosUsados;
    SELECT * FROM TopPeliculas;
END;

EXEC ver_vistas_streaming;