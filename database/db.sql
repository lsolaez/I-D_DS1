CREATE DATABASE bakery;
USE bakery;

CREATE TABLE users(
    id INT(11) NOT NULL AUTO_INCREMENT,
    username VARCHAR(16) NOT NULL,
    password VARCHAR(60) NOT NULL,
    fullname VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE users
MODIFY COLUMN id INT(11) NOT NULL AUTO_INCREMENT=1;

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
    Teléfono VARCHAR(20),
    Usuario VARCHAR(50),
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    FOREIGN KEY (Código) REFERENCES users(id)
);

CREATE TABLE Domiciliario (
    Código INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Horario_disponibilidad VARCHAR(100),
    Medio_transporte VARCHAR(50),
    Licencia_conducción VARCHAR(50),
    Fecha_vencimiento_licencia DATE,
    FOREIGN KEY (Código) REFERENCES users(id)
);

CREATE TABLE Tienda (
    Código INT PRIMARY KEY,
    Dirección VARCHAR(255)
);

CREATE TABLE Pedido (
    Código INT PRIMARY KEY,
    Fecha_hora_envío DATETIME,
    Fecha_hora_fin_servicio DATETIME,
    Dirección_entrega VARCHAR(255),
    Tipo_recogida ENUM('En tienda', 'A domicilio'),
    Código_cliente INT,
    Código_domiciliario INT,
    Código_tienda INT,
    FOREIGN KEY (Código_cliente) REFERENCES Cliente(Código),
    FOREIGN KEY (Código_domiciliario) REFERENCES Domiciliario(Código),
    FOREIGN KEY (Código_tienda) REFERENCES Tienda(Código)
);

CREATE TABLE Compra (
    Código INT PRIMARY KEY,
    Cantidad INT,
    Fecha_compra DATE,
    Código_cliente INT,
    Código_producto INT,
    Código_pedido INT,
    FOREIGN KEY (Código_cliente) REFERENCES Cliente(Código),
    FOREIGN KEY (Código_producto) REFERENCES Producto(Código),
    FOREIGN KEY (Código_pedido) REFERENCES Pedido(Código)
);
