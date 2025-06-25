CREATE PROCEDURE ReporteReservas
@fechainicio DATETIME,
@fechafin DATETIME

AS
BEGIN

SELECT

R.Id AS ReservaId,
C.Nombre + ' ' + C.Apellido AS Cliente,
CN.Ubicacion AS Cancha,
R.Fecha,
R.Horario,
 R.CreatedAt
    FROM Reservas R
    INNER JOIN Clientes C ON R.IdCliente = C.Id -- busca dentro de la tabla clientes el id del cliente
    INNER JOIN Canchas CN ON R.IdCancha = CN.Id -- busca dentro de la tabla canchas el id de la cancha
    WHERE R.Fecha BETWEEN @FechaInicio AND @FechaFin -- condicionante ente fecha de inicio y fin
      AND R.DeletedAt is null
      AND R.DeletedAt IS NULL
    ORDER BY R.Fecha, R.Horario;
END;