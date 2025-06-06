USE ReservasFutbol
GO
CREATE PROCEDURE ReporteReservas
@fechainicio DATETIME,
@fechafin DATETIME,
@estado VARCHAR(20)= NULL

AS
BEGIN

SELECT

R.Id AS ReservaId,
C.Nombre + ' ' + C.Apellido AS Cliente,
CN.Nombre AS Cancha,
R.Fecha,
R.HoraInicio,
R.HoraFin,
R.Estado,
 R.CreatedAt
    FROM Reservas R
    INNER JOIN Clientes C ON R.IdCliente = C.Id -- busca dentro de la tabla clientes el id del cliente
    INNER JOIN Canchas CN ON R.IdCancha = CN.Id -- busca dentro de la tabla canchas el id de la cancha
    WHERE R.Fecha BETWEEN @FechaInicio AND @FechaFin -- condicionante ente fecha de inicio y fin
      AND (R.Estado = @Estado OR @Estado IS NULL) -- verifica que el estado de la reserva no sea nulo o que coincida con el estado ingresado
      AND R.DeletedAt IS NULL
    ORDER BY R.Fecha, R.HoraInicio;
END;

------Este procedimiento genera un reporte de reservas segun rango de fechas y estado
