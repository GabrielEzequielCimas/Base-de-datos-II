CREATE VIEW VW_ReportePagos AS
SELECT
    dbo.GetPeriodo(p.FechaPago) AS Periodo,
    mp.Descripcion AS MetodoPago,
    COUNT(p.Id) AS CantidadPagos,
    SUM(p.Precio) AS TotalCobrado
FROM Pagos p
INNER JOIN MetodoPago mp ON p.IdMetodoPago = mp.Id
WHERE p.DeletedAt IS NULL
  AND mp.DeletedAt IS NULL
GROUP BY
    dbo.GetPeriodo(p.FechaPago),
    mp.Descripcion;
GO