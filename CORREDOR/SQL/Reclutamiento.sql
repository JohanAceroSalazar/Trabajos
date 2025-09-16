CREATE DATABASE Reclutamiento;
USE Reclutamiento;

CREATE OR ALTER PROCEDURE crear_tablas_reclutamiento
AS
BEGIN
    IF OBJECT_ID('Candidato', 'U') IS NULL
    BEGIN
        CREATE TABLE Candidato (
            id_candidato INT PRIMARY KEY,
            nombre VARCHAR(100),
            correo VARCHAR(100)
        );
    END;

    IF OBJECT_ID('Empresa', 'U') IS NULL
    BEGIN
        CREATE TABLE Empresa (
            id_empresa INT PRIMARY KEY,
            nombre VARCHAR(100),
            sector VARCHAR(50)
        );
    END;

    IF OBJECT_ID('Vacante', 'U') IS NULL
    BEGIN
        CREATE TABLE Vacante (
            id_vacante INT PRIMARY KEY,
            titulo VARCHAR(100),
            salario DECIMAL(10, 2),
            id_empresa INT,
            FOREIGN KEY (id_empresa) REFERENCES Empresa(id_empresa)
        );
    END;

    IF OBJECT_ID('Habilidad', 'U') IS NULL
    BEGIN
        CREATE TABLE Habilidad (
            id_habilidad INT PRIMARY KEY,
            nombre VARCHAR(50)
        );
    END;

    IF OBJECT_ID('Evaluacion', 'U') IS NULL
    BEGIN
        CREATE TABLE Evaluacion (
            id_evaluacion INT PRIMARY KEY,
            id_candidato INT,
            tipo VARCHAR(50),
            resultado VARCHAR(50),
            FOREIGN KEY (id_candidato) REFERENCES Candidato(id_candidato)
        );
    END;

    IF OBJECT_ID('Candidato_Habilidad', 'U') IS NULL
    BEGIN
        CREATE TABLE Candidato_Habilidad (
            id_candidato INT,
            id_habilidad INT,
            nivel VARCHAR(20),
            PRIMARY KEY (id_candidato, id_habilidad),
            FOREIGN KEY (id_candidato) REFERENCES Candidato(id_candidato),
            FOREIGN KEY (id_habilidad) REFERENCES Habilidad(id_habilidad)
        );
    END;

    IF OBJECT_ID('Candidato_Vacante', 'U') IS NULL
    BEGIN
        CREATE TABLE Candidato_Vacante (
            id_candidato INT,
            id_vacante INT,
            fecha_aplicacion DATE,
            PRIMARY KEY (id_candidato, id_vacante),
            FOREIGN KEY (id_candidato) REFERENCES Candidato(id_candidato),
            FOREIGN KEY (id_vacante) REFERENCES Vacante(id_vacante)
        );
    END;
END;

EXEC crear_tablas_reclutamiento;

CREATE OR ALTER PROCEDURE insertar_datos_reclutamiento
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Candidato)
    BEGIN
        INSERT INTO Candidato (id_candidato, nombre, correo) VALUES
        (1,'Candidato 1','c1@mail.com'),
        (2,'Candidato 2','c2@mail.com'),
        (3,'Candidato 3','c3@mail.com'),
        (4,'Candidato 4','c4@mail.com'),
        (5,'Candidato 5','c5@mail.com'),
        (6,'Candidato 6','c6@mail.com'),
        (7,'Candidato 7','c7@mail.com'),
        (8,'Candidato 8','c8@mail.com'),
        (9,'Candidato 9','c9@mail.com'),
        (10,'Candidato 10','c10@mail.com');
    END;

    IF NOT EXISTS (SELECT 1 FROM Empresa)
    BEGIN
        INSERT INTO Empresa (id_empresa, nombre, sector) VALUES
        (101,'Empresa 1','Tecnología'),
        (102,'Empresa 2','Salud'),
        (103,'Empresa 3','Educación'),
        (104,'Empresa 4','Finanzas'),
        (105,'Empresa 5','Transporte'),
        (106,'Empresa 6','Construcción'),
        (107,'Empresa 7','Retail'),
        (108,'Empresa 8','Turismo'),
        (109,'Empresa 9','Comunicaciones'),
        (110,'Empresa 10','Energía');
    END;

    IF NOT EXISTS (SELECT 1 FROM Vacante)
    BEGIN
        INSERT INTO Vacante (id_vacante, titulo, salario, id_empresa) VALUES
        (201,'Vacante 1',1500.00,101),
        (202,'Vacante 2',1800.00,102),
        (203,'Vacante 3',2000.00,103),
        (204,'Vacante 4',2200.00,104),
        (205,'Vacante 5',2500.00,105),
        (206,'Vacante 6',2700.00,106),
        (207,'Vacante 7',3000.00,107),
        (208,'Vacante 8',3200.00,108),
        (209,'Vacante 9',3500.00,109),
        (210,'Vacante 10',3800.00,110);
    END;

    IF NOT EXISTS (SELECT 1 FROM Habilidad)
    BEGIN
        INSERT INTO Habilidad (id_habilidad, nombre) VALUES
        (301,'Java'),
        (302,'SQL'),
        (303,'Python'),
        (304,'Excel'),
        (305,'Inglés'),
        (306,'Comunicación'),
        (307,'Liderazgo'),
        (308,'C#'),
        (309,'PHP'),
        (310,'Gestión de proyectos');
    END;

    IF NOT EXISTS (SELECT 1 FROM Evaluacion)
    BEGIN
        INSERT INTO Evaluacion (id_evaluacion, id_candidato, tipo, resultado) VALUES
        (401,1,'Psicotécnica','Aprobado'),
        (402,2,'Psicotécnica','No Aprobado'),
        (403,3,'Técnica','Aprobado'),
        (404,4,'Técnica','No Aprobado'),
        (405,5,'Psicotécnica','Aprobado'),
        (406,6,'Técnica','Aprobado'),
        (407,7,'Psicotécnica','No Aprobado'),
        (408,8,'Técnica','Aprobado'),
        (409,9,'Psicotécnica','Aprobado'),
        (410,10,'Técnica','No Aprobado');
    END;

    IF NOT EXISTS (SELECT 1 FROM Candidato_Habilidad)
    BEGIN
        INSERT INTO Candidato_Habilidad (id_candidato, id_habilidad, nivel) VALUES
        (1,301,'Avanzado'),
        (2,302,'Intermedio'),
        (3,303,'Básico'),
        (4,304,'Avanzado'),
        (5,305,'Intermedio'),
        (6,306,'Básico'),
        (7,307,'Avanzado'),
        (8,308,'Intermedio'),
        (9,309,'Básico'),
        (10,310,'Avanzado');
    END;

    IF NOT EXISTS (SELECT 1 FROM Candidato_Vacante)
    BEGIN
        INSERT INTO Candidato_Vacante (id_candidato, id_vacante, fecha_aplicacion) VALUES
        (1,201,'2025-01-10'),
        (2,202,'2025-01-11'),
        (3,203,'2025-01-12'),
        (4,204,'2025-01-13'),
        (5,205,'2025-01-14'),
        (6,206,'2025-01-15'),
        (7,207,'2025-01-16'),
        (8,208,'2025-01-17'),
        (9,209,'2025-01-18'),
        (10,210,'2025-01-19');
    END;
END;

EXEC insertar_datos_reclutamiento;

CREATE VIEW candidatos_habilidades AS
SELECT c.id_candidato, c.nombre AS candidato, h.nombre AS habilidad, ch.nivel
FROM Candidato c
JOIN Candidato_Habilidad ch ON c.id_candidato = ch.id_candidato
JOIN Habilidad h ON ch.id_habilidad = h.id_habilidad;

CREATE VIEW candidatos_vacantes AS
SELECT c.nombre AS candidato, v.titulo AS vacante, e.nombre AS empresa, cv.fecha_aplicacion
FROM Candidato c
JOIN Candidato_Vacante cv ON c.id_candidato = cv.id_candidato
JOIN Vacante v ON cv.id_vacante = v.id_vacante
JOIN Empresa e ON v.id_empresa = e.id_empresa;

CREATE VIEW vacantes_empresas AS
SELECT v.id_vacante, v.titulo, v.salario, e.nombre AS empresa, e.sector
FROM Vacante v
JOIN Empresa e ON v.id_empresa = e.id_empresa;

CREATE VIEW evaluaciones_candidatos AS
SELECT ev.id_evaluacion, c.nombre AS candidato, ev.tipo, ev.resultado
FROM Evaluacion ev
JOIN Candidato c ON ev.id_candidato = c.id_candidato;

CREATE VIEW habilidad_tabla AS
SELECT id_habilidad, nombre
FROM Habilidad;

CREATE OR ALTER PROCEDURE ver_vistas_reclutamiento
AS
BEGIN
    SELECT * FROM candidatos_habilidades;
    SELECT * FROM candidatos_vacantes;
    SELECT * FROM vacantes_empresas;
    SELECT * FROM evaluaciones_candidatos;
    SELECT * FROM habilidad_tabla;
END;

EXEC ver_vistas_reclutamiento;