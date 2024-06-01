const express = require('express');
const router = express.Router();
const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');
const helpers = require('../lib/helpers');
const moment = require('moment-timezone');

router.get('/add', isLoggedIn, (req, res) => {
    res.render('links/add', { script: '' });
});

router.post('/add', isLoggedIn, async (req, res) => {
    const { id, urlimagen, nombre, descripcion, precio, categoria, confirmaciondedisponibilidad } = req.body;

    // Verificar que el campo 'id' no esté vacío
    if (!id) {
        const script = `Swal.fire('Error', 'El campo "Código del producto" no puede estar vacío.', 'error');`;
        return res.render('links/add', { script });
    }

    // Verificar que 'id' sea un número entero
    if (!Number.isInteger(Number(id))) {
        const script = `Swal.fire('Error', 'El campo "Código del producto" debe ser un número entero.', 'error');`;
        return res.render('links/add', { script });
    }

    const existingProduct = await pool.query('SELECT * FROM producto WHERE id = ?', [id]);
    if (existingProduct.length > 0) {
        const script = `Swal.fire('Error', 'Ya existe un producto con el mismo código.', 'error');`;
        return res.render('links/add', { script });
    }

    const isValidText = (text) => /^[a-zA-ZñÑáéíóúÁÉÍÓÚüÜ\s]+$/.test(text);
    if (!isValidText(nombre) || !isValidText(descripcion) || !isValidText(categoria) || !isValidText(confirmaciondedisponibilidad)) {
        const script = `Swal.fire('Error', 'Los campos de texto deben contener solo letras.', 'error');`;
        return res.render('links/add', { script });
    }

    if (!Number.isInteger(Number(precio))) {
        const script = `Swal.fire('Error', 'El precio debe ser un número entero.', 'error');`;
        return res.render('links/add', { script });
    }

    const newProduct = { id, urlimagen, nombre, descripcion, precio, categoria, confirmaciondedisponibilidad };
    await pool.query('INSERT INTO producto SET ?', [newProduct]);
    const script = `Swal.fire('Éxito', 'Producto guardado exitosamente.', 'success');`;
    res.render('links/add', { script });
});

router.get('/', isLoggedIn, async (req, res) => {
    const productos = await pool.query('SELECT * FROM producto');
    res.render('links/list', { productos });
});

router.get('/listUsers', isLoggedIn, async (req, res) => {
    const productos = await pool.query('SELECT * FROM producto');
    res.render('links/listUsers', { productos });
});

router.get('/delete/:id', isLoggedIn, async (req, res) => {
    const { id } = req.params;
    await pool.query('DELETE FROM producto WHERE id = ?', [id]);
    req.flash('success', 'Product Removed Successfully');
    res.redirect('/links');
});

router.get('/edit/:id', isLoggedIn, async (req, res) => {
    const { id } = req.params;
    const productos = await pool.query('SELECT * FROM producto WHERE id = ?', [id]);
    res.render('links/edit', { productos: productos[0] });
});

router.post('/edit/:id', isLoggedIn, async (req, res) => {
    const { id } = req.params;
    const { urlimagen, nombre, descripcion, precio, categoria, confirmaciondedisponibilidad } = req.body;
    const updatedProduct = { urlimagen, nombre, descripcion, precio, categoria, confirmaciondedisponibilidad };
    await pool.query('UPDATE producto SET ? WHERE id = ?', [updatedProduct, id]);
    req.flash('success', 'Product Updated Successfully');
    res.redirect('/links');
});

// Agregar producto al carrito
router.post('/cart/add/:id', isLoggedIn, async (req, res) => {
    const { id } = req.params;
    const producto = await pool.query('SELECT * FROM producto WHERE id = ?', [id]);

    if (producto.length > 0) {
        const item = producto[0];
        if (!req.session.cart) {
            req.session.cart = [];
        }

        const cartIndex = req.session.cart.findIndex(p => p.id === id);
        if (cartIndex > -1) {
            req.session.cart[cartIndex].cantidad++;
        } else {
            item.cantidad = 1;
            req.session.cart.push({ ...item, cartId: Date.now() });
        }

        res.json({ success: true, message: 'Product added to cart successfully!' });
    } else {
        res.json({ success: false, message: 'Product not found' });
    }
});

// Mostrar carrito
router.get('/cart', isLoggedIn, async (req, res) => {
    const direcciones = await pool.query('SELECT * FROM direcciones WHERE id_cliente = ?', [req.user.id]);
    res.render('links/cart', { cart: req.session.cart, direcciones });
});

router.post('/cart/delete/:cartId', isLoggedIn, (req, res) => {
    const { cartId } = req.params;
    const cartIndex = req.session.cart.findIndex(item => item.cartId == cartId);
    if (cartIndex > -1) {
        req.session.cart.splice(cartIndex, 1);
        res.json({ success: true, message: 'El producto ha sido eliminado correctamente.' });
    } else {
        res.status(404).json({ success: false, message: 'Producto no encontrado.' });
    }
});

// Guardar nueva dirección
router.post('/addDireccion', isLoggedIn, async (req, res) => {
    const { direccion } = req.body;
    const id_cliente = req.user.id;

    try {
        // Verificar si el cliente existe en la tabla cliente
        const clienteResult = await pool.query('SELECT * FROM cliente WHERE id = ?', [id_cliente]);
        if (clienteResult.length === 0) {
            // Insertar el cliente en la tabla cliente si no existe
            await pool.query('INSERT INTO cliente (id, nombre, apellido) VALUES (?, ?, ?)', [id_cliente, req.user.username, '']);
        }

        // Verificar si la dirección ya existe para este usuario
        const existingDireccion = await pool.query('SELECT * FROM direcciones WHERE direccionCliente = ? AND id_cliente = ?', [direccion, id_cliente]);
        if (existingDireccion.length > 0) {
            return res.json({ success: false, message: 'Esta dirección ya existe.' });
        }

        // Insertar la nueva dirección en la base de datos
        await pool.query('INSERT INTO direcciones (direccionCliente, id_cliente) VALUES (?, ?)', [direccion, id_cliente]);
        res.json({ success: true, message: 'Dirección guardada con éxito.' });
    } catch (error) {
        console.error(error);
        res.json({ success: false, message: 'No se pudo guardar la dirección.' });
    }
});

// Finalizar compra
router.post('/cart/checkout', isLoggedIn, async (req, res) => {
    const user = req.user;
    if (!user) {
        return res.json({ success: false, message: 'Usuario no autenticado.' });
    }

    const { id: id_usuario } = user;
    const { deliveryOption, direccionId } = req.body;
    if (!req.session.cart || req.session.cart.length === 0) {
        return res.json({ success: false, message: 'El carrito está vacío.' });
    }

    try {
        // Verificar si el usuario está en la tabla cliente
        const clienteResult = await pool.query('SELECT * FROM cliente WHERE id = ?', [id_usuario]);
        if (clienteResult.length === 0) {
            // Si no está, insertar el usuario en la tabla cliente
            await pool.query('INSERT INTO cliente (id, nombre, apellido) VALUES (?, ?, ?)', [id_usuario, user.username, '']);
        }

        const total = req.session.cart.reduce((sum, item) => sum + item.precio * item.cantidad, 0);
        const fechaCompra = new Date();
        const fechaCompraStr = fechaCompra.toISOString().slice(0, 10);
        const horaCompraStr = fechaCompra.toISOString().slice(11, 19);

        const result = await pool.query('INSERT INTO compras (id_cliente, fecha_compra, hora_compra, total) VALUES (?, ?, ?, ?)', [id_usuario, fechaCompraStr, horaCompraStr, total]);

        const id_compra = result.insertId;

        for (const item of req.session.cart) {
            await pool.query('INSERT INTO detalle_compra (id_compra, id_producto, cantidad, precio_unitario) VALUES (?, ?, ?, ?)', [id_compra, item.id, item.cantidad, item.precio]);
        }

        // Marcar el pedido como pendiente en la cocina
        await pool.query('INSERT INTO pedidos_cocina (id_compra, estado) VALUES (?, ?)', [id_compra, 'pendiente']);

        req.session.cart = []; // Vaciar el carrito después de la compra
        res.json({ success: true, message: 'Compra realizada con éxito.', roles: user.roles });
    } catch (error) {
        console.error(error);
        res.json({ success: false, message: 'No se pudo realizar la compra.' });
    }
});





router.get('/empleado', isLoggedIn, (req, res) => {
    res.render('links/empleados', { script: '' });
});

router.post('/empleado', isLoggedIn, async (req, res) => {
    const { username, password, roles, nombre_completo, id, telefono, tipo_vehiculo, numero_licencia, fecha_vencimiento_licencia } = req.body;

    const existingUser = await pool.query('SELECT * FROM users WHERE username = ?', [username]);
    if (existingUser.length > 0) {
        const script = `Swal.fire('Error', 'Ya existe un usuario con el mismo nombre de usuario.', 'error');`;
        return res.render('links/empleados', { script });
    }

    const isValidText = (text) => /^[a-zA-ZñÑáéíóúÁÉÍÓÚüÜ\s]+$/.test(text);
    if (!isValidText(username) || !isValidText(roles)) {
        const script = `Swal.fire('Error', 'Los campos de texto deben contener solo letras.', 'error');`;
        return res.render('links/empleados', { script });
    }

    if (password.length < 6) {
        const script = `Swal.fire('Error', 'La contraseña debe tener al menos 6 caracteres.', 'error');`;
        return res.render('links/empleados', { script });
    }

    const encryptedPassword = await helpers.encryptPassword(password)
    const newUser={
        username,
        password: encryptedPassword,
        id_persona: id,
        roles
    };
    await pool.query('INSERT INTO users SET ?', [newUser]);
    const newEmployee ={
        nombre_completo,
        numero_identificacion: id,
        telefono,
        roles,
        username
    };
    await pool.query('INSERT INTO empleados SET ?', [newEmployee]);
    if(roles==='domiciliario'){
        const newDomiciliario = {
            numero_identificacion: id,
            medio_transporte: roles === 'domiciliario' ? tipo_vehiculo : null,
            licencia_conduccion: (tipo_vehiculo === 'moto' || tipo_vehiculo === 'carro') ? numero_licencia : null,
            fecha_fin_licencia: (tipo_vehiculo === 'moto' || tipo_vehiculo === 'carro') ? fecha_vencimiento_licencia : null
        };
        await pool.query('INSERT INTO domiciliario SET ?', [newDomiciliario]);
    }

    const script = `Swal.fire('Éxito', 'Empleado guardado exitosamente.', 'success');`;
    res.render('links/empleados', { script });
});

router.get('/domiciliario', isLoggedIn, async (req, res) => {
    res.render('links/domiciliario');
});

// Ruta para mostrar los detalles de la compra asignada al domiciliario
router.get('/domiciliario/:id', isLoggedIn, async (req, res) => {
    const { id: id_domiciliario } = req.params;
    try {
        // Obtener el id_compra desde la tabla domicilios
        const compraResult = await pool.query(`
            SELECT id_compra, id as id_domicilio 
            FROM domicilios
            WHERE id_domiciliario = ? AND fecha_entrega IS NULL
        `, [id_domiciliario]);

        console.log('Compra Result:', compraResult); // Agregar este log

        if (compraResult.length === 0) {
            return res.render('links/domiciliario', { message: 'No tienes asignaciones pendientes.' });
        }

        const id_compra = compraResult[0].id_compra;
        const id_domicilio = compraResult[0].id_domicilio;

        // Obtener información de los productos que debe llevar el domiciliario
        const productosResult = await pool.query(`
            SELECT producto.id, producto.nombre, detalle_compra.cantidad, producto.urlimagen, ? as id_domicilio, ? as id_domiciliario
            FROM domicilios
            JOIN domiciliario ON domicilios.id_domiciliario = domiciliario.id
            JOIN empleados ON empleados.numero_identificacion = domiciliario.numero_identificacion
            JOIN users ON empleados.username = users.username
            JOIN compras ON compras.id = domicilios.id_compra
            JOIN detalle_compra ON compras.id = detalle_compra.id_compra
            JOIN producto ON detalle_compra.id_producto = producto.id
            WHERE domiciliario.id = ? AND domicilios.fecha_entrega IS NULL
        `, [id_domicilio, id_domiciliario, id_domiciliario]);

        console.log('Productos Result:', productosResult); // Agregar este log

        if (productosResult.length === 0) {
            return res.render('links/domiciliario', { message: 'No tienes asignaciones pendientes.' });
        }

        // Obtener la dirección de entrega usando id_compra
        const direccionResult = await pool.query(`
            SELECT direcciones.direccionCliente 
            FROM compras
            JOIN cliente ON cliente.id = compras.id_cliente
            JOIN direcciones ON cliente.id = direcciones.id_cliente
            JOIN domicilios ON domicilios.id_compra = compras.id
            WHERE compras.id = ? AND domicilios.fecha_entrega IS NULL
        `, [id_compra]);

        console.log('Dirección Result:', direccionResult); // Agregar este log

        if (direccionResult.length === 0) {
            return res.render('links/domiciliario', { message: 'No se pudo encontrar la dirección de entrega.' });
        }

        const direccion = direccionResult[0].direccionCliente;

        res.render('links/domiciliario', {
            productos: productosResult,
            direccion,
            id_domicilio,
            id_domiciliario
        });
    } catch (error) {
        console.error(error);
        res.render('links/domiciliario', { message: 'Error al obtener los detalles de la compra.' });
    }
});


router.post('/entregado', isLoggedIn, async (req, res) => {
    const { id_domicilio, id_domiciliario } = req.body;

    // Ajustar la fecha y hora a tu zona horaria local
    const fechaEntrega = moment().tz('America/Bogota'); // Cambia 'America/Bogota' a tu zona horaria local
    const fechaEntregaStr = fechaEntrega.format('YYYY-MM-DD');
    const horaEntregaStr = fechaEntrega.format('HH:mm:ss');

    console.log('Fecha de Entrega:', fechaEntregaStr);
    console.log('Hora de Entrega:', horaEntregaStr);

    try {
        // Actualizar la fecha y hora de entrega en la tabla domicilios
        await pool.query(`
            UPDATE domicilios
            SET fecha_entrega = ?, hora_entrega = ?
            WHERE id = ?
        `, [fechaEntregaStr, horaEntregaStr, id_domicilio]);

        // Actualizar el horario disponible y estado en la tabla domiciliario
        await pool.query(`
            UPDATE domiciliario
            SET horario_disponible = ?, estado = 'Si'
            WHERE id = ?
        `, [fechaEntregaStr + ' ' + horaEntregaStr, id_domiciliario]);

        res.json({ success: true, message: 'Entrega registrada correctamente.' });
    } catch (error) {
        console.error(error);
        res.json({ success: false, message: 'No se pudo registrar la entrega.' });
    }
});

router.get('/cocina', isLoggedIn, async (req, res) => {
    try {
        const pedidosResult = await pool.query(`
            SELECT pc.id_compra, p.nombre, dc.cantidad
            FROM pedidos_cocina pc
            JOIN detalle_compra dc ON pc.id_compra = dc.id_compra
            JOIN producto p ON dc.id_producto = p.id
            WHERE pc.estado = 'pendiente'
        `);

        const pedidos = pedidosResult.reduce((acc, pedido) => {
            if (!acc[pedido.id_compra]) {
                acc[pedido.id_compra] = { id_compra: pedido.id_compra, productos: [] };
            }
            acc[pedido.id_compra].productos.push({ nombre: pedido.nombre, cantidad: pedido.cantidad });
            return acc;
        }, {});

        res.render('links/cocina', { pedidos: Object.values(pedidos) });
    } catch (error) {
        console.error(error);
        res.render('links/cocina', { message: 'Error al obtener los pedidos.' });
    }
});

router.post('/marcar-pedido-listo', isLoggedIn, async (req, res) => {
    const { id_compra } = req.body;

    try {
        // Verificar si hay domiciliarios disponibles
        const domiciliarioResult = await pool.query(`
            SELECT id
            FROM domiciliario
            WHERE estado = 'Si'
            ORDER BY horario_disponible ASC
            LIMIT 1
        `);

        if (domiciliarioResult.length === 0) {
            return res.json({ success: false, message: 'Domiciliarios no disponibles por el momento.' });
        }

        const id_domiciliario = domiciliarioResult[0].id;

        // Marcar el pedido como listo en la cocina
        await pool.query('UPDATE pedidos_cocina SET estado = ? WHERE id_compra = ?', ['listo', id_compra]);

        const fechaEnvio = new Date();
        const fechaEnvioStr = fechaEnvio.toISOString().slice(0, 10);
        const horaEnvioStr = fechaEnvio.toISOString().slice(11, 19);

        await pool.query('INSERT INTO domicilios (id_compra, id_domiciliario, fecha_envio, hora_envio) VALUES (?, ?, ?, ?)', [id_compra, id_domiciliario, fechaEnvioStr, horaEnvioStr]);

        // Actualizar estado del domiciliario
        await pool.query('UPDATE domiciliario SET estado = ?, horario_disponible = ? WHERE id = ?', ['No', null, id_domiciliario]);

        res.json({ success: true, message: 'Pedido marcado como listo y domiciliario asignado.' });
    } catch (error) {
        console.error(error);
        res.json({ success: false, message: 'No se pudo marcar el pedido como listo.' });
    }
});



router.get('/cocina', isLoggedIn, async (req, res)=>{
    res.render('links/cocina')
})



module.exports = router;
