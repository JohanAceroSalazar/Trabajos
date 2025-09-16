CREATE DATABASE Colegio;
USE Colegio;

CREATE OR ALTER PROCEDURE crear_tablas_academicas
AS
BEGIN
    IF OBJECT_ID('Estudiante', 'U') IS NULL
    BEGIN
        CREATE TABLE Estudiante (
            id_estudiante INT PRIMARY KEY,
            nombre VARCHAR(100),
            fecha_nacimiento DATE
        );
    END;

    IF OBJECT_ID('Profesor', 'U') IS NULL
    BEGIN
        CREATE TABLE Profesor (
            id_profesor INT PRIMARY KEY,
            nombre VARCHAR(100),
            especialidad VARCHAR(50)
        );
    END;

    IF OBJECT_ID('Curso', 'U') IS NULL
    BEGIN
        CREATE TABLE Curso (
            id_curso INT PRIMARY KEY,
            nombre VARCHAR(100),
            descripcion TEXT
        );
    END;

    IF OBJECT_ID('Grado', 'U') IS NULL
    BEGIN
        CREATE TABLE Grado (
            id_grado INT PRIMARY KEY,
            nombre VARCHAR(20),
            nivel INT
        );
    END;

    IF OBJECT_ID('Evaluacion', 'U') IS NULL
    BEGIN
        CREATE TABLE Evaluacion (
            id_evaluacion INT PRIMARY KEY,
            id_estudiante INT,
            id_curso INT,
            nota DECIMAL(4,2),
            FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante),
            FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
        );
    END;

    IF OBJECT_ID('Estudiante_Curso', 'U') IS NULL
    BEGIN
        CREATE TABLE Estudiante_Curso (
            id_estudiante INT,
            id_curso INT,
            fecha_inscripcion DATE,
            PRIMARY KEY (id_estudiante, id_curso),
            FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante),
            FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
        );
    END;

    IF OBJECT_ID('Profesor_Curso', 'U') IS NULL
    BEGIN
        CREATE TABLE Profesor_Curso (
            id_profesor INT,
            id_curso INT,
            periodo VARCHAR(20),
            PRIMARY KEY (id_profesor, id_curso),
            FOREIGN KEY (id_profesor) REFERENCES Profesor(id_profesor),
            FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
        );
    END;
END;

EXEC crear_tablas_academicas;

CREATE OR ALTER PROCEDURE insertar_datos_academicas
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Estudiante)
    BEGIN
        INSERT INTO Estudiante (id_estudiante, nombre, fecha_nacimiento) VALUES
        (1,'Juan Pérez','2008-05-10'),
        (2,'María Gómez','2007-03-22'),
        (3,'Pedro López','2009-07-15'),
        (4,'Laura Torres','2008-11-30'),
        (5,'Andrés Díaz','2007-01-18'),
        (6,'Sofía Ruiz','2008-09-25'),
        (7,'Carlos Mejía','2009-12-02'),
        (8,'Ana Fernández','2007-04-14'),
        (9,'Felipe Castro','2008-06-05'),
        (10,'Mónica Rojas','2009-02-20');
    END;

    IF NOT EXISTS (SELECT 1 FROM Profesor)
    BEGIN
        INSERT INTO Profesor (id_profesor, nombre, especialidad) VALUES
        (101,'Luis Ramírez','Matemáticas'),
        (102,'Paola Herrera','Lengua'),
        (103,'Miguel Ortiz','Historia'),
        (104,'Diana Vargas','Ciencias'),
        (105,'Jorge Castillo','Geografía'),
        (106,'Natalia Sánchez','Inglés'),
        (107,'Ricardo Moreno','Educación Física'),
        (108,'Camila León','Arte'),
        (109,'David Pardo','Música'),
        (110,'Esteban Silva','Informática');
    END;

    IF NOT EXISTS (SELECT 1 FROM Curso)
    BEGIN
        INSERT INTO Curso (id_curso, nombre, descripcion) VALUES
        (201,'Matemáticas','Curso de aritmética y álgebra'),
        (202,'Lengua','Curso de gramática y literatura'),
        (203,'Historia','Curso de historia universal'),
        (204,'Ciencias','Curso de biología y química'),
        (205,'Geografía','Curso de geografía física y política'),
        (206,'Inglés','Curso de idioma inglés'),
        (207,'Educación Física','Curso de deportes y salud'),
        (208,'Arte','Curso de dibujo y pintura'),
        (209,'Música','Curso de teoría musical'),
        (210,'Informática','Curso de computación básica');
    END;

    IF NOT EXISTS (SELECT 1 FROM Grado)
    BEGIN
        INSERT INTO Grado (id_grado, nombre, nivel) VALUES
        (301,'Primero',1),
        (302,'Segundo',2),
        (303,'Tercero',3),
        (304,'Cuarto',4),
        (305,'Quinto',5),
        (306,'Sexto',6),
        (307,'Séptimo',7),
        (308,'Octavo',8),
        (309,'Noveno',9),
        (310,'Décimo',10);
    END;

    IF NOT EXISTS (SELECT 1 FROM Evaluacion)
    BEGIN
        INSERT INTO Evaluacion (id_evaluacion, id_estudiante, id_curso, nota) VALUES
        (401,1,201,4.50),
        (402,2,202,3.80),
        (403,3,203,4.00),
        (404,4,204,4.70),
        (405,5,205,3.50),
        (406,6,206,4.20),
        (407,7,207,4.80),
        (408,8,208,3.90),
        (409,9,209,4.30),
        (410,10,210,4.10);
    END;

    IF NOT EXISTS (SELECT 1 FROM Estudiante_Curso)
    BEGIN
        INSERT INTO Estudiante_Curso (id_estudiante, id_curso, fecha_inscripcion) VALUES
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

    IF NOT EXISTS (SELECT 1 FROM Profesor_Curso)
    BEGIN
        INSERT INTO Profesor_Curso (id_profesor, id_curso, periodo) VALUES
        (101,201,'2025-A'),
        (102,202,'2025-A'),
        (103,203,'2025-A'),
        (104,204,'2025-A'),
        (105,205,'2025-A'),
        (106,206,'2025-A'),
        (107,207,'2025-A'),
        (108,208,'2025-A'),
        (109,209,'2025-A'),
        (110,210,'2025-A');
    END;
END;

EXEC insertar_datos_academicas;

CREATE VIEW estudiantes_cursos
AS
SELECT e.id_estudiante, e.nombre AS estudiante, c.nombre AS curso, ec.fecha_inscripcion
FROM Estudiante e
JOIN Estudiante_Curso ec ON e.id_estudiante = ec.id_estudiante
JOIN Curso c ON ec.id_curso = c.id_curso;

CREATE VIEW profesores_cursos
AS
SELECT p.id_profesor, p.nombre AS profesor, c.nombre AS curso, pc.periodo
FROM Profesor p
JOIN Profesor_Curso pc ON p.id_profesor = pc.id_profesor
JOIN Curso c ON pc.id_curso = c.id_curso;

CREATE VIEW evaluaciones_estudiantes
AS
SELECT ev.id_evaluacion, e.nombre AS estudiante, c.nombre AS curso, ev.nota
FROM Evaluacion ev
JOIN Estudiante e ON ev.id_estudiante = e.id_estudiante
JOIN Curso c ON ev.id_curso = c.id_curso;

CREATE VIEW cursos_profesores
AS
SELECT c.id_curso, c.nombre AS curso, p.nombre AS profesor
FROM Curso c
JOIN Profesor_Curso pc ON c.id_curso = pc.id_curso
JOIN Profesor p ON pc.id_profesor = p.id_profesor;

CREATE VIEW estudiantes_evaluaciones
AS
SELECT e.id_estudiante, e.nombre AS estudiante, ev.nota, c.nombre AS curso
FROM Estudiante e
JOIN Evaluacion ev ON e.id_estudiante = ev.id_estudiante
JOIN Curso c ON ev.id_curso = c.id_curso;

CREATE OR ALTER PROCEDURE ver_vistas_academicas
AS
BEGIN
    SELECT * FROM estudiantes_cursos;
    SELECT * FROM profesores_cursos;
    SELECT * FROM evaluaciones_estudiantes;
    SELECT * FROM cursos_profesores;
    SELECT * FROM estudiantes_evaluaciones;
END;

EXEC ver_vistas_academicas;