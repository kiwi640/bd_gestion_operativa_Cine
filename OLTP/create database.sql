Create database 
bd_gestion_operativa_Cine
go

USE bd_gestion_operativa_cine;
GO

-- 1. Caso de Base de Datos Transaccional (OLTP)

CREATE TABLE Peliculas (
    ID_Pelicula INT IDENTITY PRIMARY KEY,
    Titulo VARCHAR(100) NOT NULL,
    Genero VARCHAR(50),
    Duracion INT,
    Clasificacion VARCHAR(10)
);


CREATE TABLE Salas (
    ID_Sala INT IDENTITY PRIMARY KEY,
    Numero INT NOT NULL,
    Capacidad INT NOT NULL,
    Tipo_Pantalla VARCHAR(50)
);


CREATE TABLE Funciones (
    ID_Funcion INT IDENTITY PRIMARY KEY,
    ID_Pelicula INT NOT NULL,
    ID_Sala INT NOT NULL,
    Horario DATETIME NOT NULL,
    CONSTRAINT FK_Funcion_Pelicula FOREIGN KEY (ID_Pelicula)
        REFERENCES Peliculas(ID_Pelicula),
    CONSTRAINT FK_Funcion_Sala FOREIGN KEY (ID_Sala)
        REFERENCES Salas(ID_Sala)
);


CREATE TABLE Clientes (
    ID_Cliente INT IDENTITY PRIMARY KEY,
    Nombre VARCHAR(100),
    Correo VARCHAR(100) UNIQUE,
    Puntos_Frecuencia INT DEFAULT 0
);


CREATE TABLE Productos_Dulceria (
    ID_Producto INT IDENTITY PRIMARY KEY,
    Nombre VARCHAR(100),
    Categoria VARCHAR(50),
    Stock INT,
    Precio DECIMAL(8,2)
);


CREATE TABLE Ventas (
    ID_Venta INT IDENTITY PRIMARY KEY,
    ID_Cliente INT,
    Fecha DATETIME DEFAULT GETDATE(),
    Total DECIMAL(10,2),
    CONSTRAINT FK_Venta_Cliente FOREIGN KEY (ID_Cliente)
        REFERENCES Clientes(ID_Cliente)
);


CREATE TABLE Boletos (
    ID_Boleto INT IDENTITY PRIMARY KEY,
    ID_Funcion INT NOT NULL,
    ID_Venta INT NOT NULL,
    Asiento VARCHAR(5) NOT NULL,
    Precio DECIMAL(8,2),
    CONSTRAINT FK_Boleto_Funcion FOREIGN KEY (ID_Funcion)
        REFERENCES Funciones(ID_Funcion),
    CONSTRAINT FK_Boleto_Venta FOREIGN KEY (ID_Venta)
        REFERENCES Ventas(ID_Venta),
    CONSTRAINT UQ_Asiento_Funcion UNIQUE (ID_Funcion, Asiento)
);

