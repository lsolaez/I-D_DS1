-- Insertando datos en la tabla 'cliente'
INSERT INTO cliente (id, nombre, apellido) VALUES (3, 'Carlos', 'Rodriguez');
INSERT INTO cliente (id, nombre, apellido) VALUES (4, 'Ana', 'Martinez');
INSERT INTO cliente (id, nombre, apellido) VALUES (5, 'Luis', 'Gonzalez');
INSERT INTO cliente (id, nombre, apellido) VALUES (6, 'Sofia', 'Fernandez');
INSERT INTO cliente (id, nombre, apellido) VALUES (7, 'Diego', 'Lopez');
INSERT INTO cliente (id, nombre, apellido) VALUES (8, 'Isabel', 'Morales');
INSERT INTO cliente (id, nombre, apellido) VALUES (9, 'Ricardo', 'Guerrero');
INSERT INTO cliente (id, nombre, apellido) VALUES (10, 'Carmen', 'Torres');
INSERT INTO cliente (id, nombre, apellido) VALUES (11, 'Fernando', 'Ruiz');
INSERT INTO cliente (id, nombre, apellido) VALUES (12, 'Patricia', 'Ramirez');
INSERT INTO cliente (id, nombre, apellido) VALUES (13, 'Sergio', 'Ortiz');
INSERT INTO cliente (id, nombre, apellido) VALUES (14, 'Laura', 'Garcia');
INSERT INTO cliente (id, nombre, apellido) VALUES (15, 'Javier', 'Vargas');
INSERT INTO cliente (id, nombre, apellido) VALUES (16, 'Teresa', 'Mendoza');
INSERT INTO cliente (id, nombre, apellido) VALUES (17, 'Rafael', 'Castillo');
INSERT INTO cliente (id, nombre, apellido) VALUES (18, 'Sara', 'Perez');
INSERT INTO cliente (id, nombre, apellido) VALUES (19, 'Hector', 'Gomez');
INSERT INTO cliente (id, nombre, apellido) VALUES (20, 'Lorena', 'Diaz');
INSERT INTO cliente (id, nombre, apellido) VALUES (21, 'Oscar', 'Hernandez');
INSERT INTO cliente (id, nombre, apellido) VALUES (22, 'Rosa', 'Sanchez');


-- Insertando datos en la tabla 'usuario'
INSERT INTO usuario (id, nombre_cliente, password, usuariocliente) VALUES (3, 'Carlos', 'passwordCarlos', 'usuarioCarlos');
INSERT INTO usuario (id, nombre_cliente, password, usuariocliente) VALUES (4, 'Ana', 'passwordAna', 'usuarioAna');
INSERT INTO usuario (id, nombre_cliente, password, usuariocliente) VALUES (5, 'Luis', 'passwordLuis', 'usuarioLuis');
INSERT INTO usuario (id, nombre_cliente, password, usuariocliente) VALUES (6, 'Sofia', 'passwordSofia', 'usuarioSofia');
INSERT INTO usuario (id, nombre_cliente, password, usuariocliente) VALUES (7, 'Diego', 'passwordDiego', 'usuarioDiego');
INSERT INTO usuario (id, nombre_cliente, password, usuariocliente) VALUES (8, 'Isabel', 'passwordIsabel', 'usuarioIsabel');
INSERT INTO usuario (id, nombre_cliente, password, usuariocliente) VALUES (9, 'Ricardo', 'passwordRicardo', 'usuarioRicardo');
INSERT INTO usuario (id, nombre_cliente, password, usuariocliente) VALUES (10, 'Carmen', 'passwordCarmen', 'usuarioCarmen');
INSERT INTO usuario (id, nombre_cliente, password, usuariocliente) VALUES (11, 'Fernando', 'passwordFernando', 'usuarioFernando');
INSERT INTO usuario (id, nombre_cliente, password, usuariocliente) VALUES (12, 'Patricia', 'passwordPatricia', 'usuarioPatricia');
INSERT INTO usuario (id, nombre_cliente, password, usuariocliente) VALUES (13, 'Sergio', 'passwordSergio', 'usuarioSergio');
INSERT INTO usuario (id, nombre_cliente, password, usuariocliente) VALUES (14, 'Laura', 'passwordLaura', 'usuarioLaura');
INSERT INTO usuario (id, nombre_cliente, password, usuariocliente) VALUES (15, 'Javier', 'passwordJavier', 'usuarioJavier');
INSERT INTO usuario (id, nombre_cliente, password, usuariocliente) VALUES (16, 'Teresa', 'passwordTeresa', 'usuarioTeresa');
INSERT INTO usuario (id, nombre_cliente, password, usuariocliente) VALUES (17, 'Rafael', 'passwordRafael', 'usuarioRafael');
INSERT INTO usuario (id, nombre_cliente, password, usuariocliente) VALUES (18, 'Sara', 'passwordSara', 'usuarioSara');
INSERT INTO usuario (id, nombre_cliente, password, usuariocliente) VALUES (19, 'Hector', 'passwordHector', 'usuarioHector');
INSERT INTO usuario (id, nombre_cliente, password, usuariocliente) VALUES (20, 'Lorena', 'passwordLorena', 'usuarioLorena');
INSERT INTO usuario (id, nombre_cliente, password, usuariocliente) VALUES (21, 'Oscar', 'passwordOscar', 'usuarioOscar');
INSERT INTO usuario (id, nombre_cliente, password, usuariocliente) VALUES (22, 'Rosa', 'passwordRosa', 'usuarioRosa');


-- Insertando datos en la tabla 'direcciones'
INSERT INTO direcciones (id, direccionCliente, id_cliente) VALUES (3, 'Calle 789', 3);
INSERT INTO direcciones (id, direccionCliente, id_cliente) VALUES (4, 'Avenida 1011', 4);
INSERT INTO direcciones (id, direccionCliente, id_cliente) VALUES (5, 'Calle 1213', 5);
INSERT INTO direcciones (id, direccionCliente, id_cliente) VALUES (6, 'Avenida 1415', 6);
INSERT INTO direcciones (id, direccionCliente, id_cliente) VALUES (7, 'Calle 1617', 7);
INSERT INTO direcciones (id, direccionCliente, id_cliente) VALUES (8, 'Avenida 1819', 8);
INSERT INTO direcciones (id, direccionCliente, id_cliente) VALUES (9, 'Calle 2021', 9);
INSERT INTO direcciones (id, direccionCliente, id_cliente) VALUES (10, 'Avenida 2223', 10);
INSERT INTO direcciones (id, direccionCliente, id_cliente) VALUES (11, 'Calle 2425', 11);
INSERT INTO direcciones (id, direccionCliente, id_cliente) VALUES (12, 'Avenida 2627', 12);
INSERT INTO direcciones (id, direccionCliente, id_cliente) VALUES (13, 'Calle 2829', 13);
INSERT INTO direcciones (id, direccionCliente, id_cliente) VALUES (14, 'Avenida 3031', 14);
INSERT INTO direcciones (id, direccionCliente, id_cliente) VALUES (15, 'Calle 3233', 15);
INSERT INTO direcciones (id, direccionCliente, id_cliente) VALUES (16, 'Avenida 3435', 16);
INSERT INTO direcciones (id, direccionCliente, id_cliente) VALUES (17, 'Calle 3637', 17);
INSERT INTO direcciones (id, direccionCliente, id_cliente) VALUES (18, 'Avenida 3839', 18);
INSERT INTO direcciones (id, direccionCliente, id_cliente) VALUES (19, 'Calle 4041', 19);
INSERT INTO direcciones (id, direccionCliente, id_cliente) VALUES (20, 'Avenida 4243', 20);
INSERT INTO direcciones (id, direccionCliente, id_cliente) VALUES (21, 'Calle 4445', 21);
INSERT INTO direcciones (id, direccionCliente, id_cliente) VALUES (22, 'Avenida 4647', 22);

-- Insertando datos en la tabla 'producto'
INSERT INTO producto (id, cantidad, urlimagen, confirmaciondedisponibilidad, nombre, descripcion, precio, categoria) VALUES (3, 15, 'urlimagen3', true, 'Galletas', 'Galletas de avena y miel', 3000, 'Panaderia');
INSERT INTO producto (id, cantidad, urlimagen, confirmaciondedisponibilidad, nombre, descripcion, precio, categoria) VALUES (4, 20, 'urlimagen4', true, 'Donas', 'Donas glaseadas', 2500, 'Pasteleria');
INSERT INTO producto (id, cantidad, urlimagen, confirmaciondedisponibilidad, nombre, descripcion, precio, categoria) VALUES (5, 10, 'urlimagen5', true, 'Empanadas', 'Empanadas de pollo', 2000, 'Comida rápida');
INSERT INTO producto (id, cantidad, urlimagen, confirmaciondedisponibilidad, nombre, descripcion, precio, categoria) VALUES (6, 5, 'urlimagen6', true, 'Pizza', 'Pizza de pepperoni', 15000, 'Comida rápida');
INSERT INTO producto (id, cantidad, urlimagen, confirmaciondedisponibilidad, nombre, descripcion, precio, categoria) VALUES (7, 8, 'urlimagen7', true, 'Hamburguesa', 'Hamburguesa con queso', 12000, 'Comida rápida');
INSERT INTO producto (id, cantidad, urlimagen, confirmaciondedisponibilidad, nombre, descripcion, precio, categoria) VALUES (8, 10, 'urlimagen8', true, 'Sandwich', 'Sandwich de jamón y queso', 8000, 'Comida rápida');
INSERT INTO producto (id, cantidad, urlimagen, confirmaciondedisponibilidad, nombre, descripcion, precio, categoria) VALUES (9, 20, 'urlimagen9', true, 'Ensalada', 'Ensalada de frutas', 7000, 'Saludable');
INSERT INTO producto (id, cantidad, urlimagen, confirmaciondedisponibilidad, nombre, descripcion, precio, categoria) VALUES (10, 15, 'urlimagen10', true, 'Jugo', 'Jugo de naranja natural', 5000, 'Bebidas');
INSERT INTO producto (id, cantidad, urlimagen, confirmaciondedisponibilidad, nombre, descripcion, precio, categoria) VALUES (11, 10, 'urlimagen11', true, 'Café', 'Café americano', 3000, 'Bebidas');
INSERT INTO producto (id, cantidad, urlimagen, confirmaciondedisponibilidad, nombre, descripcion, precio, categoria) VALUES (12, 5, 'urlimagen12', true, 'Té', 'Té de manzanilla', 2500, 'Bebidas');
INSERT INTO producto (id, cantidad, urlimagen, confirmaciondedisponibilidad, nombre, descripcion, precio, categoria) VALUES (13, 15, 'urlimagen13', true, 'Agua', 'Agua mineral', 2000, 'Bebidas');
INSERT INTO producto (id, cantidad, urlimagen, confirmaciondedisponibilidad, nombre, descripcion, precio, categoria) VALUES (14, 20, 'urlimagen14', true, 'Refresco', 'Refresco de cola', 2500, 'Bebidas');
INSERT INTO producto (id, cantidad, urlimagen, confirmaciondedisponibilidad, nombre, descripcion, precio, categoria) VALUES (15, 10, 'urlimagen15', true, 'Cerveza', 'Cerveza rubia', 4000, 'Bebidas');
INSERT INTO producto (id, cantidad, urlimagen, confirmaciondedisponibilidad, nombre, descripcion, precio, categoria) VALUES (16, 5, 'urlimagen16', true, 'Vino', 'Vino tinto', 15000, 'Bebidas');
INSERT INTO producto (id, cantidad, urlimagen, confirmaciondedisponibilidad, nombre, descripcion, precio, categoria) VALUES (17, 8, 'urlimagen17', true, 'Whisky', 'Whisky escocés', 30000, 'Bebidas');
INSERT INTO producto (id, cantidad, urlimagen, confirmaciondedisponibilidad, nombre, descripcion, precio, categoria) VALUES (18, 10, 'urlimagen18', true, 'Ron', 'Ron añejo', 20000, 'Bebidas');
INSERT INTO producto (id, cantidad, urlimagen, confirmaciondedisponibilidad, nombre, descripcion, precio, categoria) VALUES (19, 20, 'urlimagen19', true, 'Vodka', 'Vodka ruso', 25000, 'Bebidas');
INSERT INTO producto (id, cantidad, urlimagen, confirmaciondedisponibilidad, nombre, descripcion, precio, categoria) VALUES (20, 15, 'urlimagen20', true, 'Tequila', 'Tequila mexicano', 20000, 'Bebidas');
INSERT INTO producto (id, cantidad, urlimagen, confirmaciondedisponibilidad, nombre, descripcion, precio, categoria) VALUES (21, 10, 'urlimagen21', true, 'Ginebra', 'Ginebra inglesa', 15000, 'Bebidas');
INSERT INTO producto (id, cantidad, urlimagen, confirmaciondedisponibilidad, nombre, descripcion, precio, categoria) VALUES (22, 5, 'urlimagen22', true, 'Champagne', 'Champagne francés', 30000, 'Bebidas');


-- Insertando datos en la tabla 'domiciliario'
INSERT INTO domiciliario (id, medio_transporte, horario_disponible, id_licencia_conduccion) VALUES (2, 'Bicicleta', '09:00:00', 2);
INSERT INTO domiciliario (id, medio_transporte, horario_disponible, id_licencia_conduccion) VALUES (3, 'Moto', '10:00:00', 3);
INSERT INTO domiciliario (id, medio_transporte, horario_disponible, id_licencia_conduccion) VALUES (4, 'Carro', '11:00:00', 4);
INSERT INTO domiciliario (id, medio_transporte, horario_disponible, id_licencia_conduccion) VALUES (5, 'Bicicleta', '12:00:00', 5);
INSERT INTO domiciliario (id, medio_transporte, horario_disponible, id_licencia_conduccion) VALUES (6, 'Moto', '13:00:00', 6);
INSERT INTO domiciliario (id, medio_transporte, horario_disponible, id_licencia_conduccion) VALUES (7, 'Carro', '14:00:00', 7);
INSERT INTO domiciliario (id, medio_transporte, horario_disponible, id_licencia_conduccion) VALUES (8, 'Bicicleta', '15:00:00', 8);
INSERT INTO domiciliario (id, medio_transporte, horario_disponible, id_licencia_conduccion) VALUES (9, 'Moto', '16:00:00', 9);
INSERT INTO domiciliario (id, medio_transporte, horario_disponible, id_licencia_conduccion) VALUES (10, 'Carro', '17:00:00', 10);
INSERT INTO domiciliario (id, medio_transporte, horario_disponible, id_licencia_conduccion) VALUES (11, 'Bicicleta', '18:00:00', 11);
INSERT INTO domiciliario (id, medio_transporte, horario_disponible, id_licencia_conduccion) VALUES (12, 'Moto', '19:00:00', 12);
INSERT INTO domiciliario (id, medio_transporte, horario_disponible, id_licencia_conduccion) VALUES (13, 'Carro', '20:00:00', 13);
INSERT INTO domiciliario (id, medio_transporte, horario_disponible, id_licencia_conduccion) VALUES (14, 'Bicicleta', '21:00:00', 14);
INSERT INTO domiciliario (id, medio_transporte, horario_disponible, id_licencia_conduccion) VALUES (15, 'Moto', '22:00:00', 15);
INSERT INTO domiciliario (id, medio_transporte, horario_disponible, id_licencia_conduccion) VALUES (16, 'Carro', '23:00:00', 16);
INSERT INTO domiciliario (id, medio_transporte, horario_disponible, id_licencia_conduccion) VALUES (17, 'Bicicleta', '00:00:00', 17);
INSERT INTO domiciliario (id, medio_transporte, horario_disponible, id_licencia_conduccion) VALUES (18, 'Moto', '01:00:00', 18);
INSERT INTO domiciliario (id, medio_transporte, horario_disponible, id_licencia_conduccion) VALUES (19, 'Carro', '02:00:00', 19);
INSERT INTO domiciliario (id, medio_transporte, horario_disponible, id_licencia_conduccion) VALUES (20, 'Bicicleta', '03:00:00', 20);

-- Insertando datos en la tabla 'licencia_conduccion'
INSERT INTO licencia_conduccion (id, fecha_inicio_licencia, finalizacion_licencia) VALUES (2, '2024-02-01', '2027-01-31');
INSERT INTO licencia_conduccion (id, fecha_inicio_licencia, finalizacion_licencia) VALUES (3, '2024-03-01', '2027-02-28');
INSERT INTO licencia_conduccion (id, fecha_inicio_licencia, finalizacion_licencia) VALUES (4, '2024-04-01', '2027-03-31');
INSERT INTO licencia_conduccion (id, fecha_inicio_licencia, finalizacion_licencia) VALUES (5, '2024-05-01', '2027-04-30');
INSERT INTO licencia_conduccion (id, fecha_inicio_licencia, finalizacion_licencia) VALUES (6, '2024-06-01', '2027-05-31');
INSERT INTO licencia_conduccion (id, fecha_inicio_licencia, finalizacion_licencia) VALUES (7, '2024-07-01', '2027-06-30');
INSERT INTO licencia_conduccion (id, fecha_inicio_licencia, finalizacion_licencia) VALUES (8, '2024-08-01', '2027-07-31');
INSERT INTO licencia_conduccion (id, fecha_inicio_licencia, finalizacion_licencia) VALUES (9, '2024-09-01', '2027-08-31');
INSERT INTO licencia_conduccion (id, fecha_inicio_licencia, finalizacion_licencia) VALUES (10, '2024-10-01', '2027-09-30');
INSERT INTO licencia_conduccion (id, fecha_inicio_licencia, finalizacion_licencia) VALUES (11, '2024-11-01', '2027-10-31');
INSERT INTO licencia_conduccion (id, fecha_inicio_licencia, finalizacion_licencia) VALUES (12, '2024-12-01', '2027-11-30');
INSERT INTO licencia_conduccion (id, fecha_inicio_licencia, finalizacion_licencia) VALUES (13, '2025-01-01', '2028-12-31');
INSERT INTO licencia_conduccion (id, fecha_inicio_licencia, finalizacion_licencia) VALUES (14, '2025-02-01', '2028-01-31');
INSERT INTO licencia_conduccion (id, fecha_inicio_licencia, finalizacion_licencia) VALUES (15, '2025-03-01', '2028-02-29');
INSERT INTO licencia_conduccion (id, fecha_inicio_licencia, finalizacion_licencia) VALUES (16, '2025-04-01', '2028-03-31');
INSERT INTO licencia_conduccion (id, fecha_inicio_licencia, finalizacion_licencia) VALUES (17, '2025-05-01', '2028-04-30');
INSERT INTO licencia_conduccion (id, fecha_inicio_licencia, finalizacion_licencia) VALUES (18, '2025-06-01', '2028-05-31');
INSERT INTO licencia_conduccion (id, fecha_inicio_licencia, finalizacion_licencia) VALUES (19, '2025-07-01', '2028-06-30');
INSERT INTO licencia_conduccion (id, fecha_inicio_licencia, finalizacion_licencia) VALUES (20, '2025-08-01', '2028-07-31');
INSERT INTO licencia_conduccion (id, fecha_inicio_licencia, finalizacion_licencia) VALUES (21, '2025-09-01', '2028-08-31');


-- Insertando datos en la tabla 'pedido_domicilio'
INSERT INTO pedido_domicilio (id, horario_envio, fecha_envio, fecha_fin_servicio, hora_fin_servicio, clave_cliente, id_producto, id_domiciliario, id_direccion_cliente) VALUES (2, '11:00:00', '2024-05-18', '2024-05-18', '12:00:00', 2, 2, 2, 2);
INSERT INTO pedido_domicilio (id, horario_envio, fecha_envio, fecha_fin_servicio, hora_fin_servicio, clave_cliente, id_producto, id_domiciliario, id_direccion_cliente) VALUES (3, '12:00:00', '2024-05-19', '2024-05-19', '13:00:00', 3, 3, 3, 3);
INSERT INTO pedido_domicilio (id, horario_envio, fecha_envio, fecha_fin_servicio, hora_fin_servicio, clave_cliente, id_producto, id_domiciliario, id_direccion_cliente) VALUES (4, '13:00:00', '2024-05-20', '2024-05-20', '14:00:00', 4, 4, 4, 4);
INSERT INTO pedido_domicilio (id, horario_envio, fecha_envio, fecha_fin_servicio, hora_fin_servicio, clave_cliente, id_producto, id_domiciliario, id_direccion_cliente) VALUES (5, '14:00:00', '2024-05-21', '2024-05-21', '15:00:00', 5, 5, 5, 5);
INSERT INTO pedido_domicilio (id, horario_envio, fecha_envio, fecha_fin_servicio, hora_fin_servicio, clave_cliente, id_producto, id_domiciliario, id_direccion_cliente) VALUES (6, '15:00:00', '2024-05-22', '2024-05-22', '16:00:00', 6, 6, 6, 6);
INSERT INTO pedido_domicilio (id, horario_envio, fecha_envio, fecha_fin_servicio, hora_fin_servicio, clave_cliente, id_producto, id_domiciliario, id_direccion_cliente) VALUES (7, '16:00:00', '2024-05-23', '2024-05-23', '17:00:00', 7, 7, 7, 7);
INSERT INTO pedido_domicilio (id, horario_envio, fecha_envio, fecha_fin_servicio, hora_fin_servicio, clave_cliente, id_producto, id_domiciliario, id_direccion_cliente) VALUES (8, '17:00:00', '2024-05-24', '2024-05-24', '18:00:00', 8, 8, 8, 8);
INSERT INTO pedido_domicilio (id, horario_envio, fecha_envio, fecha_fin_servicio, hora_fin_servicio, clave_cliente, id_producto, id_domiciliario, id_direccion_cliente) VALUES (9, '18:00:00', '2024-05-25', '2024-05-25', '19:00:00', 9, 9, 9, 9);
INSERT INTO pedido_domicilio (id, horario_envio, fecha_envio, fecha_fin_servicio, hora_fin_servicio, clave_cliente, id_producto, id_domiciliario, id_direccion_cliente) VALUES (10, '19:00:00', '2024-05-26', '2024-05-26', '20:00:00', 10, 10, 10, 10);
INSERT INTO pedido_domicilio (id, horario_envio, fecha_envio, fecha_fin_servicio, hora_fin_servicio, clave_cliente, id_producto, id_domiciliario, id_direccion_cliente) VALUES (11, '20:00:00', '2024-05-27', '2024-05-27', '21:00:00', 11, 11, 11, 11);
INSERT INTO pedido_domicilio (id, horario_envio, fecha_envio, fecha_fin_servicio, hora_fin_servicio, clave_cliente, id_producto, id_domiciliario, id_direccion_cliente) VALUES (12, '21:00:00', '2024-05-28', '2024-05-28', '22:00:00', 12, 12, 12, 12);
INSERT INTO pedido_domicilio (id, horario_envio, fecha_envio, fecha_fin_servicio, hora_fin_servicio, clave_cliente, id_producto, id_domiciliario, id_direccion_cliente) VALUES (13, '22:00:00', '2024-05-29', '2024-05-29', '23:00:00', 13, 13, 13, 13);
INSERT INTO pedido_domicilio (id, horario_envio, fecha_envio, fecha_fin_servicio, hora_fin_servicio, clave_cliente, id_producto, id_domiciliario, id_direccion_cliente) VALUES (14, '23:00:00', '2024-05-30', '2024-05-30', '00:00:00', 14, 14, 14, 14);
INSERT INTO pedido_domicilio (id, horario_envio, fecha_envio, fecha_fin_servicio, hora_fin_servicio, clave_cliente, id_producto, id_domiciliario, id_direccion_cliente) VALUES (15, '00:00:00', '2024-05-31', '2024-05-31', '01:00:00', 15, 15, 15, 15);
INSERT INTO pedido_domicilio (id, horario_envio, fecha_envio, fecha_fin_servicio, hora_fin_servicio, clave_cliente, id_producto, id_domiciliario, id_direccion_cliente) VALUES (16, '01:00:00', '2024-06-01', '2024-06-01', '02:00:00', 16, 16, 16, 16);
INSERT INTO pedido_domicilio (id, horario_envio, fecha_envio, fecha_fin_servicio, hora_fin_servicio, clave_cliente, id_producto, id_domiciliario, id_direccion_cliente) VALUES (17, '02:00:00', '2024-06-02', '2024-06-02', '03:00:00', 17, 17, 17, 17);
INSERT INTO pedido_domicilio (id, horario_envio, fecha_envio, fecha_fin_servicio, hora_fin_servicio, clave_cliente, id_producto, id_domiciliario, id_direccion_cliente) VALUES (18, '03:00:00', '2024-06-03', '2024-06-03', '04:00:00', 18, 18, 18, 18);
INSERT INTO pedido_domicilio (id, horario_envio, fecha_envio, fecha_fin_servicio, hora_fin_servicio, clave_cliente, id_producto, id_domiciliario, id_direccion_cliente) VALUES (19, '04:00:00', '2024-06-04', '2024-06-04', '05:00:00', 19, 19, 19, 19);
INSERT INTO pedido_domicilio (id, horario_envio, fecha_envio, fecha_fin_servicio, hora_fin_servicio, clave_cliente, id_producto, id_domiciliario, id_direccion_cliente) VALUES (20, '05:00:00', '2024-06-05', '2024-06-05', '06:00:00', 20, 20, 20, 20);
INSERT INTO pedido_domicilio (id, horario_envio, fecha_envio, fecha_fin_servicio, hora_fin_servicio, clave_cliente, id_producto, id_domiciliario, id_direccion_cliente) VALUES (21, '06:00:00', '2024-06-06', '2024-06-06', '07:00:00', 21, 21, 21, 21);


-- Insertando datos en la tabla 'decide_recoger_producto'
INSERT INTO decide_recoger_producto (id, direccion_tienda_unica, id_cliente, fecha_asignada_recoger, hora_asignada_recoger, id_producto) VALUES (2, 'Calle 789', 2, '2024-05-18', '10:00:00', 2);
INSERT INTO decide_recoger_producto (id, direccion_tienda_unica, id_cliente, fecha_asignada_recoger, hora_asignada_recoger, id_producto) VALUES (3, 'Calle 1011', 3, '2024-05-19', '11:00:00', 3);
INSERT INTO decide_recoger_producto (id, direccion_tienda_unica, id_cliente, fecha_asignada_recoger, hora_asignada_recoger, id_producto) VALUES (4, 'Calle 1213', 4, '2024-05-20', '12:00:00', 4);
INSERT INTO decide_recoger_producto (id, direccion_tienda_unica, id_cliente, fecha_asignada_recoger, hora_asignada_recoger, id_producto) VALUES (5, 'Calle 1415', 5, '2024-05-21', '13:00:00', 5);
INSERT INTO decide_recoger_producto (id, direccion_tienda_unica, id_cliente, fecha_asignada_recoger, hora_asignada_recoger, id_producto) VALUES (6, 'Calle 1617', 6, '2024-05-22', '14:00:00', 6);
INSERT INTO decide_recoger_producto (id, direccion_tienda_unica, id_cliente, fecha_asignada_recoger, hora_asignada_recoger, id_producto) VALUES (7, 'Calle 1819', 7, '2024-05-23', '15:00:00', 7);
INSERT INTO decide_recoger_producto (id, direccion_tienda_unica, id_cliente, fecha_asignada_recoger, hora_asignada_recoger, id_producto) VALUES (8, 'Calle 2021', 8, '2024-05-24', '16:00:00', 8);
INSERT INTO decide_recoger_producto (id, direccion_tienda_unica, id_cliente, fecha_asignada_recoger, hora_asignada_recoger, id_producto) VALUES (9, 'Calle 2223', 9, '2024-05-25', '17:00:00', 9);
INSERT INTO decide_recoger_producto (id, direccion_tienda_unica, id_cliente, fecha_asignada_recoger, hora_asignada_recoger, id_producto) VALUES (10, 'Calle 2425', 10, '2024-05-26', '18:00:00', 10);
INSERT INTO decide_recoger_producto (id, direccion_tienda_unica, id_cliente, fecha_asignada_recoger, hora_asignada_recoger, id_producto) VALUES (11, 'Calle 2627', 11, '2024-05-27', '19:00:00', 11);
INSERT INTO decide_recoger_producto (id, direccion_tienda_unica, id_cliente, fecha_asignada_recoger, hora_asignada_recoger, id_producto) VALUES (12, 'Calle 2829', 12, '2024-05-28', '20:00:00', 12);
INSERT INTO decide_recoger_producto (id, direccion_tienda_unica, id_cliente, fecha_asignada_recoger, hora_asignada_recoger, id_producto) VALUES (13, 'Calle 3031', 13, '2024-05-29', '21:00:00', 13);
INSERT INTO decide_recoger_producto (id, direccion_tienda_unica, id_cliente, fecha_asignada_recoger, hora_asignada_recoger, id_producto) VALUES (14, 'Calle 3233', 14, '2024-05-30', '22:00:00', 14);
INSERT INTO decide_recoger_producto (id, direccion_tienda_unica, id_cliente, fecha_asignada_recoger, hora_asignada_recoger, id_producto) VALUES (15, 'Calle 3435', 15, '2024-05-31', '23:00:00', 15);
INSERT INTO decide_recoger_producto (id, direccion_tienda_unica, id_cliente, fecha_asignada_recoger, hora_asignada_recoger, id_producto) VALUES (16, 'Calle 3637', 16, '2024-06-01', '00:00:00', 16);
INSERT INTO decide_recoger_producto (id, direccion_tienda_unica, id_cliente, fecha_asignada_recoger, hora_asignada_recoger, id_producto) VALUES (17, 'Calle 3839', 17, '2024-06-02', '01:00:00', 17);
INSERT INTO decide_recoger_producto (id, direccion_tienda_unica, id_cliente, fecha_asignada_recoger, hora_asignada_recoger, id_producto) VALUES (18, 'Calle 4041', 18, '2024-06-03', '02:00:00', 18);
INSERT INTO decide_recoger_producto (id, direccion_tienda_unica, id_cliente, fecha_asignada_recoger, hora_asignada_recoger, id_producto) VALUES (19, 'Calle 4243', 19, '2024-06-04', '03:00:00', 19);
INSERT INTO decide_recoger_producto (id, direccion_tienda_unica, id_cliente, fecha_asignada_recoger, hora_asignada_recoger, id_producto) VALUES (20, 'Calle 4445', 20, '2024-06-05', '04:00:00', 20);
INSERT INTO decide_recoger_producto (id, direccion_tienda_unica, id_cliente, fecha_asignada_recoger, hora_asignada_recoger, id_producto) VALUES (21, 'Calle 4647', 21, '2024-06-06', '05:00:00', 21);


-- Insertando datos en la tabla 'administrador'
INSERT INTO administrador (id, id_producto_domicilio, id_caja, confirmacion_pedido, id_producto_recogido_cliente, finalizacion_pedido, id_cocina, id_domiciliario) VALUES (2, 2, 2, true, 1, true, 2, 2);
INSERT INTO administrador (id, id_producto_domicilio, id_caja, confirmacion_pedido, id_producto_recogido_cliente, finalizacion_pedido, id_cocina, id_domiciliario) VALUES (3, 3, 3, true, 2, true, 3, 3);
INSERT INTO administrador (id, id_producto_domicilio, id_caja, confirmacion_pedido, id_producto_recogido_cliente, finalizacion_pedido, id_cocina, id_domiciliario) VALUES (4, 4, 4, true, 3, true, 4, 4);
INSERT INTO administrador (id, id_producto_domicilio, id_caja, confirmacion_pedido, id_producto_recogido_cliente, finalizacion_pedido, id_cocina, id_domiciliario) VALUES (5, 5, 5, true, 4, true, 5, 5);
INSERT INTO administrador (id, id_producto_domicilio, id_caja, confirmacion_pedido, id_producto_recogido_cliente, finalizacion_pedido, id_cocina, id_domiciliario) VALUES (6, 6, 6, true, 5, true, 6, 6);
INSERT INTO administrador (id, id_producto_domicilio, id_caja, confirmacion_pedido, id_producto_recogido_cliente, finalizacion_pedido, id_cocina, id_domiciliario) VALUES (7, 7, 7, true, 6, true, 7, 7);
INSERT INTO administrador (id, id_producto_domicilio, id_caja, confirmacion_pedido, id_producto_recogido_cliente, finalizacion_pedido, id_cocina, id_domiciliario) VALUES (8, 8, 8, true, 7, true, 8, 8);
INSERT INTO administrador (id, id_producto_domicilio, id_caja, confirmacion_pedido, id_producto_recogido_cliente, finalizacion_pedido, id_cocina, id_domiciliario) VALUES (9, 9, 9, true, 8, true, 9, 9);
INSERT INTO administrador (id, id_producto_domicilio, id_caja, confirmacion_pedido, id_producto_recogido_cliente, finalizacion_pedido, id_cocina, id_domiciliario) VALUES (10, 10, 10, true, 9, true, 10, 10);
INSERT INTO administrador (id, id_producto_domicilio, id_caja, confirmacion_pedido, id_producto_recogido_cliente, finalizacion_pedido, id_cocina, id_domiciliario) VALUES (11, 11, 11, true, 10, true, 11, 11);
INSERT INTO administrador (id, id_producto_domicilio, id_caja, confirmacion_pedido, id_producto_recogido_cliente, finalizacion_pedido, id_cocina, id_domiciliario) VALUES (12, 12, 12, true, 11, true, 12, 12);
INSERT INTO administrador (id, id_producto_domicilio, id_caja, confirmacion_pedido, id_producto_recogido_cliente, finalizacion_pedido, id_cocina, id_domiciliario) VALUES (13, 13, 13, true, 12, true, 13, 13);
INSERT INTO administrador (id, id_producto_domicilio, id_caja, confirmacion_pedido, id_producto_recogido_cliente, finalizacion_pedido, id_cocina, id_domiciliario) VALUES (14, 14, 14, true, 13, true, 14, 14);
INSERT INTO administrador (id, id_producto_domicilio, id_caja, confirmacion_pedido, id_producto_recogido_cliente, finalizacion_pedido, id_cocina, id_domiciliario) VALUES (15, 15, 15, true, 14, true, 15, 15);
INSERT INTO administrador (id, id_producto_domicilio, id_caja, confirmacion_pedido, id_producto_recogido_cliente, finalizacion_pedido, id_cocina, id_domiciliario) VALUES (16, 16, 16, true, 15, true, 16, 16);
INSERT INTO administrador (id, id_producto_domicilio, id_caja, confirmacion_pedido, id_producto_recogido_cliente, finalizacion_pedido, id_cocina, id_domiciliario) VALUES (17, 17, 17, true, 16, true, 17, 17);
INSERT INTO administrador (id, id_producto_domicilio, id_caja, confirmacion_pedido, id_producto_recogido_cliente, finalizacion_pedido, id_cocina, id_domiciliario) VALUES (18, 18, 18, true, 17, true, 18, 18);
INSERT INTO administrador (id, id_producto_domicilio, id_caja, confirmacion_pedido, id_producto_recogido_cliente, finalizacion_pedido, id_cocina, id_domiciliario) VALUES (19, 19, 19, true, 18, true, 19, 19);
INSERT INTO administrador (id, id_producto_domicilio, id_caja, confirmacion_pedido, id_producto_recogido_cliente, finalizacion_pedido, id_cocina, id_domiciliario) VALUES (20, 20, 20, true, 19, true, 20, 20);
INSERT INTO administrador (id, id_producto_domicilio, id_caja, confirmacion_pedido, id_producto_recogido_cliente, finalizacion_pedido, id_cocina, id_domiciliario) VALUES (21, 21, 21, true, 20, true, 21, 21);


-- Insertando datos en la tabla 'caja'
INSERT INTO caja (id, detalle_tarifa, pago_pedido) VALUES (2, 'Tarifa reducida', 4000);
INSERT INTO caja (id, detalle_tarifa, pago_pedido) VALUES (3, 'Tarifa estándar', 5000);
INSERT INTO caja (id, detalle_tarifa, pago_pedido) VALUES (4, 'Tarifa premium', 6000);
INSERT INTO caja (id, detalle_tarifa, pago_pedido) VALUES (5, 'Tarifa reducida', 4000);
INSERT INTO caja (id, detalle_tarifa, pago_pedido) VALUES (6, 'Tarifa estándar', 5000);
INSERT INTO caja (id, detalle_tarifa, pago_pedido) VALUES (7, 'Tarifa premium', 6000);
INSERT INTO caja (id, detalle_tarifa, pago_pedido) VALUES (8, 'Tarifa reducida', 4000);
INSERT INTO caja (id, detalle_tarifa, pago_pedido) VALUES (9, 'Tarifa estándar', 5000);
INSERT INTO caja (id, detalle_tarifa, pago_pedido) VALUES (10, 'Tarifa premium', 6000);
INSERT INTO caja (id, detalle_tarifa, pago_pedido) VALUES (11, 'Tarifa reducida', 4000);
INSERT INTO caja (id, detalle_tarifa, pago_pedido) VALUES (12, 'Tarifa estándar', 5000);
INSERT INTO caja (id, detalle_tarifa, pago_pedido) VALUES (13, 'Tarifa premium', 6000);
INSERT INTO caja (id, detalle_tarifa, pago_pedido) VALUES (14, 'Tarifa reducida', 4000);
INSERT INTO caja (id, detalle_tarifa, pago_pedido) VALUES (15, 'Tarifa estándar', 5000);
INSERT INTO caja (id, detalle_tarifa, pago_pedido) VALUES (16, 'Tarifa premium', 6000);
INSERT INTO caja (id, detalle_tarifa, pago_pedido) VALUES (17, 'Tarifa reducida', 4000);
INSERT INTO caja (id, detalle_tarifa, pago_pedido) VALUES (18, 'Tarifa estándar', 5000);
INSERT INTO caja (id, detalle_tarifa, pago_pedido) VALUES (19, 'Tarifa premium', 6000);
INSERT INTO caja (id, detalle_tarifa, pago_pedido) VALUES (20, 'Tarifa reducida', 4000);
INSERT INTO caja (id, detalle_tarifa, pago_pedido) VALUES (21, 'Tarifa estándar', 5000);

-- Insertando datos en la tabla 'cocina'
INSERT INTO cocina (id, fecha_finalizada_preparacion, hora_finalizada_preparacion, nombre_producto, descripcion_producto, estado_producto) VALUES (2, '2024-05-18', '09:00:00', 'Galletas', 'Galletas de avena y miel', 'Listo para entregar');
INSERT INTO cocina (id, fecha_finalizada_preparacion, hora_finalizada_preparacion, nombre_producto, descripcion_producto, estado_producto) VALUES (3, '2024-05-19', '10:00:00', 'Donas', 'Donas glaseadas', 'Listo para entregar');
INSERT INTO cocina (id, fecha_finalizada_preparacion, hora_finalizada_preparacion, nombre_producto, descripcion_producto, estado_producto) VALUES (4, '2024-05-20', '11:00:00', 'Empanadas', 'Empanadas de pollo', 'Listo para entregar');
INSERT INTO cocina (id, fecha_finalizada_preparacion, hora_finalizada_preparacion, nombre_producto, descripcion_producto, estado_producto) VALUES (5, '2024-05-21', '12:00:00', 'Pizza', 'Pizza de pepperoni', 'Listo para entregar');
INSERT INTO cocina (id, fecha_finalizada_preparacion, hora_finalizada_preparacion, nombre_producto, descripcion_producto, estado_producto) VALUES (6, '2024-05-22', '13:00:00', 'Hamburguesa', 'Hamburguesa con queso', 'Listo para entregar');
INSERT INTO cocina (id, fecha_finalizada_preparacion, hora_finalizada_preparacion, nombre_producto, descripcion_producto, estado_producto) VALUES (7, '2024-05-23', '14:00:00', 'Sandwich', 'Sandwich de jamón y queso', 'Listo para entregar');
INSERT INTO cocina (id, fecha_finalizada_preparacion, hora_finalizada_preparacion, nombre_producto, descripcion_producto, estado_producto) VALUES (8, '2024-05-24', '15:00:00', 'Ensalada', 'Ensalada de frutas', 'Listo para entregar');
INSERT INTO cocina (id, fecha_finalizada_preparacion, hora_finalizada_preparacion, nombre_producto, descripcion_producto, estado_producto) VALUES (9, '2024-05-25', '16:00:00', 'Jugo', 'Jugo de naranja natural', 'Listo para entregar');
INSERT INTO cocina (id, fecha_finalizada_preparacion, hora_finalizada_preparacion, nombre_producto, descripcion_producto, estado_producto) VALUES (10, '2024-05-26', '17:00:00', 'Café', 'Café americano', 'Listo para entregar');
INSERT INTO cocina (id, fecha_finalizada_preparacion, hora_finalizada_preparacion, nombre_producto, descripcion_producto, estado_producto) VALUES (11, '2024-05-27', '18:00:00', 'Té', 'Té de manzanilla', 'Listo para entregar');
INSERT INTO cocina (id, fecha_finalizada_preparacion, hora_finalizada_preparacion, nombre_producto, descripcion_producto, estado_producto) VALUES (12, '2024-05-28', '19:00:00', 'Agua', 'Agua mineral', 'Listo para entregar');
INSERT INTO cocina (id, fecha_finalizada_preparacion, hora_finalizada_preparacion, nombre_producto, descripcion_producto, estado_producto) VALUES (13, '2024-05-29', '20:00:00', 'Refresco', 'Refresco de cola', 'Listo para entregar');
INSERT INTO cocina (id, fecha_finalizada_preparacion, hora_finalizada_preparacion, nombre_producto, descripcion_producto, estado_producto) VALUES (14, '2024-05-30', '21:00:00', 'Cerveza', 'Cerveza rubia', 'Listo para entregar');
INSERT INTO cocina (id, fecha_finalizada_preparacion, hora_finalizada_preparacion, nombre_producto, descripcion_producto, estado_producto) VALUES (15, '2024-05-31', '22:00:00', 'Vino', 'Vino tinto', 'Listo para entregar');
INSERT INTO cocina (id, fecha_finalizada_preparacion, hora_finalizada_preparacion, nombre_producto, descripcion_producto, estado_producto) VALUES (16, '2024-06-01', '23:00:00', 'Whisky', 'Whisky escocés', 'Listo para entregar');
INSERT INTO cocina (id, fecha_finalizada_preparacion, hora_finalizada_preparacion, nombre_producto, descripcion_producto, estado_producto) VALUES (17, '2024-06-02', '00:00:00', 'Ron', 'Ron añejo', 'Listo para entregar');
INSERT INTO cocina (id, fecha_finalizada_preparacion, hora_finalizada_preparacion, nombre_producto, descripcion_producto, estado_producto) VALUES (18, '2024-06-03', '01:00:00', 'Vodka', 'Vodka ruso', 'Listo para entregar');
INSERT INTO cocina (id, fecha_finalizada_preparacion, hora_finalizada_preparacion, nombre_producto, descripcion_producto, estado_producto) VALUES (19, '2024-06-04', '02:00:00', 'Ginebra', 'Ginebra inglesa', 'Listo para entregar');
INSERT INTO cocina (id, fecha_finalizada_preparacion, hora_finalizada_preparacion, nombre_producto, descripcion_producto, estado_producto) VALUES (20, '2024-06-05', '03:00:00', 'Champagne', 'Champagne francés', 'Listo para entregar');

-- Insertando datos en la tabla 'accesibilidad'
INSERT INTO accesibilidad (id, id_cliente, id_caja, id_cocina) VALUES (2, 2, 2, 2);
INSERT INTO accesibilidad (id, id_cliente, id_caja, id_cocina) VALUES (3, 3, 3, 3);
INSERT INTO accesibilidad (id, id_cliente, id_caja, id_cocina) VALUES (4, 4, 4, 4);
INSERT INTO accesibilidad (id, id_cliente, id_caja, id_cocina) VALUES (5, 5, 5, 5);
INSERT INTO accesibilidad (id, id_cliente, id_caja, id_cocina) VALUES (6, 6, 6, 6);
INSERT INTO accesibilidad (id, id_cliente, id_caja, id_cocina) VALUES (7, 7, 7, 7);
INSERT INTO accesibilidad (id, id_cliente, id_caja, id_cocina) VALUES (8, 8, 8, 8);
INSERT INTO accesibilidad (id, id_cliente, id_caja, id_cocina) VALUES (9, 9, 9, 9);
INSERT INTO accesibilidad (id, id_cliente, id_caja, id_cocina) VALUES (10, 10, 10, 10);
INSERT INTO accesibilidad (id, id_cliente, id_caja, id_cocina) VALUES (11, 11, 11, 11);
INSERT INTO accesibilidad (id, id_cliente, id_caja, id_cocina) VALUES (12, 12, 12, 12);
INSERT INTO accesibilidad (id, id_cliente, id_caja, id_cocina) VALUES (13, 13, 13, 13);
INSERT INTO accesibilidad (id, id_cliente, id_caja, id_cocina) VALUES (14, 14, 14, 14);
INSERT INTO accesibilidad (id, id_cliente, id_caja, id_cocina) VALUES (15, 15, 15, 15);
INSERT INTO accesibilidad (id, id_cliente, id_caja, id_cocina) VALUES (16, 16, 16, 16);
INSERT INTO accesibilidad (id, id_cliente, id_caja, id_cocina) VALUES (17, 17, 17, 17);
INSERT INTO accesibilidad (id, id_cliente, id_caja, id_cocina) VALUES (18, 18, 18, 18);
INSERT INTO accesibilidad (id, id_cliente, id_caja, id_cocina) VALUES (19, 19, 19, 19);
INSERT INTO accesibilidad (id, id_cliente, id_caja, id_cocina) VALUES (20, 20, 20, 20);
INSERT INTO accesibilidad (id, id_cliente, id_caja, id_cocina) VALUES (21, 21, 21, 21);
