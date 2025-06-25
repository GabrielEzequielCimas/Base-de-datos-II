CREATE VIEW VW_reservasActuales AS
SELECT 
	cl.Id ClienteId,
    r.IdCancha,
    r.Fecha,
    r.Horario,
    cl.Nombre + ' ' + cl.Apellido AS Cliente,
    cl.Telefono AS TelefonoCliente
FROM Reservas r
INNER JOIN Clientes cl ON r.IdCliente = cl.Id
WHERE 
    r.DeletedAt IS NULL
    AND CAST(r.Fecha AS DATE) = CAST(GETDATE() AS DATE);
GO
