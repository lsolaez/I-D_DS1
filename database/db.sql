CREATE DATABASE bakery;
USE bakery;

create table users(
    id INT(11) NOT NULL,
    username varchar(16) NOT NULL,
    password varchar(60) NOT NULL,
    fullname varchar(100) NOT NULL,
);


CREATE TABLE Producto (
    Codigo INT PRIMARY KEY,
    imagen VARCHAR(255),
    Nombre VARCHAR(100),
    Descripcion TEXT,
    Precio DECIMAL(10, 2),
    Categoria VARCHAR(50),
    Disponible VARCHAR(2)
);

CREATE TABLE Cliente (
    Código INT PRIMARY KEY,
    Dirección VARCHAR(255),
    Teléfono VARCHAR(20)
);

CREATE TABLE Domiciliario (
    Codigo INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Horario_disponibilidad VARCHAR(100),
    Medio_transporte VARCHAR(50),
    Licencia_conducción VARCHAR(50),
    Fecha_vencimiento_licencia DATE
);