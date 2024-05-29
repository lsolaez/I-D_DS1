const express = require('express');
const router = express.Router();
const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');

router.get('/add', isLoggedIn, (req, res) => {
    res.render('links/add', { script: '' });
});

router.post('/add', isLoggedIn, async (req, res) => {
    const { id, imagen, nombre, descripcion, precio, categoria, disponible } = req.body;

    // Validación de código único
    const existingProduct = await pool.query('SELECT * FROM Producto WHERE id = ?', [id]);
    if (existingProduct.length > 0) {
        const script = `Swal.fire('Error', 'Ya existe un producto con el mismo código.', 'error');`;
        return res.render('links/add', { script });
    }
    // Validaciones de contenido de texto
    const isValidText = (text) => /^[a-zA-ZñÑáéíóúÁÉÍÓÚüÜ\s]+$/.test(text);
    if (!isValidText(nombre) || !isValidText(descripcion) || !isValidText(categoria) || !isValidText(disponible)) {
        const script = `Swal.fire('Error', 'Los campos de texto deben contener solo letras.', 'error');`;
        return res.render('links/add', { script });
    }

    // Validación de precio entero
    if (!Number.isInteger(Number(precio))) {
        const script = `Swal.fire('Error', 'El precio debe ser un número entero.', 'error');`;
        return res.render('links/add', { script });
    }

    const newProduct = { id, imagen, nombre, descripcion, precio, categoria, disponible };
    await pool.query('INSERT INTO Producto SET ?', [newProduct]);
    const script = `Swal.fire('Éxito', 'Producto guardado exitosamente.', 'success');`;
    res.render('links/add', { script });
});

router.get('/', isLoggedIn, async (req, res) => {
    const productos = await pool.query('SELECT * FROM Producto');
    res.render('links/list', { productos });
});

// Nueva ruta para interfaz de usuario
router.get('/listUsers', isLoggedIn, async (req, res) => {
    const productos = await pool.query('SELECT * FROM Producto');
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
    const { imagen, nombre, descripcion, precio, categoria, disponible } = req.body;
    const updatedProduct = { imagen, nombre, descripcion, precio, categoria, disponible };
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
router.get('/cart', isLoggedIn, (req, res) => {
    res.render('links/cart', { cart: req.session.cart });
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

// Finalizar compra
router.post('/cart/checkout', isLoggedIn, async (req, res) => {
    const user = req.user;
    if (!user) {
        return res.json({ success: false, message: 'Usuario no autenticado.' });
    }

    const { id: id_usuario } = user;
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

        req.session.cart = []; // Vaciar el carrito después de la compra
        await pool.query('UPDATE users SET cart = ? WHERE id = ?', [JSON.stringify(req.session.cart), id_usuario]);

        res.json({ success: true, message: 'Compra realizada con éxito.', role: user.role });
    } catch (error) {
        console.error(error);
        res.json({ success: false, message: 'No se pudo realizar la compra.' });
    }
});

module.exports = router;
