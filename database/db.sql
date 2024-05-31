CREATE DATABASE bakery;
USE bakery;

-- Tabla 'cliente'
CREATE TABLE cliente (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50)
);

-- Tabla 'usuario'
CREATE TABLE users (
    id INT(11) NOT NULL AUTO_INCREMENT,
    username varchar(50) NOT NULL,
    password varchar(60) NOT NULL,
    id_cliente INT,
    cart json,
    PRIMARY KEY (id)
);
ALTER TABLE users ADD COLUMN roles ENUM('usuario', 'admin') DEFAULT 'usuario';

ALTER TABLE users AUTO_INCREMENT = 1; 

-- Tabla 'direcciones'
CREATE TABLE direcciones (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    direccionCliente VARCHAR(100),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);
ALTER TABLE direcciones AUTO_INCREMENT = 1; 
-- Tabla 'producto'
CREATE TABLE producto (
    id INT PRIMARY KEY,
    cantidad INT,
    urlimagen VARCHAR(255),
    confirmaciondedisponibilidad VARCHAR(10),
    nombre VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10,2),
    categoria VARCHAR(50)
);

-- Tabla 'caja'
CREATE TABLE caja (
    id INT PRIMARY KEY,
    detalle_tarifa VARCHAR(100),
    pago_pedido DECIMAL(10,2)
);
-- Tabla 'cocina'
CREATE TABLE cocina (
    id INT PRIMARY KEY,
    fecha_finalizada_preparacion DATE,
    hora_finalizada_preparacion TIME,
    nombre_producto VARCHAR(100),
    descripcion_producto TEXT,
    estado_producto VARCHAR(50)
);

-- Tabla 'compras'
CREATE TABLE compras (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    fecha_compra DATE,
    hora_compra TIME,
    total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);

-- Tabla 'detalle_compra'
CREATE TABLE detalle_compra (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_compra INT,
    id_producto INT,
    cantidad INT,
    precio_unitario DECIMAL(10,2),
    FOREIGN KEY (id_compra) REFERENCES compras(id),
    FOREIGN KEY (id_producto) REFERENCES producto(id)
);
-- Tabla 'licencia_conduccion'
CREATE TABLE licencia_conduccion (
    id INT PRIMARY KEY,
    fecha_inicio_licencia DATE,
    finalizacion_licencia DATE
);

-- Tabla 'domiciliario'
CREATE TABLE domiciliario (
    id INT PRIMARY KEY,
    medio_transporte VARCHAR(50),
    horario_disponible TIME,
    id_licencia_conduccion INT,
    FOREIGN KEY (id_licencia_conduccion) REFERENCES licencia_conduccion(id)
);

-- Tabla 'pedido_domicilio'
CREATE TABLE pedido_domicilio (
    id INT PRIMARY KEY,
    horario_envio TIME,
    fecha_envio DATE,
    fecha_fin_servicio DATE,
    hora_fin_servicio TIME,
    clave_cliente INT,
    id_producto INT,
    id_domiciliario INT,
    id_direccion_cliente INT,
    FOREIGN KEY (clave_cliente) REFERENCES cliente(id),
    FOREIGN KEY (id_producto) REFERENCES producto(id),
    FOREIGN KEY (id_domiciliario) REFERENCES domiciliario(id),
    FOREIGN KEY (id_direccion_cliente) REFERENCES direcciones(id)
);


-- Tabla 'decide_recoger_producto'
CREATE TABLE decide_recoger_producto (
    id INT PRIMARY KEY,
    direccion_tienda_unica VARCHAR(100),
    id_cliente INT,
    fecha_asignada_recoger DATE,
    hora_asignada_recoger TIME,
    id_producto INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    FOREIGN KEY (id_producto) REFERENCES producto(id)
);

-- Tabla 'administrador'
CREATE TABLE administrador (
    id INT PRIMARY KEY,
    id_producto_domicilio INT,
    id_caja INT,
    confirmacion_pedido BOOLEAN,
    id_producto_recogido_cliente INT,
    finalizacion_pedido BOOLEAN,
    id_cocina INT,
    id_domiciliario INT,
    FOREIGN KEY (id_producto_domicilio) REFERENCES producto(id),
    FOREIGN KEY (id_caja) REFERENCES caja(id),
    FOREIGN KEY (id_producto_recogido_cliente) REFERENCES producto(id),
    FOREIGN KEY (id_cocina) REFERENCES cocina(id),
    FOREIGN KEY (id_domiciliario) REFERENCES domiciliario(id)
);

-- Tabla 'accesibilidad'
CREATE TABLE accesibilidad (
    id INT PRIMARY KEY,
    id_cliente INT,
    id_caja INT,
    id_cocina INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    FOREIGN KEY (id_caja) REFERENCES caja(id),
    FOREIGN KEY (id_cocina) REFERENCES cocina(id)
);