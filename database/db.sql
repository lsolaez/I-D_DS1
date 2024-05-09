Create database bakery;

use bakery;

create table users(
    id INT(11) NOT NULL,
    username varchar(16) NOT NULL,
    password varchar(60) NOT NULL,
    fullname varchar(100) NOT NULL,
);
alter table users
    modify column id INT(11) NOT NULL AUTO_INCREMENT =1;

CREATE TABLE Producto (
    Código INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Descripción TEXT,
    Precio DECIMAL(10, 2),
    Categoría VARCHAR(50)
);

CREATE TABLE Cliente (
    Código INT PRIMARY KEY,
    Dirección VARCHAR(255),
    Teléfono VARCHAR(20)
);

CREATE TABLE Domiciliario (
    Código INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Horario_disponibilidad VARCHAR(100),
    Medio_transporte VARCHAR(50),
    Licencia_conducción VARCHAR(50),
    Fecha_vencimiento_licencia DATE
);