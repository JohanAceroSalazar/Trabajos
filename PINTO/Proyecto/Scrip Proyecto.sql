CREATE DATABASE OneLanguage;
USE OneLanguage;

CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    correo VARCHAR(150) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    fecha_registro DATE NOT NULL,
    estado_usuario VARCHAR(50),
    preferencia_accesibilidad VARCHAR(100)
);

CREATE TABLE Rol (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR(100) NOT NULL,
    descripcion TEXT
);

CREATE TABLE Permiso (
    id_permiso INT AUTO_INCREMENT PRIMARY KEY,
    nombre_permiso VARCHAR(100) NOT NULL,
    descripcion TEXT
);

CREATE TABLE Emoji (
    id_emoji INT AUTO_INCREMENT PRIMARY KEY,
    simbolo VARCHAR(20) NOT NULL,
    descripcion TEXT,
    palabra_clave VARCHAR(100)
);

CREATE TABLE Politica_contrasena (
    id_politica INT AUTO_INCREMENT PRIMARY KEY,
    Min_longitud INT NOT NULL,
    Max_longitud INT NOT NULL,
    RequiereMayusculas TINYINT(1),
    RequiereNumeros TINYINT(1),
    RequiereSimbolos TINYINT(1)
);

CREATE TABLE Configuracion_Seguridad (
    id_configuracion INT AUTO_INCREMENT PRIMARY KEY,
    nombre_configuracion VARCHAR(100),
    valor_configuracion VARCHAR(100),
    descripcion TEXT
);

CREATE TABLE Usuario_Rol (
    id_usuario INT,
    id_rol INT,
    PRIMARY KEY (id_usuario, id_rol),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_rol) REFERENCES Rol(id_rol)
);

CREATE TABLE Rol_Permiso (
    id_rol INT,
    id_permiso INT,
    PRIMARY KEY (id_rol, id_permiso),
    FOREIGN KEY (id_rol) REFERENCES Rol(id_rol),
    FOREIGN KEY (id_permiso) REFERENCES Permiso(id_permiso)
);

CREATE TABLE Traduccion (
    id_traduccion INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    tipo_traduccion VARCHAR(50),
    entrada TEXT,
    salida TEXT,
    fecha_creacion DATE,
    compartir TINYINT(1),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Traduccion_Emoji (
    id_traduccion INT,
    id_emoji INT,
    PRIMARY KEY (id_traduccion, id_emoji),
    FOREIGN KEY (id_traduccion) REFERENCES Traduccion(id_traduccion),
    FOREIGN KEY (id_emoji) REFERENCES Emoji(id_emoji)
);

CREATE TABLE HistorialTraducciones (
    id_historial INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_traduccion INT,
    fecha_guardado DATE,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_traduccion) REFERENCES Traduccion(id_traduccion)
);

CREATE TABLE Configuracion (
    id_configuracion INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    tema VARCHAR(50),
    tamano_texto VARCHAR(20),
    notificaciones TINYINT(1),
    vibracion TINYINT(1),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Sesion (
    id_sesion INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    fecha_inicio TIMESTAMP,
    fecha_cierre TIMESTAMP,
    estado VARCHAR(50),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Sesion_Usuario (
    id_sesion INT,
    id_usuario INT,
    fecha_inicio TIMESTAMP,
    fecha_fin TIMESTAMP,
    estado_sesion VARCHAR(50),
    ip_origen VARCHAR(50),
    PRIMARY KEY (id_sesion, id_usuario),
    FOREIGN KEY (id_sesion) REFERENCES Sesion(id_sesion),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Auditoria (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    accion VARCHAR(200),
    fecha TIMESTAMP,
    descripcion TEXT,
    ip_origen VARCHAR(50),
    aplicacion VARCHAR(100),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Log_Errores (
    id_error INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    fecha TIMESTAMP,
    tipo_error VARCHAR(100),
    descripcion TEXT,
    ip_origen VARCHAR(50),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Recordatorio (
    id_recordatorio INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    mensaje TEXT,
    fecha_hora TIMESTAMP,
    tipo_alerta VARCHAR(50),
    estado VARCHAR(50),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

INSERT INTO Usuario (nombres, apellidos, correo, contrasena, fecha_registro, estado_usuario, preferencia_accesibilidad) VALUES
('Juan', 'Pérez', 'juan@example.com', '12345', GETDATE(), 'Activo', 'Alto contraste'),
('María', 'Gómez', 'maria@example.com', '12345', GETDATE(), 'Activo', 'Texto grande'),
('Luis', 'Ramírez', 'luis@example.com', '12345', GETDATE(), 'Inactivo', 'Ninguna');

INSERT INTO Rol (nombre_rol, descripcion) VALUES
('Admin', 'Acceso total'),
('Editor', 'Puede editar contenidos'),
('Lector', 'Solo lectura');

INSERT INTO Permiso (nombre_permiso, descripcion) VALUES
('Crear', 'Permite crear registros'),
('Editar', 'Permite editar registros'),
('Eliminar', 'Permite eliminar registros');

INSERT INTO Emoji (simbolo, descripcion, palabra_clave) VALUES
('??', 'Cara feliz', 'feliz'),
('??', 'Cara triste', 'triste'),
('??', 'Fuego', 'fuego');

INSERT INTO Politica_contrasena (Min_longitud, Max_longitud, RequiereMayusculas, RequiereNumeros, RequiereSimbolos) VALUES
(8, 16, 1, 1, 1),
(6, 12, 1, 0, 1),
(10, 20, 0, 1, 0);

INSERT INTO Configuracion_Seguridad (nombre_configuracion, valor_configuracion, descripcion) VALUES
('MaxIntentos', '5', 'Máximo de intentos fallidos'),
('TiempoBloqueo', '30', 'Tiempo en minutos de bloqueo'),
('Captcha', 'ON', 'Uso de captcha en login');

INSERT INTO Usuario_Rol VALUES (1,1), (2,2), (3,3);

INSERT INTO Rol_Permiso VALUES (1,1), (1,2), (2,2);

INSERT INTO Traduccion (id_usuario, tipo_traduccion, entrada, salida, fecha_creacion, compartir) VALUES
(1, 'Texto', 'Hola', 'Hello', GETDATE(), 1),
(2, 'Texto', 'Adiós', 'Goodbye', GETDATE(), 0),
(3, 'Texto', 'Fuego', 'Fire', GETDATE(), 1);

INSERT INTO Traduccion_Emoji VALUES (1,1), (2,2), (3,3);

INSERT INTO HistorialTraducciones (id_usuario, id_traduccion, fecha_guardado) VALUES
(1,1,GETDATE()), (2,2,GETDATE()), (3,3,GETDATE());

INSERT INTO Configuracion (id_usuario, tema, tamano_texto, notificaciones, vibracion) VALUES
(1, 'Oscuro', 'Grande', 1, 1),
(2, 'Claro', 'Mediano', 0, 1),
(3, 'Oscuro', 'Pequeño', 1, 0);

INSERT INTO Sesion (id_usuario, estado) VALUES
(1,'Activa'), (2,'Cerrada'), (3,'Activa');

INSERT INTO Sesion_Usuario VALUES (1,1,GETDATE(),NULL,'Activa','192.168.1.1'),
(2,2,GETDATE(),GETDATE(),'Cerrada','192.168.1.2'),
(3,3,GETDATE(),NULL,'Activa','192.168.1.3');

INSERT INTO Auditoria (id_usuario, accion, descripcion, ip_origen, aplicacion) VALUES
(1,'Login','Inicio de sesión','192.168.1.1','Web'),
(2,'Logout','Cierre de sesión','192.168.1.2','Móvil'),
(3,'Cambio de contraseña','Usuario cambió clave','192.168.1.3','Web');

INSERT INTO Log_Errores (id_usuario, tipo_error, descripcion, ip_origen) VALUES
(1,'404','Página no encontrada','192.168.1.1'),
(2,'500','Error interno','192.168.1.2'),
(3,'403','Acceso denegado','192.168.1.3');

INSERT INTO Recordatorio (id_usuario, mensaje, fecha_hora, tipo_alerta, estado) VALUES
(1,'Revisar traducción','2025-09-21 10:00','Alarma','Pendiente'),
(2,'Actualizar clave','2025-09-21 15:00','Correo','Pendiente'),
(3,'Verificar permisos','2025-09-22 09:00','Popup','Completado');

CREATE PROCEDURE sp_ObtenerTraduccionesPorUsuario
    @id_usuario INT
AS
BEGIN
    SELECT t.id_traduccion, t.entrada, t.salida, t.fecha_creacion
    FROM Traduccion t
    WHERE t.id_usuario = @id_usuario;
END;


CREATE PROCEDURE sp_InsertarUsuario
    @nombres NVARCHAR(100),
    @apellidos NVARCHAR(100),
    @correo NVARCHAR(150),
    @contrasena NVARCHAR(255)
AS
BEGIN
    INSERT INTO Usuario (nombres, apellidos, correo, contrasena, fecha_registro, estado_usuario)
    VALUES (@nombres, @apellidos, @correo, @contrasena, GETDATE(), 'Activo');
END;


CREATE VIEW vw_UsuariosConRol AS
SELECT u.id_usuario, u.nombres, u.apellidos, r.nombre_rol
FROM Usuario u
INNER JOIN Usuario_Rol ur ON u.id_usuario = ur.id_usuario
INNER JOIN Rol r ON ur.id_rol = r.id_rol;

CREATE VIEW vw_TraduccionesConEmoji AS
SELECT t.id_traduccion, t.entrada, t.salida, e.simbolo, e.palabra_clave
FROM Traduccion t
INNER JOIN Traduccion_Emoji te ON t.id_traduccion = te.id_traduccion
INNER JOIN Emoji e ON te.id_emoji = e.id_emoji;

CREATE INDEX idx_usuario_correo ON Usuario(correo);
CREATE INDEX idx_traduccion_fecha ON Traduccion(fecha_creacion);