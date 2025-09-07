CREATE DATABASE FeriaCorredor;
USE FeriaCorredor;

CREATE TABLE FeriaS (
    id_feria INT PRIMARY KEY,
    ciudad VARCHAR(100),
    fecha_inicio DATE,
    fecha_final DATE
);

CREATE TABLE Tematica (
    id_tematica INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Pabellon (
    id_pabellon INT PRIMARY KEY,
    id_feria INT,
    id_tematica INT,
    nombre VARCHAR(100),
    capacidad INT,
    FOREIGN KEY (id_feria) REFERENCES FeriaS(id_feria),
    FOREIGN KEY (id_tematica) REFERENCES Tematica(id_tematica)
);

CREATE TABLE Empresa (
    id_empresa INT PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(100)
);

CREATE TABLE Stand (
    id_stand INT PRIMARY KEY,
    id_empresa INT,
    id_pabellon INT,
    nombre VARCHAR(100),
    FOREIGN KEY (id_empresa) REFERENCES Empresa(id_empresa),
    FOREIGN KEY (id_pabellon) REFERENCES Pabellon(id_pabellon)
);

CREATE TABLE Persona (
    id_persona INT PRIMARY KEY,
    nombre VARCHAR(100),
    edad INT,
    telefono VARCHAR(20)
);

CREATE TABLE Responsable (
    id_responsable INT PRIMARY KEY,
    id_persona INT,
    FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
);

CREATE TABLE Ponente (
    id_ponente INT PRIMARY KEY,
    id_persona INT,
    FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
);

CREATE TABLE TipoEntrada (
    id_tipo_entrada INT PRIMARY KEY,
    tipo_entrada VARCHAR(50)
);

CREATE TABLE Visitante (
    id_visitante INT PRIMARY KEY,
    id_tipo_visitante INT,
    nombre VARCHAR (100),
    FOREIGN KEY (id_tipo_visitante) REFERENCES TipoEntrada(id_tipo_entrada)
);

CREATE TABLE Producto (
    id_producto INT PRIMARY KEY,
    id_stand INT,
    id_responsable INT,
    nombre VARCHAR(100),
    FOREIGN KEY (id_stand) REFERENCES Stand(id_stand),
    FOREIGN KEY (id_responsable) REFERENCES Responsable(id_responsable)
);

CREATE TABLE Charla (
    id_charla INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Demostraciones (
    id_demostracion INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Registro (
    id_registro INT PRIMARY KEY,
    id_feria INT,
    id_charla INT,
    id_visitante INT,
    id_empresa INT,
    id_demostracion INT,
    online BIT, -- 1 = online y 0 = presencial
    FOREIGN KEY (id_feria) REFERENCES FeriaS(id_feria),
    FOREIGN KEY (id_charla) REFERENCES Charla(id_charla),
    FOREIGN KEY (id_visitante) REFERENCES Visitante(id_visitante),
    FOREIGN KEY (id_empresa) REFERENCES Empresa(id_empresa),
    FOREIGN KEY (id_demostracion) REFERENCES Demostraciones(id_demostracion)
);

INSERT INTO FeriaS (id_feria, ciudad, fecha_inicio, fecha_final) VALUES
(1, 'Neiva', '2025-08-26', '2025-08-30');

INSERT INTO Tematica (id_tematica, nombre) VALUES
(11, 'Software'),
(12, 'Hardware'),
(13, 'IoT'),
(14, 'Inteligencia Artificial'),
(15, 'Realidad Virtual'),
(16, 'Ciberseguridad'),
(17, 'Robótica'),
(18, 'Big Data'),
(19, 'Blockchain'),
(20, 'Impresión 3D');

INSERT INTO Pabellon (id_pabellon, id_feria, id_tematica, nombre, capacidad) VALUES
(21, 1, 11, 'Pabellón A', 50),
(22, 1, 12, 'Pabellón B', 40),
(23, 1, 13, 'Pabellón C', 60),
(24, 1, 14, 'Pabellón D', 30),
(25, 1, 15, 'Pabellón E', 25),
(26, 1, 16, 'Pabellón F', 35),
(27, 1, 17, 'Pabellón G', 45),
(28, 1, 18, 'Pabellón H', 50),
(29, 1, 19, 'Pabellón I', 20),
(30, 1, 20, 'Pabellón J', 55);

INSERT INTO Empresa (id_empresa, nombre, ciudad) VALUES
(31, 'TechSoft', 'Bogotá'),
(32, 'HardSolutions', 'Medellín'), 
(33, 'IoT Corp', 'Cali'),
(34, 'AI Labs', 'Barranquilla'),
(35, 'VR World', 'Cartagena'),
(36, 'CyberSafe', 'Neiva'),
(37, 'RoboTech', 'Pereira'),
(38, 'BigDataPro', 'Manizales'),
(39, 'BlockChainers', 'Medellin'),
(40, '3DPrint SA', 'Medellin');

INSERT INTO Stand (id_stand, id_empresa, id_pabellon, nombre) VALUES
(41, 31, 21, 'Stand-01'),
(42, 32, 22, 'Stand-02'),
(43, 33, 23, 'Stand-03'),
(44, 34, 24, 'Stand-04'),
(45, 35, 25, 'Stand-05'),
(46, 36, 26, 'Stand-06'),
(47, 37, 27, 'Stand-07'),
(48, 38, 28, 'Stand-08'),
(49, 39, 29, 'Stand-09'),
(50, 40, 30, 'Stand-10');

INSERT INTO Persona (id_persona, nombre, edad, telefono) VALUES
(51, 'Carlos López', 30, '3001111111'),
(52, 'María Pérez', 28, '3002222222'),
(53, 'Juan Torres', 35, '3003333333'),
(54, 'Ana Gómez', 40, '3004444444'),
(55, 'Pedro Sánchez', 26, '3005555555'),
(56, 'Laura Ramírez', 33, '3006666666'),
(57, 'Andrés Castro', 29, '3007777777'),
(58, 'Sofía Duarte', 32, '3008888888'),
(59, 'Felipe Ruiz', 37, '3009999999'),
(60, 'Valentina Morales', 27, '3010000000');

INSERT INTO Responsable (id_responsable, id_persona) VALUES
(61, 51),
(62, 52),
(63, 53),
(64, 54),
(65, 55),
(66, 56),
(67, 57),
(68, 58),
(69, 59),
(70, 60);

INSERT INTO Ponente (id_ponente, id_persona) VALUES
(71, 51),
(72, 52),
(73, 53),
(74, 54),
(75, 55),
(76, 56),
(77, 57),
(78, 58),
(79, 59),
(80, 60);

INSERT INTO TipoEntrada (id_tipo_entrada, tipo_entrada) VALUES
(81, 'General'),
(82, 'Estudiante'),
(83, 'VIP'),
(84, 'VIP'), 
(85, 'Estudiante'),
(86, 'General'),
(87, 'Estudiante'),
(88, 'General'),
(89, 'VIP'),
(90, 'VIP');

INSERT INTO Visitante (id_visitante, id_tipo_visitante, nombre) VALUES
(91, 81, 'Juan López'),
(92, 82, 'Sofía Ramírez'),
(93, 83, 'Pedro Castillo'),
(94, 84, 'Laura Fernández'),
(95, 85, 'Camilo Duarte'),
(96, 86, 'Valentina Ruiz'),
(97, 87, 'Mateo Hernández'),
(98, 88, 'Paula Moreno'),
(99, 89, 'Diego Rojas'),
(100, 90, 'Daniela Castro');

INSERT INTO Producto (id_producto, id_stand, id_responsable, nombre) VALUES
(101, 41, 61, 'Laptop Gamer X1'),
(102, 42, 62, 'Software de Gestión ERP'),
(103, 43, 63, 'Robot Asistente'),
(104, 44, 64, 'Impresora 3D Pro'),
(105, 45, 65, 'Servidor Cloud'),
(106, 46, 66, 'Sensor IoT SmartHome'),
(107, 47, 67, 'Drone de Vigilancia'),
(108, 48, 68, 'Smartwatch Pro'),
(109, 49, 69, 'Aplicación Móvil de Salud'),
(110, 50, 70, 'Realidad Virtual Headset');

INSERT INTO Charla (id_charla, nombre) VALUES
(111, 'Avances en Hardware'),
(112, 'El Futuro del IoT'),
(113, 'Experiencias en Realidad Virtual'),
(114, 'Protección de Datos'),
(115, 'Uso del Big Data en Empresas'),
(116, 'Inteligencia Artificial en Medicina'),
(117, 'Aplicaciones de Blockchain'),
(118, 'Introducción a la Computación Cuántica'),
(119, 'Impacto de las Redes 5G'),
(120, 'Tendencias en Software 2025');

INSERT INTO Demostraciones (id_demostracion, nombre) VALUES
(121, 'Exhibición de Robótica'),
(122, 'Prototipo IoT en Agricultura'),
(123, 'Hackeo Ético en Vivo'),
(124, 'Análisis de Datos en Tiempo Real'),
(125, 'Diagnóstico Médico con IA'),
(126, 'Transacciones con Blockchain'),
(127, 'Simulación Cuántica'),
(128, 'Automatización de Redes 5G'),
(129, 'Realidad Aumentada Educativa'),
(130, 'Demostración de Realidad Virtual');

INSERT INTO Registro (id_registro, id_feria, id_charla, id_visitante, id_empresa, id_demostracion, online) VALUES
(131, 1, 111, 91, 31, 121, 1),-- 1 = online
(132, 1, 112, 92, 32, 122, 0),-- 0 = presencial
(133, 1, 113, 93, 33, 123, 1),
(134, 1, 114, 94, 34, 124, 0),
(135, 1, 115, 95, 35, 125, 1),
(136, 1, 116, 96, 36, 126, 0),
(137, 1, 117, 97, 37, 127, 1),
(138, 1, 118, 98, 38, 128, 0),
(139, 1, 119, 99, 39, 129, 1),
(140, 1, 120, 100, 40, 130, 0);

SELECT v.nombre AS visitante, c.nombre AS charla, t.tipo_entrada
FROM Visitante v
JOIN TipoEntrada t ON v.id_tipo_visitante = t.id_tipo_entrada
JOIN Registro r ON v.id_visitante = r.id_visitante
JOIN Charla c ON r.id_charla = c.id_charla;

SELECT P.nombre AS Pabellon, T.nombre AS Tematica
FROM Pabellon P
JOIN Tematica T ON P.id_tematica = T.id_tematica;

SELECT Pr.nombre AS Producto, Pe.nombre AS Responsable
FROM Producto Pr
JOIN Responsable R ON Pr.id_responsable = R.id_responsable
JOIN Persona Pe ON R.id_persona = Pe.id_persona;

SELECT S.nombre AS Stand, P.nombre AS Pabellon, P.capacidad, E.nombre AS Empresa, E.ciudad AS Ciudad
FROM Stand S
JOIN Empresa E ON S.id_empresa = E.id_empresa
JOIN Pabellon P ON S.id_pabellon = P.id_pabellon;

SELECT nombre 
FROM Visitante
WHERE id_visitante IN(
    SELECT id_visitante
    FROM Registro
    WHERE id_charla IN(
SELECT id_charla 
FROM Charla
WHERE nombre = 'Avances en Hardware'
)
);

SELECT nombre 
FROM Empresa
WHERE id_empresa IN(
    SELECT id_empresa 
    FROM Stand
    WHERE id_pabellon IN(
SELECT id_pabellon
FROM Pabellon
WHERE nombre = 'Pabellón C'
)
);

SELECT nombre
FROM Visitante
WHERE id_visitante IN(
    SELECT id_visitante
    FROM Registro
    WHERE online = 0
);

CREATE PROCEDURE ObtenerEmpresasPorCiudad
    @Ciudad VARCHAR(100) 
AS
BEGIN
    SELECT id_empresa, nombre, ciudad
    FROM Empresa
    WHERE ciudad = @Ciudad;
END;
GO

EXEC ObtenerEmpresasPorCiudad @Ciudad = 'Medellin';

CREATE PROCEDURE PersonaPorRangoEdad
    @edad_min INT,
    @edad_max INT
AS
BEGIN 
    SELECT id_persona, nombre, edad, telefono
    FROM Persona
    WHERE edad BETWEEN @edad_min AND @edad_max;
END;
GO

EXEC PersonaPorRangoEdad @edad_min = 20, @edad_max = 35;

CREATE PROCEDURE TipoDeEntrada
    @tipo_entrada VARCHAR(100)
AS 
BEGIN
    SELECT id_tipo_entrada, tipo_entrada
    FROM TipoEntrada
    WHERE tipo_entrada = @tipo_entrada;
END;
GO

EXEC TipoDeEntrada @tipo_entrada = 'Estudiante';

CREATE TRIGGER insertEmpresa
ON Empresa
AFTER insert
AS
BEGIN
    PRINT 'Se inserto una nueva empresa'
END;
GO

INSERT INTO Empresa (id_empresa, nombre, ciudad)
VALUES (41, 'HALTEC', 'Neiva');

SELECT * FROM Empresa;

CREATE TRIGGER CambioCapacidadPabellon
ON Pabellon
AFTER UPDATE
AS 
BEGIN
    PRINT 'Se cambio la capacidad de un pabellon'
END;
GO

UPDATE Pabellon SET capacidad = 15  WHERE id_pabellon = 22;
SELECT * FROM Pabellon;


CREATE TRIGGER EliminarUnProducto
ON Producto
AFTER DELETE
AS 
BEGIN
    PRINT 'Se elimino un producto'
END;
GO

DELETE FROM Producto WHERE id_producto = 101;
SELECT * FROM Producto;
INSERT INTO Producto (id_producto, id_stand, id_responsable, nombre) VALUES
(101, 41, 61, 'Laptop Gamer X1');

CREATE TABLE Log (
    id_log INT IDENTITY PRIMARY KEY,
    tabla_afectada SYSNAME,
    fecha DATETIME DEFAULT GETDATE(),
    datos_afectados VARCHAR(200)
);


DECLARE @table NVARCHAR(200), @sql NVARCHAR(MAX);

DECLARE cur CURSOR FOR
SELECT name 
FROM sys.tables
WHERE name <> 'Log'; -- Evitamos la tabla Log

OPEN cur;
FETCH NEXT FROM cur INTO @table; --1 tabla encontrada y la guarda en @table

WHILE @@FETCH_STATUS = 0 --es exitoso si hay tabla
BEGIN
    SET @sql = '
    CREATE TRIGGER trg_' + @table + '_Log 
    ON ' + @table + ' --se aplica a todas las tablas
    AFTER INSERT, UPDATE, DELETE
    AS
    BEGIN -- inserted contiene las filas nuevas y deleted contiene las filas eliminadas.
        -- INSERT hay filas en inserted, pero no en deleted
        IF EXISTS (SELECT 1 FROM inserted) AND NOT EXISTS (SELECT 1 FROM deleted)
        BEGIN
            INSERT INTO Log (tabla_afectada, datos_afectados)
            VALUES (''' + @table + ''', ''Se insertó un registro'');
        END;

        -- UPDATE hay filas en ambos (primero se borran los viejos y se insertan los nuevos).
        IF EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted)
        BEGIN
            INSERT INTO Log (tabla_afectada, datos_afectados)
            VALUES (''' + @table + ''', ''Se actualizó un registro'');
        END;

        -- DELETE hay filas en deleted, pero no en inserted.
        IF NOT EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted)
        BEGIN
            INSERT INTO Log (tabla_afectada, datos_afectados)
            VALUES (''' + @table + ''', ''Se eliminó un registro'');
        END;
    END;
    ';

    EXEC sp_executesql @sql; --se ejecuta el sql dinamico

    FETCH NEXT FROM cur INTO @table;
END;

CLOSE cur;
DEALLOCATE cur; --se libera de memoria
GO

UPDATE Visitante SET nombre = 'Johan Salazar' WHERE id_visitante = 91;
SELECT * FROM Log;