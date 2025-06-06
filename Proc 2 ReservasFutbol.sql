USE ReservasFutbol
GO

CREATE PROCEDURE CancelarReserva
    @IdReserva INT
AS
BEGIN
    UPDATE Reservas --- acrualiza reservas
    SET Estado = 'Cancelada', -- setea estado a cancelada
    UpdatedAt = GETDATE() --- actualiza fecha de actualización utilizando el metodo getdate
    WHERE Id = @IdReserva AND DeletedAt IS NULL; -- busca el nro de id y chequea que no este eliminado previamente
    
    -- Anula el pago asociado a la reserva
    UPDATE Pagos
    SET Estado = 'Anulado',
        UpdatedAt = GETDATE()
    WHERE IdReserva = @IdReserva AND DeletedAt IS NULL;
END;
