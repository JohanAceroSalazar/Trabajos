CREATE DATABASE Reunion;
USE Reunion;

CREATE OR ALTER PROCEDURE crear_tablas_conferencia
AS
BEGIN
    IF OBJECT_ID('Asistente', 'U') IS NULL
    BEGIN
        CREATE TABLE Asistente (
            id_asistente INT PRIMARY KEY,
            nombre VARCHAR(100),
            correo VARCHAR(100)
        );
    END;

    IF OBJECT_ID('Sala', 'U') IS NULL
    BEGIN
        CREATE TABLE Sala (
            id_sala INT PRIMARY KEY,
            nombre VARCHAR(50),
            capacidad INT
        );
    END;

    IF OBJECT_ID('Organizador', 'U') IS NULL
    BEGIN
        CREATE TABLE Organizador (
            id_organizador INT PRIMARY KEY,
            nombre VARCHAR(100),
            contacto VARCHAR(100)
        );
    END;

    IF OBJECT_ID('Conferencia', 'U') IS NULL
    BEGIN
        CREATE TABLE Conferencia (
            id_conferencia INT PRIMARY KEY,
            id_sala INT,
            id_organizador INT,
            titulo VARCHAR(100),
            FOREIGN KEY (id_sala) REFERENCES Sala(id_sala),
            FOREIGN KEY (id_organizador) REFERENCES Organizador(id_organizador)
        );
    END;

    IF OBJECT_ID('Ponente', 'U') IS NULL
    BEGIN
        CREATE TABLE Ponente (
            id_ponente INT PRIMARY KEY,
            nombre VARCHAR(100),
            especialidad VARCHAR(100)
        );
    END;

    IF OBJECT_ID('Asistente_Conferencia', 'U') IS NULL
    BEGIN
        CREATE TABLE Asistente_Conferencia (
            id_asistente INT,
            id_conferencia INT,
            asistencia_confirmada BIT,
            PRIMARY KEY (id_asistente, id_conferencia),
            FOREIGN KEY (id_asistente) REFERENCES Asistente(id_asistente),
            FOREIGN KEY (id_conferencia) REFERENCES Conferencia(id_conferencia)
        );
    END;

    IF OBJECT_ID('Ponente_Conferencia', 'U') IS NULL
    BEGIN
        CREATE TABLE Ponente_Conferencia (
            id_ponente INT,
            id_conferencia INT,
            tema VARCHAR(100),
            PRIMARY KEY (id_ponente, id_conferencia),
            FOREIGN KEY (id_ponente) REFERENCES Ponente(id_ponente),
            FOREIGN KEY (id_conferencia) REFERENCES Conferencia(id_conferencia)
        );
    END;
END;

EXEC crear_tablas_conferencia;

CREATE OR ALTER PROCEDURE insertar_datos_conferencia
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Asistente)
    BEGIN
        INSERT INTO Asistente VALUES
        (1,'Asistente1','a1@mail.com'),
        (2,'Asistente2','a2@mail.com'),
        (3,'Asistente3','a3@mail.com'),
        (4,'Asistente4','a4@mail.com'),
        (5,'Asistente5','a5@mail.com'),
        (6,'Asistente6','a6@mail.com'),
        (7,'Asistente7','a7@mail.com'),
        (8,'Asistente8','a8@mail.com'),
        (9,'Asistente9','a9@mail.com'),
        (10,'Asistente10','a10@mail.com');
    END;

    IF NOT EXISTS (SELECT 1 FROM Sala)
    BEGIN
        INSERT INTO Sala VALUES
        (101,'Sala1',50),
        (102,'Sala2',60),
        (103,'Sala3',70),
        (104,'Sala4',80),
        (105,'Sala5',90),
        (106,'Sala6',100),
        (107,'Sala7',110),
        (108,'Sala8',120),
        (109,'Sala9',130),
        (110,'Sala10',140);
    END;

    IF NOT EXISTS (SELECT 1 FROM Organizador)
    BEGIN
        INSERT INTO Organizador VALUES
        (201,'Organizador1','o1@mail.com'),
        (202,'Organizador2','o2@mail.com'),
        (203,'Organizador3','o3@mail.com'),
        (204,'Organizador4','o4@mail.com'),
        (205,'Organizador5','o5@mail.com'),
        (206,'Organizador6','o6@mail.com'),
        (207,'Organizador7','o7@mail.com'),
        (208,'Organizador8','o8@mail.com'),
        (209,'Organizador9','o9@mail.com'),
        (210,'Organizador10','o10@mail.com');
    END;

    IF NOT EXISTS (SELECT 1 FROM Conferencia)
    BEGIN
        INSERT INTO Conferencia VALUES
        (301,101,201,'Conferencia1'),
        (302,102,202,'Conferencia2'),
        (303,103,203,'Conferencia3'),
        (304,104,204,'Conferencia4'),
        (305,105,205,'Conferencia5'),
        (306,106,206,'Conferencia6'),
        (307,107,207,'Conferencia7'),
        (308,108,208,'Conferencia8'),
        (309,109,209,'Conferencia9'),
        (310,110,210,'Conferencia10');
    END;

    IF NOT EXISTS (SELECT 1 FROM Ponente)
    BEGIN
        INSERT INTO Ponente VALUES
        (401,'Ponente1','Especialidad1'),
        (402,'Ponente2','Especialidad2'),
        (403,'Ponente3','Especialidad3'),
        (404,'Ponente4','Especialidad4'),
        (405,'Ponente5','Especialidad5'),
        (406,'Ponente6','Especialidad6'),
        (407,'Ponente7','Especialidad7'),
        (408,'Ponente8','Especialidad8'),
        (409,'Ponente9','Especialidad9'),
        (410,'Ponente10','Especialidad10');
    END;

    IF NOT EXISTS (SELECT 1 FROM Asistente_Conferencia)
    BEGIN
        INSERT INTO Asistente_Conferencia VALUES
        (1,301,1),
        (2,302,0),
        (3,303,1),
        (4,304,0),
        (5,305,1),
        (6,306,0),
        (7,307,1),
        (8,308,0),
        (9,309,1),
        (10,310,0);
    END;

    IF NOT EXISTS (SELECT 1 FROM Ponente_Conferencia)
    BEGIN
        INSERT INTO Ponente_Conferencia VALUES
        (401,301,'Tema1'),
        (402,302,'Tema2'),
        (403,303,'Tema3'),
        (404,304,'Tema4'),
        (405,305,'Tema5'),
        (406,306,'Tema6'),
        (407,307,'Tema7'),
        (408,308,'Tema8'),
        (409,309,'Tema9'),
        (410,310,'Tema10');
    END;
END;

EXEC insertar_datos_conferencia;

CREATE VIEW Asistentes AS
SELECT id_asistente, nombre, correo
FROM Asistente;

CREATE VIEW Salas AS
SELECT id_sala, nombre, capacidad
FROM Sala;

CREATE VIEW Conferencias AS
SELECT c.id_conferencia, c.titulo, s.nombre AS sala, o.nombre AS organizador
FROM Conferencia c
INNER JOIN Sala s ON c.id_sala = s.id_sala
INNER JOIN Organizador o ON c.id_organizador = o.id_organizador;

CREATE VIEW Ponentes AS
SELECT id_ponente, nombre, especialidad
FROM Ponente;

CREATE VIEW Asistencia AS
SELECT a.nombre AS asistente, c.titulo AS conferencia, ac.asistencia_confirmada
FROM Asistente a
INNER JOIN Asistente_Conferencia ac ON a.id_asistente = ac.id_asistente
INNER JOIN Conferencia c ON ac.id_conferencia = c.id_conferencia;

CREATE OR ALTER PROCEDURE ver_vistas_conferencia
AS
BEGIN
    SELECT * FROM Asistentes;
    SELECT * FROM Salas;
    SELECT * FROM Conferencias;
    SELECT * FROM Ponentes;
    SELECT * FROM Asistencia;
END;

EXEC ver_vistas_conferencia;