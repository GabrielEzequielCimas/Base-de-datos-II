CREATE VIEW VW_ReservasPorCliente AS
SELECT
    c.Id AS ClienteId,
    c.Nombre + ' ' + c.Apellido AS Cliente,
    COUNT(r.Id) AS CantidadReservas,
    ISNULL(SUM(p.Precio), 0) AS TotalPagado
FROM Clientes c
LEFT JOIN Reservas r ON c.Id = r.IdCliente AND r.DeletedAt IS NULL
LEFT JOIN Pagos p ON r.Id = p.IdReserva AND p.DeletedAt IS NULL
WHERE c.DeletedAt IS NULL
GROUP BY c.Id, c.Nombre, c.Apellido;
GO