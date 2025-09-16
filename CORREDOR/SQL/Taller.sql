CREATE DATABASE Taller;
USE Taller;

CREATE OR ALTER PROCEDURE crear_tablas_taller
AS
BEGIN
   
    IF OBJECT_ID('dbo.Cliente', 'U') IS NULL --U es tabla de usuario
    BEGIN
        CREATE TABLE Cliente (
            id_cliente INT PRIMARY KEY,
            nombre VARCHAR(100),
            telefono VARCHAR(20)
        );
    END;

    IF OBJECT_ID('dbo.Vehiculo', 'U') IS NULL
    BEGIN
        CREATE TABLE Vehiculo (
            id_vehiculo INT PRIMARY KEY,
            id_cliente INT,
            placa VARCHAR(10),
            marca VARCHAR(50),
            FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
        );
    END;

    IF OBJECT_ID('dbo.Taller', 'U') IS NULL
    BEGIN
        CREATE TABLE Taller (
            id_taller INT PRIMARY KEY,
            nombre_taller VARCHAR(100),
            direccion VARCHAR(200)
        );
    END;

    IF OBJECT_ID('dbo.Vehiculo_Taller', 'U') IS NULL
    BEGIN
        CREATE TABLE Vehiculo_Taller (
            id_vehiculo INT,
            id_taller INT,
            fecha_ingreso DATE,
            fecha_salida DATE,
            PRIMARY KEY (id_vehiculo, id_taller),
            FOREIGN KEY (id_vehiculo) REFERENCES Vehiculo(id_vehiculo),
            FOREIGN KEY (id_taller) REFERENCES Taller(id_taller)
        );
    END;

    IF OBJECT_ID('dbo.Servicio', 'U') IS NULL
    BEGIN
        CREATE TABLE Servicio (
            id_servicio INT PRIMARY KEY,
            descripcion VARCHAR(200),
            costo DECIMAL(10,2)
        );
    END;

    IF OBJECT_ID('dbo.Repuesto', 'U') IS NULL
    BEGIN
        CREATE TABLE Repuesto (
            id_repuesto INT PRIMARY KEY,
            nombre VARCHAR(100),
            precio DECIMAL(10,2)
        );
    END;

    IF OBJECT_ID('dbo.Servicio_Repuesto', 'U') IS NULL
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

EXEC crear_tablas_taller;

CREATE OR ALTER PROCEDURE insertar_datos
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Cliente)
    BEGIN
    INSERT INTO Cliente (id_cliente, nombre, telefono) VALUES
        (1, 'Juan Perez', '3001111111'),
        (2, 'Maria Gomez', '3002222222'),
        (3, 'Carlos Ruiz', '3003333333'),
        (4, 'Ana Torres', '3004444444'),
        (5, 'Luis Fernandez', '3005555555'),
        (6, 'Sofia Ramirez', '3006666666'),
        (7, 'Pedro Martinez', '3007777777'),
        (8, 'Laura Sanchez', '3008888888'),
        (9, 'Jorge Diaz', '3009999999'),
        (10, 'Camila Vargas', '3010000000');
    END;

    IF NOT EXISTS (SELECT 1 FROM Vehiculo)
    BEGIN
        INSERT INTO Vehiculo (id_vehiculo, id_cliente, placa, marca) VALUES
        (1, 1, 'AAA111', 'Toyota'),
        (2, 2, 'BBB222', 'Mazda'),
        (3, 3, 'CCC333', 'Chevrolet'),
        (4, 4, 'DDD444', 'Renault'),
        (5, 5, 'EEE555', 'Ford'),
        (6, 6, 'FFF666', 'Kia'),
        (7, 7, 'GGG777', 'Hyundai'),
        (8, 8, 'HHH888', 'Nissan'),
        (9, 9, 'III999', 'BMW'),
        (10, 10, 'JJJ000', 'Mercedes');
    END;

    IF NOT EXISTS (SELECT 1 FROM Taller)
    BEGIN
        INSERT INTO Taller (id_taller, nombre_taller, direccion) VALUES
        (1, 'Taller Central', 'Calle 1 #10-20'),
        (2, 'Mecanica Rápida', 'Carrera 15 #45-50'),
        (3, 'Autoservice', 'Av 30 #12-34'),
        (4, 'Full Mecánica', 'Calle 50 #20-10'),
        (5, 'Taller Turbo', 'Carrera 25 #33-22'),
        (6, 'Auto Pro', 'Av 68 #40-15'),
        (7, 'Mecánicos Ya', 'Calle 80 #70-12'),
        (8, 'Servicio Express', 'Carrera 10 #15-40'),
        (9, 'Super Taller', 'Calle 100 #30-20'),
        (10, 'Pit Stop', 'Carrera 7 #45-60');
    END;

    IF NOT EXISTS (SELECT 1 FROM Vehiculo_Taller)
    BEGIN
        INSERT INTO Vehiculo_Taller (id_vehiculo, id_taller, fecha_ingreso, fecha_salida) VALUES
        (1, 1, '2025-01-10', '2025-01-15'),
        (2, 2, '2025-01-11', '2025-01-16'),
        (3, 3, '2025-01-12', '2025-01-17'),
        (4, 4, '2025-01-13', '2025-01-18'),
        (5, 5, '2025-01-14', '2025-01-19'),
        (6, 6, '2025-01-15', '2025-01-20'),
        (7, 7, '2025-01-16', '2025-01-21'),
        (8, 8, '2025-01-17', '2025-01-22'),
        (9, 9, '2025-01-18', '2025-01-23'),
        (10, 10, '2025-01-19', '2025-01-24');
    END;

    IF NOT EXISTS (SELECT 1 FROM Servicio)
    BEGIN
        INSERT INTO Servicio (id_servicio, descripcion, costo) VALUES
        (1, 'Cambio de aceite', 120000),
        (2, 'Alineación y balanceo', 80000),
        (3, 'Cambio de frenos', 150000),
        (4, 'Mantenimiento general', 200000),
        (5, 'Cambio de llantas', 400000),
        (6, 'Sincronización', 180000),
        (7, 'Cambio de batería', 250000),
        (8, 'Revisión eléctrica', 90000),
        (9, 'Pintura general', 600000),
        (10, 'Lavado especial', 50000);
    END;

    IF NOT EXISTS (SELECT 1 FROM Repuesto)
    BEGIN
        INSERT INTO Repuesto (id_repuesto, nombre, precio) VALUES
        (1, 'Filtro de aceite', 30000),
        (2, 'Pastillas de freno', 70000),
        (3, 'Llanta rin 15', 200000),
        (4, 'Batería 12V', 350000),
        (5, 'Bujías', 50000),
        (6, 'Amortiguadores', 180000),
        (7, 'Aceite 5W30', 90000),
        (8, 'Disco de freno', 120000),
        (9, 'Correa de distribución', 250000),
        (10, 'Radiador', 400000);
    END;

    IF NOT EXISTS (SELECT 1 FROM Servicio_Repuesto)
    BEGIN
        INSERT INTO Servicio_Repuesto (id_servicio, id_repuesto, cantidad) VALUES
        (1, 1, 1),
        (2, 2, 2),
        (3, 3, 4),
        (4, 5, 4),
        (5, 3, 4),
        (6, 5, 4),
        (7, 4, 1),
        (8, 7, 2),
        (9, 10, 1),
        (10, 6, 2);
    END;
END;

EXEC insertar_datos;

    CREATE VIEW clientes_vehiculos AS
    SELECT c.id_cliente, c.nombre, c.telefono, v.id_vehiculo, v.placa, v.marca
    FROM Cliente c
    INNER JOIN Vehiculo v ON c.id_cliente = v.id_cliente;

    CREATE VIEW vehiculos_talleres AS
    SELECT v.id_vehiculo, v.placa, v.marca, t.id_taller, t.nombre_taller, vt.fecha_ingreso, vt.fecha_salida
    FROM Vehiculo v
    INNER JOIN Vehiculo_Taller vt ON v.id_vehiculo = vt.id_vehiculo
    INNER JOIN Taller t ON vt.id_taller = t.id_taller;

    CREATE VIEW talleres AS
    SELECT id_taller, nombre_taller, direccion 
    FROM Taller;

    CREATE VIEW servicios_repuestos AS
    SELECT s.id_servicio, s.descripcion, s.costo, r.id_repuesto, r.nombre AS repuesto, r.precio, sr.cantidad
    FROM Servicio s
    INNER JOIN Servicio_Repuesto sr ON s.id_servicio = sr.id_servicio
    INNER JOIN Repuesto r ON sr.id_repuesto = r.id_repuesto;

    CREATE VIEW repuestos AS
    SELECT id_repuesto, nombre, precio 
    FROM Repuesto;

CREATE PROCEDURE mirar_todas_vistas
AS 
BEGIN 

    SELECT * FROM clientes_vehiculos;
    SELECT * FROM vehiculos_talleres;
    SELECT * FROM talleres;
    SELECT * FROM servicios_repuestos;
    SELECT * FROM repuestos;

END;

EXEC mirar_todas_vistas