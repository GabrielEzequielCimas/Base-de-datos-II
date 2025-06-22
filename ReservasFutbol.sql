
-- Crear nueva base
CREATE DATABASE ReservasFutbol;
GO

USE ReservasFutbol;
GO

-- Crear tablas
CREATE TABLE Clientes (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    DNI INT NOT NULL UNIQUE,
    Email VARCHAR(150),
    Telefono VARCHAR(20),
    Pass VARCHAR(255),
    Estado VARCHAR(20),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    DeletedAt DATETIME DEFAULT NULL
);
GO

CREATE TABLE TipoCancha (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Descripcion TEXT,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    DeletedAt DATETIME DEFAULT NULL
);
GO

CREATE TABLE Canchas (
    Id INT PRIMARY KEY IDENTITY(1,1),
    IdTipo INT NOT NULL,
    Ubicacion VARCHAR(255),
    Estado VARCHAR(20),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    DeletedAt DATETIME DEFAULT NULL,
    FOREIGN KEY (IdTipo) REFERENCES TipoCancha(Id)
);
GO

CREATE TABLE Reservas (
    Id INT PRIMARY KEY IDENTITY(1,1),
    IdCliente INT NOT NULL,
    IdCancha INT NOT NULL,
    Fecha DATE,
    Horario INT CHECK (Horario BETWEEN 9 AND 21),
    Estado VARCHAR(20), 
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    DeletedAt DATETIME DEFAULT NULL,
    FOREIGN KEY (IdCliente) REFERENCES Clientes(Id),
    FOREIGN KEY (IdCancha) REFERENCES Canchas(Id)
);
GO

CREATE TABLE MetodoPago (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Descripcion VARCHAR(100),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    DeletedAt DATETIME DEFAULT NULL
);
GO

CREATE TABLE Pagos (
    Id INT PRIMARY KEY IDENTITY(1,1),
    IdReserva INT NOT NULL,
    FechaPago DATETIME,
    IdMetodoPago INT NOT NULL,
    Estado VARCHAR(20), 
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    DeletedAt DATETIME DEFAULT NULL,
    FOREIGN KEY (IdReserva) REFERENCES Reservas(Id),
    FOREIGN KEY (IdMetodoPago) REFERENCES MetodoPago(Id)
);
GO

-- Triggers
CREATE TRIGGER TR_UpdateClientes ON Clientes
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Clientes
    SET UpdatedAt = GETDATE()
    WHERE Id IN (SELECT Id FROM INSERTED);
END;
GO

CREATE TRIGGER TR_DeleteClientes ON Clientes
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Clientes
    SET DeletedAt = GETDATE()
    WHERE Id IN (SELECT Id FROM DELETED);
END;
GO

CREATE TRIGGER TR_UpdateTipoCancha ON TipoCancha
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE TipoCancha
    SET UpdatedAt = GETDATE()
    WHERE Id IN (SELECT Id FROM INSERTED);
END;
GO

CREATE TRIGGER TR_DeleteTipoCancha ON TipoCancha
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE TipoCancha
    SET DeletedAt = GETDATE()
    WHERE Id IN (SELECT Id FROM DELETED);
END;
GO

CREATE TRIGGER TR_UpdateCanchas ON Canchas
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Canchas
    SET UpdatedAt = GETDATE()
    WHERE Id IN (SELECT Id FROM INSERTED);
END;
GO

CREATE TRIGGER TR_DeleteCanchas ON Canchas
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Canchas
    SET DeletedAt = GETDATE()
    WHERE Id IN (SELECT Id FROM DELETED);
END;
GO

CREATE TRIGGER TR_UpdateReservas ON Reservas
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Reservas
    SET UpdatedAt = GETDATE()
    WHERE Id IN (SELECT Id FROM INSERTED);
END;
GO

CREATE TRIGGER TR_DeleteReservas
ON Reservas
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Marcar como borradas las reservas
    UPDATE Reservas
    SET DeletedAt = GETDATE()
    WHERE Id IN (SELECT Id FROM DELETED);

    -- Marcar como borrados los pagos asociados a esas reservas
    UPDATE Pagos
    SET DeletedAt = GETDATE()
    WHERE IdReserva IN (SELECT Id FROM DELETED)
      AND DeletedAt IS NULL;
END;
GO

CREATE TRIGGER TR_UpdateMetodoPago ON MetodoPago
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE MetodoPago
    SET UpdatedAt = GETDATE()
    WHERE Id IN (SELECT Id FROM INSERTED);
END;
GO

CREATE TRIGGER TR_DeleteMetodoPago ON MetodoPago
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE MetodoPago
    SET DeletedAt = GETDATE()
    WHERE Id IN (SELECT Id FROM DELETED);
END;
GO

CREATE TRIGGER TR_UpdatePagos ON Pagos
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Pagos
    SET UpdatedAt = GETDATE()
    WHERE Id IN (SELECT Id FROM INSERTED);
END;
GO

CREATE TRIGGER TR_DeletePagos ON Pagos
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Pagos
    SET DeletedAt = GETDATE()
    WHERE Id IN (SELECT Id FROM DELETED);
END;
GO

CREATE TRIGGER TR__ValidarReserva
ON Reservas
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM Reservas r
        INNER JOIN inserted i ON 1=1
        WHERE r.IdCancha = i.IdCancha
          AND r.Estado = 'Activa' 
          AND r.DeletedAt IS NULL
          AND i.DeletedAt IS NULL
          AND i.Fecha = r.Fecha
          AND r.Horario = i.Horario
          AND r.Id <> i.Id -- para UPDATE, evitar comparar con sí misma
    )
    BEGIN
        RAISERROR ('La cancha ya está reservada en ese horario.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END
go

CREATE TRIGGER TR__InsertPago_AfterReserva
ON Reservas
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Pagos (IdReserva, FechaPago, IdMetodoPago, Estado)
    SELECT 
        i.Id,              -- Id de la reserva recién insertada
        GETDATE(),         -- Fecha del pago (ahora)
        1,                 -- IdMetodoPago por defecto (ej: Efectivo)
        'Pendiente'        -- Estado inicial del pago
    FROM inserted i;
END;
GO



-- Inserts
INSERT INTO TipoCancha (Descripcion) 
VALUES ('Fútbol 5'), ('Fútbol 7'), ('Fútbol 9'), ('Fútbol 11');
GO

INSERT INTO MetodoPago (Descripcion) 
VALUES 
('Efectivo'), 
('Tarjeta de Débito'), 
('Tarjeta de Crédito'), 
('Transferencia Bancaria'), 
('Mercado Pago'), 
('Pago en Línea');
GO

INSERT INTO Canchas (IdTipo, Ubicacion, Estado) 
VALUES
(1, 'A1', 'Disponible'), (1, 'A2', 'Mantenimiento'), (1, 'A3', 'Disponible'),
(1, 'A4', 'Disponible'), (1, 'A5', 'Mantenimiento'), (2, 'B1', 'Disponible'),
(2, 'B2', 'Disponible'), (2, 'B3', 'Mantenimiento'), (2, 'B4', 'Disponible'),
(2, 'B5', 'Disponible'), (3, 'C1', 'Mantenimiento'), (3, 'C2', 'Disponible'),
(3, 'C3', 'Disponible'), (3, 'C4', 'Mantenimiento'), (3, 'C5', 'Disponible'),
(4, 'D1', 'Disponible'), (4, 'D2', 'Mantenimiento'), (4, 'D3', 'Disponible'),
(4, 'D4', 'Disponible'), (4, 'D5', 'Mantenimiento'), (1, 'E1', 'Disponible'),
(1, 'E2', 'Disponible'), (1, 'E3', 'Mantenimiento'), (1, 'E4', 'Disponible'),
(1, 'E5', 'Disponible'), (2, 'F1', 'Disponible'), (2, 'F2', 'Mantenimiento'),
(2, 'F3', 'Disponible'), (2, 'F4', 'Disponible'), (2, 'F5', 'Disponible'),
(3, 'G1', 'Mantenimiento'), (3, 'G2', 'Disponible'), (3, 'G3', 'Disponible'),
(3, 'G4', 'Disponible'), (3, 'G5', 'Mantenimiento'), (4, 'H1', 'Disponible'),
(4, 'H2', 'Disponible'), (4, 'H3', 'Mantenimiento'), (4, 'H4', 'Disponible'),
(4, 'H5', 'Disponible');
GO


-- Clientes
INSERT INTO Clientes (Nombre, Apellido, DNI, Email, Telefono, Pass, Estado) VALUES
('Juan', 'Pérez', 30123456, 'juan.perez@email.com', '1122334455', 'pass123', 'Activo'),
('María', 'González', 30234567, 'maria.gonzalez@email.com', '1166778899', 'pass456', 'Activo'),
('Carlos', 'López', 30345678, 'carlos.lopez@email.com', '1144556677', 'pass789', 'Inactivo'),
('Ana', 'Martínez', 30456789, 'ana.martinez@email.com', '1199887766', 'pass321', 'Activo'),
('Lucía', 'Rodríguez', 30567890, 'lucia.rodriguez@email.com', '1133557799', 'pass654', 'Activo'),
('Diego', 'Fernández', 30678901, 'diego.fernandez@email.com', '1177993355', 'pass987', 'Activo'),
('Sofía', 'Gómez', 30789012, 'sofia.gomez@email.com', '1155778899', 'pass159', 'Activo'),
('Martín', 'Díaz', 30890123, 'martin.diaz@email.com', '1122446688', 'pass753', 'Activo'),
('Valentina', 'Silva', 30901234, 'valentina.silva@email.com', '1188665544', 'pass852', 'Activo'),
('Javier', 'Torres', 31012345, 'javier.torres@email.com', '1100223344', 'pass456', 'Activo');
go





INSERT INTO Reservas (IdCliente, IdCancha, Fecha, Horario, Estado)
VALUES
(1, 1, '2025-06-12', 10, 'Activa'),
(2, 2, '2025-06-12', 11, 'Activa'),
(3, 3, '2025-06-13', 12, 'Activa'),
(4, 4, '2025-06-13', 15, 'Activa'),
(5, 5, '2025-06-14', 17, 'Activa'),
(6, 6, '2025-06-14', 19, 'Activa'),
(7, 7, '2025-06-15', 9,  'Activa'),
(8, 8, '2025-06-15', 18, 'Activa'),
(9, 9, '2025-06-16', 14, 'Activa'),
(10, 10, '2025-06-16', 13, 'Activa');
GO
