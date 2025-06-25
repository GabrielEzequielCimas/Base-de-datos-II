-- Crear la base
CREATE DATABASE ReservasFutbol;
GO

USE ReservasFutbol;
GO


CREATE TABLE Clientes (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    DNI INT NOT NULL UNIQUE,
    Email VARCHAR(150),
    Telefono VARCHAR(20),
    Pass VARCHAR(255),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    DeletedAt DATETIME DEFAULT NULL
);
GO

CREATE TABLE TipoCancha (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Descripcion Varchar(50) unique,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    DeletedAt DATETIME DEFAULT NULL
);
GO

CREATE TABLE Canchas (
    Id INT PRIMARY KEY IDENTITY(1,1),
    IdTipo INT NOT NULL,
    Ubicacion VARCHAR(10) unique,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    DeletedAt DATETIME DEFAULT NULL,
    FOREIGN KEY (IdTipo) REFERENCES TipoCancha(Id)
);
GO

CREATE TABLE Reservas (
    Id INT PRIMARY KEY IDENTITY(1,1),
    IdCliente INT NOT NULL,
    IdCancha INT NOT NULL,
    Fecha DATE,
    Horario INT CHECK (Horario BETWEEN 9 AND 21),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    DeletedAt DATETIME DEFAULT NULL,
    FOREIGN KEY (IdCliente) REFERENCES Clientes(Id),
    FOREIGN KEY (IdCancha) REFERENCES Canchas(Id)
);
GO

CREATE TABLE MetodoPago (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Descripcion  VARCHAR(100) unique,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    DeletedAt DATETIME DEFAULT NULL
);
GO

CREATE TABLE Pagos (
    Id INT PRIMARY KEY IDENTITY(1,1),
    IdReserva INT NOT NULL,
    FechaPago DATETIME,
    IdMetodoPago INT NOT NULL,
	Precio float check (Precio > 0 ),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    DeletedAt DATETIME DEFAULT NULL,
    FOREIGN KEY (IdReserva) REFERENCES Reservas(Id),
    FOREIGN KEY (IdMetodoPago) REFERENCES MetodoPago(Id)
);
GO

CREATE TABLE Precios (
    Id INT PRIMARY KEY IDENTITY(1,1),
    IdTipoCancha INT NOT NULL,
    Horario int CHECK (Horario BETWEEN 9 AND 21),
    Precio FLOAT check (Precio > 0 ),
	CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    DeletedAt DATETIME DEFAULT NULL,
    FOREIGN KEY (IdTipoCancha) REFERENCES TipoCancha(Id)
);
GO