CREATE DATABASE Reparacion_Celular;
USE Reparacion_Celular;

CREATE OR ALTER PROCEDURE crear_tablas_servicio
AS
BEGIN
    IF OBJECT_ID('Cliente', 'U') IS NULL
    BEGIN
        CREATE TABLE Cliente (
            id_cliente INT PRIMARY KEY,
            nombre VARCHAR(100),
            telefono VARCHAR(20)
        );
    END;

    IF OBJECT_ID('Dispositivo', 'U') IS NULL
    BEGIN
        CREATE TABLE Dispositivo (
            id_dispositivo INT PRIMARY KEY,
            tipo VARCHAR(50),
            marca VARCHAR(50),
            id_cliente INT,
            FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
        );
    END;

    IF OBJECT_ID('Tecnico', 'U') IS NULL
    BEGIN
        CREATE TABLE Tecnico (
            id_tecnico INT PRIMARY KEY,
            nombre VARCHAR(100),
            especialidad VARCHAR(50)
        );
    END;

    IF OBJECT_ID('Servicio', 'U') IS NULL
    BEGIN
        CREATE TABLE Servicio (
            id_servicio INT PRIMARY KEY,
            descripcion VARCHAR(100),
            costo DECIMAL(10, 2)
        );
    END;

    IF OBJECT_ID('Repuesto', 'U') IS NULL
    BEGIN
        CREATE TABLE Repuesto (
            id_repuesto INT PRIMARY KEY,
            nombre VARCHAR(50),
            precio DECIMAL(10,2)
        );
    END;

    IF OBJECT_ID('Dispositivo_Servicio', 'U') IS NULL
    BEGIN
        CREATE TABLE Dispositivo_Servicio (
            id_dispositivo INT,
            id_servicio INT,
            id_tecnico INT,
            fecha DATE,
            estado VARCHAR(20),
            PRIMARY KEY (id_dispositivo, id_servicio),
            FOREIGN KEY (id_dispositivo) REFERENCES Dispositivo(id_dispositivo),
            FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio),
            FOREIGN KEY (id_tecnico) REFERENCES Tecnico(id_tecnico)
        );
    END;

    IF OBJECT_ID('Servicio_Repuesto', 'U') IS NULL
    BEGIN
        CREATE TABLE Servicio_Repuesto (
            id_servicio INT,
            id_repuesto INT,
            cantidad INT,
            PRIMARY KEY (id_servicio, id_repuesto),
            FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio),
            FOREIGN KEY (id_repuesto) REFERENCES Repuesto(id_repuesto)
        );
    END;
END;

EXEC crear_tablas_servicio;

CREATE OR ALTER PROCEDURE insertar_datos_servicio
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Cliente)
    BEGIN
        INSERT INTO Cliente (id_cliente, nombre, telefono) VALUES
        (1,'Juan Pérez','3001111111'),
        (2,'María Gómez','3002222222'),
        (3,'Pedro López','3003333333'),
        (4,'Laura Torres','3004444444'),
        (5,'Andrés Díaz','3005555555'),
        (6,'Sofía Ruiz','3006666666'),
        (7,'Carlos Mejía','3007777777'),
        (8,'Ana Fernández','3008888888'),
        (9,'Felipe Castro','3009999999'),
        (10,'Mónica Rojas','3010000000');
    END;

    IF NOT EXISTS (SELECT 1 FROM Dispositivo)
    BEGIN
        INSERT INTO Dispositivo (id_dispositivo, tipo, marca, id_cliente) VALUES
        (101,'Celular','Samsung',1),
        (102,'Portátil','HP',2),
        (103,'Tablet','Apple',3),
        (104,'Impresora','Epson',4),
        (105,'Celular','Xiaomi',5),
        (106,'Portátil','Lenovo',6),
        (107,'Televisor','LG',7),
        (108,'Celular','Motorola',8),
        (109,'Portátil','Dell',9),
        (110,'Tablet','Huawei',10);
    END;

    IF NOT EXISTS (SELECT 1 FROM Tecnico)
    BEGIN
        INSERT INTO Tecnico (id_tecnico, nombre, especialidad) VALUES
        (201,'Luis Ramírez','Celulares'),
        (202,'Paola Herrera','Portátiles'),
        (203,'Miguel Ortiz','Tablets'),
        (204,'Diana Vargas','Impresoras'),
        (205,'Jorge Castillo','Redes'),
        (206,'Natalia Sánchez','Celulares'),
        (207,'Ricardo Moreno','Portátiles'),
        (208,'Camila León','Tablets'),
        (209,'David Pardo','Televisores'),
        (210,'Esteban Silva','General');
    END;

    IF NOT EXISTS (SELECT 1 FROM Servicio)
    BEGIN
        INSERT INTO Servicio (id_servicio, descripcion, costo) VALUES
        (301,'Reparación de pantalla',150.00),
        (302,'Cambio de batería',120.00),
        (303,'Instalación de software',80.00),
        (304,'Mantenimiento preventivo',100.00),
        (305,'Reparación de teclado',130.00),
        (306,'Optimización del sistema',90.00),
        (307,'Cambio de cargador',70.00),
        (308,'Limpieza interna',60.00),
        (309,'Formateo de sistema',110.00),
        (310,'Revisión general',140.00);
    END;

    IF NOT EXISTS (SELECT 1 FROM Repuesto)
    BEGIN
        INSERT INTO Repuesto (id_repuesto, nombre, precio) VALUES
        (401,'Pantalla Samsung',200.00),
        (402,'Batería HP',150.00),
        (403,'Teclado Lenovo',90.00),
        (404,'Fuente de poder Dell',180.00),
        (405,'Cargador Motorola',70.00),
        (406,'Pantalla Huawei',210.00),
        (407,'Memoria RAM 8GB',120.00),
        (408,'Disco SSD 512GB',250.00),
        (409,'Placa madre Acer',300.00),
        (410,'Batería Apple',220.00);
    END;

    IF NOT EXISTS (SELECT 1 FROM Dispositivo_Servicio)
    BEGIN
        INSERT INTO Dispositivo_Servicio (id_dispositivo, id_servicio, id_tecnico, fecha, estado) VALUES
        (101,301,201,'2025-01-10','Finalizado'),
        (102,302,202,'2025-01-11','En proceso'),
        (103,303,203,'2025-01-12','Pendiente'),
        (104,304,204,'2025-01-13','Finalizado'),
        (105,305,205,'2025-01-14','En proceso'),
        (106,306,206,'2025-01-15','Finalizado'),
        (107,307,207,'2025-01-16','Pendiente'),
        (108,308,208,'2025-01-17','Finalizado'),
        (109,309,209,'2025-01-18','En proceso'),
        (110,310,210,'2025-01-19','Pendiente');
    END;

    IF NOT EXISTS (SELECT 1 FROM Servicio_Repuesto)
    BEGIN
        INSERT INTO Servicio_Repuesto (id_servicio, id_repuesto, cantidad) VALUES
        (301,401,1),
        (302,402,2),
        (303,403,1),
        (304,404,1),
        (305,405,1),
        (306,406,1),
        (307,407,1),
        (308,408,1),
        (309,409,1),
        (310,410,2);
    END;
END;

EXEC insertar_datos_servicio;

CREATE VIEW clientes_dispositivos AS
SELECT c.nombre AS cliente, d.tipo, d.marca
FROM Cliente c
JOIN Dispositivo d ON c.id_cliente = d.id_cliente;

CREATE VIEW servicios_tecnicos AS
SELECT s.descripcion, s.costo, t.nombre AS tecnico
FROM Servicio s
JOIN Dispositivo_Servicio ds ON s.id_servicio = ds.id_servicio
JOIN Tecnico t ON ds.id_tecnico = t.id_tecnico;

CREATE VIEW dispositivo_servicios AS
SELECT d.marca, d.tipo, s.descripcion, ds.fecha, ds.estado
FROM Dispositivo d
JOIN Dispositivo_Servicio ds ON d.id_dispositivo = ds.id_dispositivo
JOIN Servicio s ON ds.id_servicio = s.id_servicio;

CREATE VIEW servicios_repuestos AS
SELECT s.descripcion, r.nombre AS repuesto, sr.cantidad
FROM Servicio s
JOIN Servicio_Repuesto sr ON s.id_servicio = sr.id_servicio
JOIN Repuesto r ON sr.id_repuesto = r.id_repuesto;

CREATE VIEW repuesto_tabla AS
SELECT id_repuesto, nombre, precio
FROM Repuesto;

CREATE OR ALTER PROCEDURE ver_vistas_servicio
AS
BEGIN
    SELECT * FROM clientes_dispositivos;
    SELECT * FROM servicios_tecnicos;
    SELECT * FROM dispositivo_servicios;
    SELECT * FROM servicios_repuestos;
    SELECT * FROM repuesto_tabla;
END;

EXEC ver_vistas_servicio;