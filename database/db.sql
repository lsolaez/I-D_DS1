CREATE DATABASE bakery;
USE bakery;

CREATE TABLE users(
    id INT(11) NOT NULL AUTO_INCREMENT,
    username VARCHAR(16) NOT NULL,
    password VARCHAR(60) NOT NULL,
    fullname VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
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
    Codigo INT PRIMARY KEY,
    Direccion VARCHAR(255),  
    Telefono VARCHAR(20),    
    Usuario VARCHAR(50),
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    FOREIGN KEY (Codigo) REFERENCES users(id)
);

CREATE TABLE Domiciliario (
    Codigo INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Horario_disponibilidad VARCHAR(100),
    Medio_transporte VARCHAR(50),
    Licencia_conduccion VARCHAR(50),
    Fecha_vencimiento_licencia DATE,
    FOREIGN KEY (Codigo) REFERENCES users(id)  
);

CREATE TABLE Tienda (
    Codigo INT PRIMARY KEY,
    Direccion VARCHAR(255)  
);

CREATE TABLE Pedido (
    Codigo INT PRIMARY KEY,
    Fecha_hora_envio DATETIME,
    Fecha_hora_fin_servicio DATETIME,
    Direccion_entrega VARCHAR(255),
    Tipo_recogida ENUM('En tienda', 'A domicilio'),
    Codigo_cliente INT,
    Codigo_domiciliario INT,
    Codigo_tienda INT,
    FOREIGN KEY (Codigo_cliente) REFERENCES Cliente(Codigo),
    FOREIGN KEY (Codigo_domiciliario) REFERENCES Domiciliario(Codigo),
    FOREIGN KEY (Codigo_tienda) REFERENCES Tienda(Codigo)
);

CREATE TABLE Compra (
    Codigo INT PRIMARY KEY,
    Cantidad INT,
    Fecha_compra DATE,
    Codigo_cliente INT,
    Codigo_producto INT,
    Codigo_pedido INT,
    FOREIGN KEY (Codigo_cliente) REFERENCES Cliente(Codigo),
    FOREIGN KEY (Codigo_producto) REFERENCES Producto(Codigo),
    FOREIGN KEY (Codigo_pedido) REFERENCES Pedido(Codigo)
);
