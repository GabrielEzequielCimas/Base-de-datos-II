-- Inserts
USE ReservasFutbol;
GO

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

INSERT INTO Canchas (IdTipo, Ubicacion) 
VALUES
(1, 'A1'), (1, 'A2'), (1, 'A3'),
(1, 'A4'), (1, 'A5'), (2, 'B1'),
(2, 'B2'), (2, 'B3'), (2, 'B4'),
(2, 'B5'), (3, 'C1'), (3, 'C2'),
(3, 'C3'), (3, 'C4'), (3, 'C5'),
(4, 'D1'), (4, 'D2'), (4, 'D3'),
(4, 'D4'), (4, 'D5'), (1, 'E1'),
(1, 'E2'), (1, 'E3'), (1, 'E4'),
(1, 'E5'), (2, 'F1'), (2, 'F2'),
(2, 'F3'), (2, 'F4'), (2, 'F5'),
(3, 'G1'), (3, 'G2'), (3, 'G3'),
(3, 'G4'), (3, 'G5'), (4, 'H1'),
(4, 'H2'), (4, 'H3'), (4, 'H4'),
(4, 'H5');
GO


-- Clientes
INSERT INTO Clientes (Nombre, Apellido, DNI, Email, Telefono, Pass) VALUES
('Juan', 'Pérez', 30123456, 'juan.perez@email.com', '1122334455', 'pass123'),
('María', 'González', 30234567, 'maria.gonzalez@email.com', '1166778899', 'pass456'),
('Carlos', 'López', 30345678, 'carlos.lopez@email.com', '1144556677', 'pass789'),
('Ana', 'Martínez', 30456789, 'ana.martinez@email.com', '1199887766', 'pass321'),
('Lucía', 'Rodríguez', 30567890, 'lucia.rodriguez@email.com', '1133557799', 'pass654'),
('Diego', 'Fernández', 30678901, 'diego.fernandez@email.com', '1177993355', 'pass987'),
('Sofía', 'Gómez', 30789012, 'sofia.gomez@email.com', '1155778899', 'pass159'),
('Martín', 'Díaz', 30890123, 'martin.diaz@email.com', '1122446688', 'pass753'),
('Valentina', 'Silva', 30901234, 'valentina.silva@email.com', '1188665544', 'pass852'),
('Javier', 'Torres', 31012345, 'javier.torres@email.com', '1100223344', 'pass456');
go








INSERT INTO Precios (IdTipoCancha, Horario, Precio)
VALUES
(1, 9, 21000),  (2, 9, 21500),  (3, 9, 22000),  (4, 9, 22500),
(1, 10, 22000), (2, 10, 22500), (3, 10, 23000), (4, 10, 23500),
(1, 11, 23000), (2, 11, 23500), (3, 11, 24000), (4, 11, 24500),
(1, 12, 24000), (2, 12, 24500), (3, 12, 25000), (4, 12, 25500),
(1, 13, 25000), (2, 13, 25500), (3, 13, 26000), (4, 13, 26500),
(1, 14, 26000), (2, 14, 26500), (3, 14, 27000), (4, 14, 27500),
(1, 15, 27000), (2, 15, 27500), (3, 15, 28000), (4, 15, 28500),
(1, 16, 28000), (2, 16, 28500), (3, 16, 29000), (4, 16, 29500),
(1, 17, 29000), (2, 17, 29500), (3, 17, 30000), (4, 17, 30500),
(1, 18, 30000), (2, 18, 30500), (3, 18, 31000), (4, 18, 31500),
(1, 19, 31000), (2, 19, 31500), (3, 19, 32000), (4, 19, 32500),
(1, 20, 32000), (2, 20, 32500), (3, 20, 33000), (4, 20, 33500),
(1, 21, 33000), (2, 21, 33500), (3, 21, 34000), (4, 21, 34500)
GO


EXEC GenerarReserva 7, 21, '2025-04-18', 15, 2,1;
EXEC GenerarReserva 3, 2, '2025-06-01', 19, 6,1;
EXEC GenerarReserva 9, 10, '2025-05-12', 11, 3,1;
EXEC GenerarReserva 2, 18, '2025-03-22', 13, 1,1;
EXEC GenerarReserva 6, 27, '2025-04-27', 14, 5,1;
EXEC GenerarReserva 1, 33, '2025-03-30', 21, 4,1;
EXEC GenerarReserva 10, 6, '2025-05-02', 9, 6,1;
EXEC GenerarReserva 5, 4, '2025-04-20', 17, 1,1;
EXEC GenerarReserva 8, 40, '2025-06-13', 20, 2,1;
EXEC GenerarReserva 4, 13, '2025-05-05', 16, 3,1;
EXEC GenerarReserva 3, 8, '2025-06-15', 12, 4,1;
EXEC GenerarReserva 7, 22, '2025-04-11', 18, 5,1;
EXEC GenerarReserva 9, 14, '2025-03-28', 10, 6,1;
EXEC GenerarReserva 1, 19, '2025-05-19', 13, 1,1;
EXEC GenerarReserva 6, 7, '2025-06-04', 14, 2,1;
EXEC GenerarReserva 2, 20, '2025-04-25', 15, 3,1;
EXEC GenerarReserva 10, 9, '2025-05-10', 11, 4,1;
EXEC GenerarReserva 5, 25, '2025-03-26', 17, 5,1;
EXEC GenerarReserva 8, 28, '2025-06-18', 20, 6,1;
EXEC GenerarReserva 4, 23, '2025-04-14', 16, 1,1;
EXEC GenerarReserva 7, 11, '2025-05-07', 19, 2,1;
EXEC GenerarReserva 3, 30, '2025-03-31', 9, 3,1;
EXEC GenerarReserva 9, 12, '2025-06-20', 12, 4,1;
EXEC GenerarReserva 1, 16, '2025-05-16', 21, 5,1;
EXEC GenerarReserva 6, 15, '2025-04-08', 13, 6,1;
EXEC GenerarReserva 2, 31, '2025-03-23', 14, 1,1;
EXEC GenerarReserva 10, 24, '2025-05-21', 15, 2,1;
EXEC GenerarReserva 5, 3, '2025-06-02', 11, 3,1;
EXEC GenerarReserva 8, 38, '2025-04-30', 17, 4,1;
EXEC GenerarReserva 4, 29, '2025-05-13', 20, 5,1;
EXEC GenerarReserva 7, 1, '2025-06-06', 16, 6,1;
EXEC GenerarReserva 9, 35, '2025-03-25', 19, 1,1;
EXEC GenerarReserva 1, 34, '2025-05-09', 10, 2,1;
EXEC GenerarReserva 6, 36, '2025-04-15', 14, 3,1;
EXEC GenerarReserva 2, 32, '2025-06-08', 15, 4,1;
EXEC GenerarReserva 10, 39, '2025-05-04', 11, 5,1;
EXEC GenerarReserva 5, 26, '2025-03-27', 17, 6,1;
EXEC GenerarReserva 8, 5, '2025-06-12', 20, 1,1;
EXEC GenerarReserva 4, 37, '2025-04-23', 16, 2,1;
EXEC GenerarReserva 7, 14, '2025-05-18', 19, 3,1;
EXEC GenerarReserva 3, 17, '2025-03-29', 9, 4,1;
EXEC GenerarReserva 9, 22, '2025-06-16', 12, 5,1;
EXEC GenerarReserva 1, 10, '2025-05-20', 21, 6,1;
EXEC GenerarReserva 6, 8, '2025-04-07', 13, 1,1;
EXEC GenerarReserva 2, 21, '2025-03-24', 14, 2,1;
EXEC GenerarReserva 10, 9, '2025-05-11', 15, 3,1;
EXEC GenerarReserva 5, 27, '2025-06-03', 11, 4,1;
EXEC GenerarReserva 8, 4, '2025-04-29', 17, 5,1;
EXEC GenerarReserva 4, 18, '2025-05-06', 20, 6,1;
EXEC GenerarReserva 7, 13, '2025-06-14', 16, 1,1;
EXEC GenerarReserva 9, 20, '2025-03-26', 19, 2,1;
EXEC GenerarReserva 1, 15, '2025-05-08', 10, 3,1;
EXEC GenerarReserva 6, 33, '2025-04-16', 14, 4,1;
EXEC GenerarReserva 2, 24, '2025-06-09', 15, 5,1;
EXEC GenerarReserva 10, 11, '2025-05-03', 11, 6,1;
EXEC GenerarReserva 5, 38, '2025-03-28', 17, 1,1;
EXEC GenerarReserva 8, 23, '2025-06-19', 20, 2,1;
EXEC GenerarReserva 4, 16, '2025-04-24', 16, 3,1;
EXEC GenerarReserva 7, 7, '2025-05-17', 19, 4,1;
EXEC GenerarReserva 3, 19, '2025-03-30', 9, 5,1;
EXEC GenerarReserva 9, 25, '2025-06-21', 12, 6,1;
EXEC GenerarReserva 1, 6, '2025-05-15', 21, 1,1;
EXEC GenerarReserva 6, 12, '2025-04-09', 13, 2,1;
EXEC GenerarReserva 2, 30, '2025-03-23', 14, 3,1;
EXEC GenerarReserva 10, 14, '2025-05-22', 15, 4,1;
EXEC GenerarReserva 5, 35, '2025-06-01', 11, 5,1;
EXEC GenerarReserva 8, 28, '2025-04-28', 17, 6,1;
EXEC GenerarReserva 4, 1, '2025-05-14', 20, 1,1;
EXEC GenerarReserva 7, 9, '2025-06-05', 16, 2,1;
EXEC GenerarReserva 9, 2, '2025-03-25', 19, 3,1;
EXEC GenerarReserva 1, 34, '2025-05-10', 10, 4,1;
EXEC GenerarReserva 6, 39, '2025-04-13', 14, 5,1;
EXEC GenerarReserva 2, 31, '2025-06-07', 15, 6,1;
EXEC GenerarReserva 10, 26, '2025-05-01', 11, 1,1;
EXEC GenerarReserva 5, 3, '2025-03-27', 17, 2,1;
EXEC GenerarReserva 8, 37, '2025-06-11', 20, 3,1;
EXEC GenerarReserva 4, 22, '2025-04-22', 16, 4,1;
EXEC GenerarReserva 7, 16, '2025-05-19', 19, 5,1;
EXEC GenerarReserva 3, 8, '2025-03-29', 9, 6,1;
EXEC GenerarReserva 9, 18, '2025-06-17', 12, 1,1;
EXEC GenerarReserva 1, 11, '2025-05-21', 21, 2,1;
EXEC GenerarReserva 6, 20, '2025-04-06', 13, 3,1;
EXEC GenerarReserva 2, 5, '2025-03-24', 14, 4,1;
EXEC GenerarReserva 10, 29, '2025-05-12', 15, 5,1;
EXEC GenerarReserva 5, 13, '2025-06-02', 11, 6,1;
EXEC GenerarReserva 8, 15, '2025-04-30', 17, 1,1;
EXEC GenerarReserva 4, 27, '2025-05-05', 20, 2,1;
EXEC GenerarReserva 7, 32, '2025-06-16', 16, 3,1;
EXEC GenerarReserva 3, 24, '2025-03-31', 19, 4,1;
EXEC GenerarReserva 9, 10, '2025-05-18', 10, 5,1;
EXEC GenerarReserva 1, 23, '2025-04-08', 14, 6,1;
EXEC GenerarReserva 6, 7, '2025-06-03', 15, 1,1;
EXEC GenerarReserva 2, 21, '2025-03-23', 11, 2,1;
--------------
DECLARE @FechaActual DATE = CAST(GETDATE() AS DATE);
EXEC GenerarReserva 5, 12, @FechaActual, 17, 1, 1;
EXEC GenerarReserva 8, 18, @FechaActual, 19, 2, 1;
EXEC GenerarReserva 3, 6,  @FechaActual, 20, 3, 1;
EXEC GenerarReserva 10, 9, @FechaActual, 18, 4, 1;
EXEC GenerarReserva 6, 14, @FechaActual, 16, 5, 1;
EXEC GenerarReserva 2, 22, @FechaActual, 15, 6, 1;
EXEC GenerarReserva 7, 17, @FechaActual, 14, 1, 1;
EXEC GenerarReserva 1, 11, @FechaActual, 13, 2, 1;
EXEC GenerarReserva 9, 20, @FechaActual, 21, 3, 1;
EXEC GenerarReserva 4, 8,   @FechaActual, 12, 4, 1;