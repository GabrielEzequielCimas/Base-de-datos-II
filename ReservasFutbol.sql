create database ReservasFutbol;
Use ReservasFutbol;
Go
-------------------------------------------------------------CREAR TABLAS-------------------------------------------------------------
-- Clientes
CREATE TABLE Clientes (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    DNI INT NOT NULL UNIQUE,
    Email VARCHAR(150),
    Telefono VARCHAR(20),
    Pass VARCHAR(255),
    Estado VARCHAR(20),
    CreatedAt DATETIME,
    UpdatedAt DATETIME,
    DeletedAt DATETIME
);

-- TipoCancha
CREATE TABLE TipoCancha (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Descripcion TEXT,
    CreatedAt DATETIME,
    UpdatedAt DATETIME,
    DeletedAt DATETIME
);

-- Canchas
CREATE TABLE Canchas (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100),
    IdTipo INT NOT NULL FOREIGN KEY (IdTipo) REFERENCES TipoCancha(Id),
    Ubicacion VARCHAR(255),
    Estado VARCHAR(20),
    CreatedAt DATETIME,
    UpdatedAt DATETIME,
    DeletedAt DATETIME
);

-- Reservas
CREATE TABLE Reservas (
    Id INT PRIMARY KEY IDENTITY(1,1),
    IdCliente INT NOT NULL FOREIGN KEY (IdCliente) REFERENCES Clientes(Id),
    IdCancha INT NOT NULL FOREIGN KEY (IdCancha) REFERENCES Canchas(Id),
    Fecha DATETIME,
    HoraInicio TIME,
    HoraFin TIME,
    Estado VARCHAR(20), 
    CreatedAt DATETIME,
    UpdatedAt DATETIME,
    DeletedAt DATETIME
);

-- MetodoPago
CREATE TABLE MetodoPago (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Descripcion VARCHAR(100),
    CreatedAt DATETIME,
    UpdatedAt DATETIME,
    DeletedAt DATETIME
);

-- Pagos
CREATE TABLE Pagos (
    Id INT PRIMARY KEY IDENTITY(1,1),
    IdReserva INT NOT NULL FOREIGN KEY (IdReserva) REFERENCES Reservas(Id),
    FechaPago DATETIME,
    IdMetodoPago INT NOT NULL FOREIGN KEY (IdMetodoPago) REFERENCES MetodoPago(Id),
    Estado VARCHAR(20), 
    CreatedAt DATETIME,
    UpdatedAt DATETIME,
    DeletedAt DATETIME
);
--------------------------------------------------------------------------------------------------------------------------
