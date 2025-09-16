CREATE DATABASE Transporte;
USE Transporte;

CREATE OR ALTER PROCEDURE crear_tablas_transporte
AS
BEGIN
    IF OBJECT_ID('Pasajero', 'U') IS NULL
    BEGIN
    CREATE TABLE Pasajero (
        id_pasajero INT PRIMARY KEY,
        nombre VARCHAR(100),
        tarjeta_id VARCHAR(50)
    );
    END;

    IF OBJECT_ID('Ruta', 'U') IS NULL
    BEGIN
    CREATE TABLE Ruta (
        id_ruta INT PRIMARY KEY,
        nombre VARCHAR(100),
        duracion_estimada INT
    );
    END;

    IF OBJECT_ID('Bus', 'U') IS NULL
    BEGIN
    CREATE TABLE Bus (
        id_bus INT PRIMARY KEY,
        placa VARCHAR(20),
        capacidad INT
    );
    END;

    IF OBJECT_ID('Conductor', 'U') IS NULL
    BEGIN
    CREATE TABLE Conductor (
        id_conductor INT PRIMARY KEY,
        nombre VARCHAR(100),
        licencia VARCHAR(50)
    );
    END;

    IF OBJECT_ID('Estacion', 'U') IS NULL
    BEGIN
    CREATE TABLE Estacion (
        id_estacion INT PRIMARY KEY,
        nombre VARCHAR(100),
        direccion VARCHAR(150)
    );
    END;

    IF OBJECT_ID('Bus_Ruta', 'U') IS NULL
    BEGIN
    CREATE TABLE Bus_Ruta (
        id_bus INT,
        id_ruta INT,
        hora_salida TIME,
        PRIMARY KEY (id_bus, id_ruta),
        FOREIGN KEY (id_bus) REFERENCES Bus(id_bus),
        FOREIGN KEY (id_ruta) REFERENCES Ruta(id_ruta)
    );
    END;

    IF OBJECT_ID('Ruta_Estacion', 'U') IS NULL
    BEGIN
    CREATE TABLE Ruta_Estacion (
        id_ruta INT,
        id_estacion INT,
        orden INT,
        PRIMARY KEY (id_ruta, id_estacion),
        FOREIGN KEY (id_ruta) REFERENCES Ruta(id_ruta),
        FOREIGN KEY (id_estacion) REFERENCES Estacion(id_estacion)
    );
    END;
END;

EXEC crear_tablas_transporte;

CREATE OR ALTER PROCEDURE insertar_datos_transporte
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Pasajero)
    BEGIN
        INSERT INTO Pasajero VALUES
        (1,'Carlos Pérez','TARJ001'),
        (2,'María Gómez','TARJ002'),
        (3,'Luis Rodríguez','TARJ003'),
        (4,'Ana Martínez','TARJ004'),
        (5,'Jorge Sánchez','TARJ005'),
        (6,'Laura Fernández','TARJ006'),
        (7,'Pedro Ramírez','TARJ007'),
        (8,'Lucía Torres','TARJ008'),
        (9,'Diego Castro','TARJ009'),
        (10,'Sofía Morales','TARJ010');
    END;

    IF NOT EXISTS (SELECT 1 FROM Ruta)
    BEGIN
        INSERT INTO Ruta VALUES
        (101,'Ruta Norte',45),
        (102,'Ruta Sur',50),
        (103,'Ruta Este',60),
        (104,'Ruta Oeste',55),
        (105,'Ruta Centro',40),
        (106,'Ruta Express',30),
        (107,'Ruta Circular',70),
        (108,'Ruta Intermunicipal',120),
        (109,'Ruta Escolar',35),
        (110,'Ruta Nocturna',80);
    END;

    IF NOT EXISTS (SELECT 1 FROM Bus)
    BEGIN
        INSERT INTO Bus VALUES
        (201,'ABC101',40),
        (202,'ABC102',42),
        (203,'ABC103',38),
        (204,'ABC104',50),
        (205,'ABC105',48),
        (206,'ABC106',36),
        (207,'ABC107',44),
        (208,'ABC108',52),
        (209,'ABC109',47),
        (210,'ABC110',45);
    END;

    IF NOT EXISTS (SELECT 1 FROM Conductor)
    BEGIN
        INSERT INTO Conductor VALUES
        (301,'Juan López','LIC001'),
        (302,'Marta Díaz','LIC002'),
        (303,'Andrés Silva','LIC003'),
        (304,'Elena Ruiz','LIC004'),
        (305,'Ricardo Gómez','LIC005'),
        (306,'Paula Méndez','LIC006'),
        (307,'Fernando Ríos','LIC007'),
        (308,'Carmen Vega','LIC008'),
        (309,'Esteban Ortega','LIC009'),
        (310,'Gabriela Cruz','LIC010');
    END;

    IF NOT EXISTS (SELECT 1 FROM Estacion)
    BEGIN
        INSERT INTO Estacion VALUES
        (401,'Estación Central','Calle 10 #20-30'),
        (402,'Estación Norte','Carrera 15 #45-50'),
        (403,'Estación Sur','Avenida 30 #12-15'),
        (404,'Estación Este','Calle 25 #8-22'),
        (405,'Estación Oeste','Carrera 40 #18-10'),
        (406,'Estación Parque','Avenida 5 #60-40'),
        (407,'Estación Universidad','Carrera 7 #70-25'),
        (408,'Estación Terminal','Calle 50 #100-12'),
        (409,'Estación Hospital','Carrera 22 #30-45'),
        (410,'Estación Industrial','Avenida 80 #120-33');
    END;

    IF NOT EXISTS (SELECT 1 FROM Bus_Ruta)
    BEGIN
        INSERT INTO Bus_Ruta VALUES
        (201,101,'06:00:00'),
        (202,102,'07:00:00'),
        (203,103,'08:00:00'),
        (204,104,'09:00:00'),
        (205,105,'10:00:00'),
        (206,106,'11:00:00'),
        (207,107,'12:00:00'),
        (208,108,'13:00:00'),
        (209,109,'14:00:00'),
        (210,110,'15:00:00');
    END;

    IF NOT EXISTS (SELECT 1 FROM Ruta_Estacion)
    BEGIN
        INSERT INTO Ruta_Estacion VALUES
        (101,401,1),
        (102,402,1),
        (103,403,1),
        (104,404,1),
        (105,405,1),
        (106,406,1),
        (107,407,1),
        (108,408,1),
        (109,409,1),
        (110,410,1);
    END;
END;

EXEC insertar_datos_transporte;

CREATE VIEW Pasajeros AS
SELECT id_pasajero, nombre, tarjeta_id
FROM Pasajero;

CREATE VIEW Buses_Rutas AS
SELECT b.id_bus, b.placa, r.nombre AS ruta, br.hora_salida
FROM Bus b
INNER JOIN Bus_Ruta br ON b.id_bus = br.id_bus
INNER JOIN Ruta r ON br.id_ruta = r.id_ruta;

CREATE VIEW Rutas_Estaciones AS
SELECT r.id_ruta, r.nombre AS ruta, e.nombre AS estacion, re.orden
FROM Ruta r
INNER JOIN Ruta_Estacion re ON r.id_ruta = re.id_ruta
INNER JOIN Estacion e ON re.id_estacion = e.id_estacion;

CREATE VIEW Conductores AS
SELECT id_conductor, nombre, licencia
FROM Conductor;

CREATE VIEW Buses_Capacidad AS
SELECT id_bus, placa, capacidad
FROM Bus
WHERE capacidad > 40;

CREATE OR ALTER PROCEDURE ver_vistas_transporte
AS
BEGIN
    SELECT * FROM Pasajeros;
    SELECT * FROM Buses_Rutas;
    SELECT * FROM Rutas_Estaciones;
    SELECT * FROM Conductores;
    SELECT * FROM Buses_Capacidad;
END;

EXEC ver_vistas_transporte;