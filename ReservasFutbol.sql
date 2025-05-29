
Use ReservasFutbol;
Go
CREATE TABLE Usuario (
  ID_Usuario INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Teléfono VARCHAR(20),
    Contraseña VARCHAR(255) NOT NULL
);

CREATE TABLE Cancha (
    ID_Cancha INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Tipo NVARCHAR(10) NOT NULL,
    Ubicacion NVARCHAR(255) NOT NULL,
    Precio_por_hora DECIMAL(10,2) NOT NULL,
    Estado NVARCHAR(20) NOT NULL DEFAULT 'Disponible',
    
    -- Validaciones manuales para Tipo y Estado
    CONSTRAINT CHK_Cancha_Tipo CHECK (Tipo IN ('5', '7', '11')),
    CONSTRAINT CHK_Cancha_Estado CHECK (Estado IN ('Disponible', 'Mantenimiento'))
);
