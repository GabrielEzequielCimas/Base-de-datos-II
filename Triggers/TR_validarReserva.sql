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
          AND r.DeletedAt IS NULL
          AND i.DeletedAt IS NULL
          AND i.Fecha = r.Fecha
          AND r.Horario = i.Horario
          AND r.Id <> i.Id -- para update, eno comparar conmsigo misma
    )
    BEGIN
        RAISERROR ('La cancha ya está reservada en ese horario.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END
go