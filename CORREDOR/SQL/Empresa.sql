CREATE DATABASE Empresa;
USE Empresa;

CREATE OR ALTER PROCEDURE crear_tablas_empresa
AS
BEGIN
    IF OBJECT_ID('dbo.Cliente','U') IS NULL
    BEGIN
        CREATE TABLE Cliente(
            id_cliente INT PRIMARY KEY,
            nombre VARCHAR(100),
            correo VARCHAR(100)
        );
    END;

    IF OBJECT_ID('dbo.Producto','U') IS NULL
    BEGIN
        CREATE TABLE Producto(
            id_producto INT PRIMARY KEY,
            nombre VARCHAR(100),
            precio DECIMAL(10,2)
        );
    END;

    IF OBJECT_ID('dbo.Empleado','U') IS NULL
    BEGIN
        CREATE TABLE Empleado(
            id_empleado INT PRIMARY KEY,
            nombre VARCHAR(100),
            cargo VARCHAR(50)
        );
    END;

    IF OBJECT_ID('dbo.Factura','U') IS NULL
    BEGIN
        CREATE TABLE Factura(
            id_factura INT PRIMARY KEY,
            id_cliente INT,
            id_empleado INT,
            fecha DATE,
            FOREIGN KEY(id_cliente) REFERENCES Cliente(id_cliente),
            FOREIGN KEY(id_empleado) REFERENCES Empleado(id_empleado)
        );
    END;

    IF OBJECT_ID('dbo.Proveedor','U') IS NULL
    BEGIN
        CREATE TABLE Proveedor(
            id_proveedor INT PRIMARY KEY,
            nombre VARCHAR(100),
            contacto VARCHAR(100)
        );
    END;

    IF OBJECT_ID('dbo.Factura_Producto','U') IS NULL
    BEGIN
        CREATE TABLE Factura_Producto(
            id_factura INT,
            id_producto INT,
            cantidad INT,
            PRIMARY KEY(id_factura, id_producto),
            FOREIGN KEY(id_factura) REFERENCES Factura(id_factura),
            FOREIGN KEY(id_producto) REFERENCES Producto(id_producto)
        );
    END;

    IF OBJECT_ID('dbo.Producto_Proveedor','U') IS NULL
    BEGIN
        CREATE TABLE Producto_Proveedor(
            id_producto INT,
            id_proveedor INT,
            PRIMARY KEY(id_producto, id_proveedor),
            FOREIGN KEY(id_producto) REFERENCES Producto(id_producto),
            FOREIGN KEY(id_proveedor) REFERENCES Proveedor(id_proveedor)
        );
    END;
END;

EXEC crear_tablas_empresa;

CREATE OR ALTER PROCEDURE insertar_datos_facturacion
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Cliente)
    BEGIN
        INSERT INTO Cliente (id_cliente, nombre, correo) VALUES
        (1, 'Carlos Gómez', 'carlos@mail.com'),
        (2, 'María López', 'maria@mail.com'),
        (3, 'Juan Torres', 'juan@mail.com'),
        (4, 'Laura Díaz', 'laura@mail.com'),
        (5, 'Pedro Ruiz', 'pedro@mail.com'),
        (6, 'Ana Martínez', 'ana@mail.com'),
        (7, 'Sofía Castro', 'sofia@mail.com'),
        (8, 'Luis Ramírez', 'luis@mail.com'),
        (9, 'Camila Herrera', 'camila@mail.com'),
        (10, 'Felipe Vargas', 'felipe@mail.com');
    END;

    IF NOT EXISTS (SELECT 1 FROM Producto)
    BEGIN
        INSERT INTO Producto (id_producto, nombre, precio) VALUES
        (101, 'Laptop', 3500.00),
        (102, 'Mouse', 25.00),
        (103, 'Teclado', 45.00),
        (104, 'Monitor', 500.00),
        (105, 'Impresora', 800.00),
        (106, 'USB 32GB', 15.00),
        (107, 'Disco Duro', 250.00),
        (108, 'Audífonos', 60.00),
        (109, 'Silla Gamer', 900.00),
        (110, 'Webcam', 120.00);
    END;

    IF NOT EXISTS (SELECT 1 FROM Empleado)
    BEGIN
        INSERT INTO Empleado (id_empleado, nombre, cargo) VALUES
        (201, 'Andrés Silva', 'Vendedor'),
        (202, 'Diana Torres', 'Cajera'),
        (203, 'Ricardo Pérez', 'Gerente'),
        (204, 'Valentina Gómez', 'Asistente'),
        (205, 'Sergio Ríos', 'Vendedor'),
        (206, 'Paola Cárdenas', 'Cajera'),
        (207, 'Fernando López', 'Supervisor'),
        (208, 'Carolina Méndez', 'Vendedor'),
        (209, 'Mateo Sánchez', 'Cajero'),
        (210, 'Juliana Rojas', 'Vendedora');
    END;

    IF NOT EXISTS (SELECT 1 FROM Factura)
    BEGIN
        INSERT INTO Factura (id_factura, id_cliente, id_empleado, fecha) VALUES
        (301, 1, 201, '2024-01-10'),
        (302, 2, 202, '2024-01-15'),
        (303, 3, 203, '2024-02-05'),
        (304, 4, 204, '2024-02-20'),
        (305, 5, 205, '2024-03-10'),
        (306, 6, 206, '2024-03-25'),
        (307, 7, 207, '2024-04-12'),
        (308, 8, 208, '2024-04-18'),
        (309, 9, 209, '2024-05-02'),
        (310, 10, 210, '2024-05-15');
    END;

    IF NOT EXISTS (SELECT 1 FROM Proveedor)
    BEGIN
        INSERT INTO Proveedor (id_proveedor, nombre, contacto) VALUES
        (401, 'Tech Solutions', 'contacto@tech.com'),
        (402, 'Global Supplies', 'ventas@global.com'),
        (403, 'CompuParts', 'info@compuparts.com'),
        (404, 'ElectroWorld', 'soporte@electro.com'),
        (405, 'MegaTech', 'clientes@megatech.com'),
        (406, 'Digital Store', 'ventas@digital.com'),
        (407, 'InnovaTech', 'info@innova.com'),
        (408, 'CompuMarket', 'soporte@compumarket.com'),
        (409, 'ProveedoresYA', 'ventas@ya.com'),
        (410, 'ElectroCenter', 'info@electrocenter.com');
    END;

    IF NOT EXISTS (SELECT 1 FROM Factura_Producto)
    BEGIN
        INSERT INTO Factura_Producto (id_factura, id_producto, cantidad) VALUES
        (301, 101, 1),
        (302, 102, 2),
        (303, 103, 1),
        (304, 104, 1),
        (305, 105, 1),
        (306, 106, 3),
        (307, 107, 1),
        (308, 108, 2),
        (309, 109, 1),
        (310, 110, 1);
    END;

    IF NOT EXISTS (SELECT 1 FROM Producto_Proveedor)
    BEGIN
        INSERT INTO Producto_Proveedor (id_producto, id_proveedor) VALUES
        (101, 401),
        (102, 402),
        (103, 403),
        (104, 404),
        (105, 405),
        (106, 406),
        (107, 407),
        (108, 408),
        (109, 409),
        (110, 410);
    END;
END;

EXEC insertar_datos_facturacion;

CREATE VIEW ClientesFacturas AS
SELECT f.id_factura, c.nombre AS Cliente
FROM Factura f
INNER JOIN Cliente c ON f.id_cliente = c.id_cliente;

CREATE VIEW FacturasProductos AS
SELECT f.id_factura, p.nombre AS Producto, fp.cantidad
FROM Factura_Producto fp
INNER JOIN Factura f ON fp.id_factura = f.id_factura
INNER JOIN Producto p ON fp.id_producto = p.id_producto;

CREATE VIEW EmpleadosFacturas AS
SELECT e.nombre AS Empleado, COUNT(f.id_factura) AS TotalFacturas
FROM Empleado e
LEFT JOIN Factura f ON e.id_empleado = f.id_empleado
GROUP BY e.nombre;

CREATE VIEW ProductosProveedores AS
SELECT p.nombre AS Producto, pr.nombre AS Proveedor
FROM Producto p
INNER JOIN Producto_Proveedor pp ON p.id_producto = pp.id_producto
INNER JOIN Proveedor pr ON pp.id_proveedor = pr.id_proveedor;

CREATE VIEW TopClientes AS
SELECT c.nombre AS Cliente, SUM(fp.cantidad) AS TotalProductos
FROM Cliente c
INNER JOIN Factura f ON c.id_cliente = f.id_cliente
INNER JOIN Factura_Producto fp ON f.id_factura = fp.id_factura
GROUP BY c.nombre;

CREATE PROCEDURE ver_reportes_empresa
AS
BEGIN
    SELECT * FROM ClientesFacturas;
    SELECT * FROM FacturasProductos;
    SELECT * FROM EmpleadosFacturas;
    SELECT * FROM ProductosProveedores;
    SELECT * FROM TopClientes;
END;

EXEC ver_reportes_empresa;