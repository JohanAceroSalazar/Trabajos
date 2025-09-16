CREATE DATABASE Adopciones;
USE Adopciones;

CREATE OR ALTER PROCEDURE crear_tablas_adopciones
AS
BEGIN
    IF OBJECT_ID('dbo.Adoptante','U') IS NULL
    BEGIN
        CREATE TABLE Adoptante(
            id_adoptante INT PRIMARY KEY,
            nombre VARCHAR(100),
            documento VARCHAR(20)
        );
    END;

    IF OBJECT_ID('dbo.Refugio','U') IS NULL
    BEGIN
        CREATE TABLE Refugio(
            id_refugio INT PRIMARY KEY,
            nombre VARCHAR(100),
            direccion VARCHAR(150)
        );
    END;

    IF OBJECT_ID('dbo.Mascota','U') IS NULL
    BEGIN
        CREATE TABLE Mascota(
            id_mascota INT PRIMARY KEY,
            nombre VARCHAR(50),
            especie VARCHAR(50),
            id_refugio INT,
            FOREIGN KEY(id_refugio) REFERENCES Refugio(id_refugio)
        );
    END;

    IF OBJECT_ID('dbo.Adoptante_Mascota','U') IS NULL
    BEGIN
        CREATE TABLE Adoptante_Mascota(
            id_adoptante INT,
            id_mascota INT,
            fecha_adopcion DATE,
            PRIMARY KEY(id_adoptante, id_mascota),
            FOREIGN KEY(id_adoptante) REFERENCES Adoptante(id_adoptante),
            FOREIGN KEY(id_mascota) REFERENCES Mascota(id_mascota)
        );
    END;

    IF OBJECT_ID('dbo.Veterinario','U') IS NULL
    BEGIN
        CREATE TABLE Veterinario(
            id_veterinario INT PRIMARY KEY,
            nombre VARCHAR(100),
            especialidad VARCHAR(100)
        );
    END;

    IF OBJECT_ID('dbo.Mascota_Veterinario','U') IS NULL
    BEGIN
        CREATE TABLE Mascota_Veterinario(
            id_mascota INT,
            id_veterinario INT,
            fecha_revision DATE,
            PRIMARY KEY(id_mascota, id_veterinario),
            FOREIGN KEY(id_mascota) REFERENCES Mascota(id_mascota),
            FOREIGN KEY(id_veterinario) REFERENCES Veterinario(id_veterinario)
        );
    END;

    IF OBJECT_ID('dbo.Seguimiento','U') IS NULL
    BEGIN
        CREATE TABLE Seguimiento(
            id_seguimiento INT PRIMARY KEY,
            id_mascota INT,
            nota TEXT,
            FOREIGN KEY(id_mascota) REFERENCES Mascota(id_mascota)
        );
    END;
END;

EXEC crear_tablas_adopciones;

CREATE OR ALTER PROCEDURE insertar_datos_adopciones
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Adoptante)
    BEGIN
        INSERT INTO Adoptante (id_adoptante, nombre, documento) VALUES
        (1, 'Carlos', 'DOC001'),
        (2, 'María', 'DOC002'),
        (3, 'Juan', 'DOC003'),
        (4, 'Laura', 'DOC004'),
        (5, 'Pedro', 'DOC005'),
        (6, 'Ana', 'DOC006'),
        (7, 'Sofía', 'DOC007'),
        (8, 'Luis', 'DOC008'),
        (9, 'Camila', 'DOC009'),
        (10, 'Felipe', 'DOC010');
    END;

    IF NOT EXISTS (SELECT 1 FROM Refugio)
    BEGIN
        INSERT INTO Refugio (id_refugio, nombre, direccion) VALUES
        (101, 'Refugio Esperanza', 'Calle 1 #23'),
        (102, 'Refugio Vida', 'Carrera 5 #40'),
        (103, 'Hogar Animal', 'Av. 10 #15'),
        (104, 'Refugio Sanar', 'Calle 20 #50'),
        (105, 'Rescate Animal', 'Carrera 7 #12'),
        (106, 'Refugio Hogar Feliz', 'Calle 15 #33'),
        (107, 'Amigos Peludos', 'Av. 30 #80'),
        (108, 'Refugio Luz', 'Carrera 11 #25'),
        (109, 'Salvando Huellas', 'Calle 45 #99'),
        (110, 'Refugio Hogar Animal', 'Carrera 18 #60');
    END;

    IF NOT EXISTS (SELECT 1 FROM Mascota)
    BEGIN
        INSERT INTO Mascota (id_mascota, nombre, especie, id_refugio) VALUES
        (201, 'Firulais', 'Perro', 101),
        (202, 'Misu', 'Gato', 101),
        (203, 'Rex', 'Perro', 102),
        (204, 'Luna', 'Gato', 103),
        (205, 'Max', 'Perro', 104),
        (206, 'Nala', 'Gato', 105),
        (207, 'Rocky', 'Perro', 106),
        (208, 'Simba', 'Gato', 107),
        (209, 'Toby', 'Perro', 108),
        (210, 'Pelusa', 'Gato', 109);
    END;

    IF NOT EXISTS (SELECT 1 FROM Adoptante_Mascota)
    BEGIN
        INSERT INTO Adoptante_Mascota (id_adoptante, id_mascota, fecha_adopcion) VALUES
        (1, 201, '2024-01-10'),
        (2, 202, '2024-02-15'),
        (3, 203, '2024-03-20'),
        (4, 204, '2024-04-12'),
        (5, 205, '2024-05-18'),
        (6, 206, '2024-06-05'),
        (7, 207, '2024-07-10'),
        (8, 208, '2024-08-25'),
        (9, 209, '2024-09-30'),
        (10, 210, '2024-10-22');
    END;

    IF NOT EXISTS (SELECT 1 FROM Veterinario)
    BEGIN
        INSERT INTO Veterinario (id_veterinario, nombre, especialidad) VALUES
        (301, 'Dr. Gómez', 'Caninos'),
        (302, 'Dra. Pérez', 'Felinos'),
        (303, 'Dr. López', 'Exóticos'),
        (304, 'Dra. Torres', 'Cirugía'),
        (305, 'Dr. Ramírez', 'Dermatología'),
        (306, 'Dra. Jiménez', 'Rehabilitación'),
        (307, 'Dr. Herrera', 'Cardiología'),
        (308, 'Dra. Vargas', 'Nutrición'),
        (309, 'Dr. Castro', 'Odontología'),
        (310, 'Dra. Molina', 'Neurología');
    END;

    IF NOT EXISTS (SELECT 1 FROM Mascota_Veterinario)
    BEGIN
        INSERT INTO Mascota_Veterinario (id_mascota, id_veterinario, fecha_revision) VALUES
        (201, 301, '2024-02-01'),
        (202, 302, '2024-02-05'),
        (203, 303, '2024-03-10'),
        (204, 304, '2024-03-15'),
        (205, 305, '2024-04-01'),
        (206, 306, '2024-04-20'),
        (207, 307, '2024-05-05'),
        (208, 308, '2024-06-10'),
        (209, 309, '2024-07-01'),
        (210, 310, '2024-08-12');
    END;

    IF NOT EXISTS (SELECT 1 FROM Seguimiento)
    BEGIN
        INSERT INTO Seguimiento (id_seguimiento, id_mascota, nota) VALUES
        (401, 201, 'Mascota en buen estado'),
        (402, 202, 'Requiere control nutricional'),
        (403, 203, 'Vacunación completa'),
        (404, 204, 'Se observa estrés leve'),
        (405, 205, 'Control dental realizado'),
        (406, 206, 'En recuperación por cirugía'),
        (407, 207, 'Peso dentro de lo normal'),
        (408, 208, 'Energía alta, comportamiento positivo'),
        (409, 209, 'Tratamiento dermatológico en curso'),
        (410, 210, 'Mascota muy activa y saludable');
    END;
END;

EXEC insertar_datos_adopciones;

CREATE VIEW adoptantes_mascotas AS
SELECT a.id_adoptante, a.nombre AS adoptante, m.id_mascota, m.nombre AS mascota, m.especie, am.fecha_adopcion
FROM Adoptante a
INNER JOIN Adoptante_Mascota am ON a.id_adoptante = am.id_adoptante
INNER JOIN Mascota m ON am.id_mascota = m.id_mascota;

CREATE VIEW mascotas_refugios AS
SELECT m.id_mascota, m.nombre AS mascota, m.especie, r.nombre AS refugio, r.direccion
FROM Mascota m
INNER JOIN Refugio r ON m.id_refugio = r.id_refugio;

CREATE VIEW mascotas_veterinarios AS
SELECT m.id_mascota, m.nombre AS mascota, v.id_veterinario, v.nombre AS veterinario, v.especialidad, mv.fecha_revision
FROM Mascota m
INNER JOIN Mascota_Veterinario mv ON m.id_mascota = mv.id_mascota
INNER JOIN Veterinario v ON mv.id_veterinario = v.id_veterinario;

CREATE VIEW mascotas_seguimiento AS
SELECT m.id_mascota, m.nombre AS mascota, m.especie, s.id_seguimiento, s.nota
FROM Mascota m
INNER JOIN Seguimiento s ON m.id_mascota = s.id_mascota;

CREATE VIEW refugios AS
SELECT id_refugio, nombre, direccion
FROM Refugio;

CREATE PROCEDURE ver_reportes_adopciones
AS
BEGIN
    SELECT * FROM adoptantes_mascotas;
    SELECT * FROM mascotas_refugios;
    SELECT * FROM mascotas_veterinarios;
    SELECT * FROM mascotas_seguimiento;
    SELECT * FROM refugios;
END;

EXEC ver_reportes_adopciones;