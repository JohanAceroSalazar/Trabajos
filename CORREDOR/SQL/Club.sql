CREATE DATABASE Club;
USE Club;

CREATE OR ALTER PROCEDURE crear_tablas_club
AS
BEGIN
    IF OBJECT_ID('Socio', 'U') IS NULL
    BEGIN
    CREATE TABLE Socio (
        id_socio INT PRIMARY KEY,
        nombre VARCHAR(50),
        apellido VARCHAR(50)
    );
    END;

    IF OBJECT_ID('Disciplina', 'U') IS NULL
    BEGIN
    CREATE TABLE Disciplina (
        id_disciplina INT PRIMARY KEY,
        nombre VARCHAR(50),
        categoria VARCHAR(30)
    );
    END;

    IF OBJECT_ID('Monitor', 'U') IS NULL
    BEGIN
    CREATE TABLE Monitor (
        id_monitor INT PRIMARY KEY,
        nombre VARCHAR(50),
        especialidad VARCHAR(50)
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

    IF OBJECT_ID('socio_disciplina', 'U') IS NULL
    BEGIN
    CREATE TABLE socio_disciplina (
        id_socio INT,
        id_disciplina INT,
        fecha_inicio DATE,
        PRIMARY KEY (id_socio, id_disciplina),
        FOREIGN KEY (id_socio) REFERENCES Socio(id_socio),
        FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_disciplina)
    );
    END;

    IF OBJECT_ID('monitor_disciplina', 'U') IS NULL
    BEGIN
    CREATE TABLE monitor_disciplina (
        id_monitor INT,
        id_disciplina INT,
        fecha_asignacion DATE,
        PRIMARY KEY (id_monitor, id_disciplina),
        FOREIGN KEY (id_monitor) REFERENCES Monitor(id_monitor),
        FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_disciplina)
    );
    END;

    IF OBJECT_ID('Reserva', 'U') IS NULL
    BEGIN
    CREATE TABLE Reserva (
        id_reserva INT PRIMARY KEY,
        id_sala INT,
        id_disciplina INT,
        fecha_reserva DATE,
        FOREIGN KEY (id_sala) REFERENCES Sala(id_sala),
        FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_disciplina)
    );
    END;
END;

EXEC crear_tablas_club;

CREATE OR ALTER PROCEDURE insertar_datos_club
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Socio)
    BEGIN
        INSERT INTO Socio (id_socio, nombre, apellido) VALUES
        (1, 'Juan', 'Pérez'),
        (2, 'Ana', 'López'),
        (3, 'Carlos', 'Gómez'),
        (4, 'María', 'Martínez'),
        (5, 'Pedro', 'Rodríguez'),
        (6, 'Laura', 'Hernández'),
        (7, 'Jorge', 'Díaz'),
        (8, 'Lucía', 'Torres'),
        (9, 'Andrés', 'Ramírez'),
        (10, 'Sofía', 'Castro');
    END;

    IF NOT EXISTS (SELECT 1 FROM Disciplina)
    BEGIN
        INSERT INTO Disciplina (id_disciplina, nombre, categoria) VALUES
        (101, 'Fútbol', 'Deporte'),
        (102, 'Natación', 'Deporte'),
        (103, 'Yoga', 'Bienestar'),
        (104, 'Pilates', 'Bienestar'),
        (105, 'Karate', 'Artes Marciales'),
        (106, 'Judo', 'Artes Marciales'),
        (107, 'Crossfit', 'Fitness'),
        (108, 'Zumba', 'Fitness'),
        (109, 'Tenis', 'Deporte'),
        (110, 'Boxeo', 'Artes Marciales');
    END;

    IF NOT EXISTS (SELECT 1 FROM Monitor)
    BEGIN
        INSERT INTO Monitor (id_monitor, nombre, especialidad) VALUES
        (201, 'Miguel', 'Fútbol'),
        (202, 'Carolina', 'Natación'),
        (203, 'Ricardo', 'Yoga'),
        (204, 'Elena', 'Pilates'),
        (205, 'Luis', 'Karate'),
        (206, 'Valeria', 'Judo'),
        (207, 'Santiago', 'Crossfit'),
        (208, 'Paula', 'Zumba'),
        (209, 'Camilo', 'Tenis'),
        (210, 'Natalia', 'Boxeo');
    END;

    IF NOT EXISTS (SELECT 1 FROM Sala)
    BEGIN
        INSERT INTO Sala (id_sala, nombre, capacidad) VALUES
        (301, 'Sala A', 20),
        (302, 'Sala B', 15),
        (303, 'Sala C', 25),
        (304, 'Sala D', 30),
        (305, 'Sala E', 10),
        (306, 'Sala F', 18),
        (307, 'Sala G', 22),
        (308, 'Sala H', 16),
        (309, 'Sala I', 12),
        (310, 'Sala J', 28);
    END;

    IF NOT EXISTS (SELECT 1 FROM socio_disciplina)
    BEGIN
        INSERT INTO socio_disciplina (id_socio, id_disciplina, fecha_inicio) VALUES
        (1, 101, '2025-01-10'),
        (2, 102, '2025-01-12'),
        (3, 103, '2025-01-15'),
        (4, 104, '2025-01-20'),
        (5, 105, '2025-01-25'),
        (6, 106, '2025-01-28'),
        (7, 107, '2025-02-01'),
        (8, 108, '2025-02-05'),
        (9, 109, '2025-02-10'),
        (10, 110, '2025-02-12');
    END;

    IF NOT EXISTS (SELECT 1 FROM monitor_disciplina)
    BEGIN
        INSERT INTO monitor_disciplina (id_monitor, id_disciplina, fecha_asignacion) VALUES
        (201, 101, '2025-01-05'),
        (202, 102, '2025-01-07'),
        (203, 103, '2025-01-10'),
        (204, 104, '2025-01-15'),
        (205, 105, '2025-01-18'),
        (206, 106, '2025-01-20'),
        (207, 107, '2025-01-25'),
        (208, 108, '2025-01-28'),
        (209, 109, '2025-02-01'),
        (210, 110, '2025-02-05');
    END;

    IF NOT EXISTS (SELECT 1 FROM Reserva)
    BEGIN
        INSERT INTO Reserva (id_reserva, id_sala, id_disciplina, fecha_reserva) VALUES
        (401, 301, 101, '2025-03-01'),
        (402, 302, 102, '2025-03-02'),
        (403, 303, 103, '2025-03-03'),
        (404, 304, 104, '2025-03-04'),
        (405, 305, 105, '2025-03-05'),
        (406, 306, 106, '2025-03-06'),
        (407, 307, 107, '2025-03-07'),
        (408, 308, 108, '2025-03-08'),
        (409, 309, 109, '2025-03-09'),
        (410, 310, 110, '2025-03-10');
    END;
END;

EXEC insertar_datos_club;

    CREATE VIEW socios_disciplinas AS
    SELECT s.id_socio, s.nombre, s.apellido, d.id_disciplina, d.nombre AS disciplina, sd.fecha_inicio
    FROM Socio s
    INNER JOIN socio_disciplina sd ON s.id_socio = sd.id_socio
    INNER JOIN Disciplina d ON sd.id_disciplina = d.id_disciplina;

    CREATE VIEW monitores AS
    SELECT id_monitor, nombre, especialidad
    FROM Monitor;

    CREATE VIEW salas_reservas AS
    SELECT r.id_reserva, r.fecha_reserva, sa.id_sala, sa.nombre AS sala, sa.capacidad, d.nombre AS disciplina
    FROM Reserva r
    INNER JOIN Sala sa ON r.id_sala = sa.id_sala
    INNER JOIN Disciplina d ON r.id_disciplina = d.id_disciplina;

    CREATE VIEW disciplinas_socios AS
    SELECT d.id_disciplina, d.nombre AS disciplina, COUNT(sd.id_socio) AS total_socios
    FROM Disciplina d
    LEFT JOIN socio_disciplina sd ON d.id_disciplina = sd.id_disciplina
    GROUP BY d.id_disciplina, d.nombre;

    CREATE VIEW monitores_por_disciplina AS
    SELECT d.id_disciplina, d.nombre AS disciplina, COUNT(md.id_monitor) AS total_monitores
    FROM Disciplina d
    LEFT JOIN monitor_disciplina md ON d.id_disciplina = md.id_disciplina
    GROUP BY d.id_disciplina, d.nombre;

CREATE PROCEDURE mirar_todas_vistas
AS 
BEGIN 

    SELECT * FROM socios_disciplinas;
    SELECT * FROM monitores;
    SELECT * FROM salas_reservas;
    SELECT * FROM disciplinas_socios;
    SELECT * FROM monitores_por_disciplina;

END;

EXEC mirar_todas_vistas