const express = require('express');
const router = express.Router();
const pool = require('../database');

router.get('/add', (req, res) => {
    res.render('links/add', { script: '' });
});

router.post('/add', async (req, res) => {
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

router.get('/', async (req, res) => {
    const productos = await pool.query('SELECT * FROM Producto');
    res.render('links/list', { productos });
});


//new para interfaz de usuario
router.get('/listUsers', async (req, res) => {
    const productos = await pool.query('SELECT * FROM Producto');
    res.render('links/listUsers', { productos });
});



router.get('/delete/:id', async (req, res) => {
    const { id } = req.params;
    await pool.query('DELETE FROM producto WHERE id = ?', [id]);
    req.flash('success', 'Product Removed Successfully');
    res.redirect('/links');
});

router.get('/edit/:id', async (req, res) => {
    const { id } = req.params;
    const productos = await pool.query('SELECT * FROM producto WHERE id = ?', [id]);
    res.render('links/edit', { productos: productos[0] });
});

router.post('/edit/:id', async (req, res) => {
    const { id } = req.params;
    const { imagen, nombre, descripcion, precio, categoria, disponible } = req.body;
    const updatedProduct = { imagen, nombre, descripcion, precio, categoria, disponible };
    await pool.query('UPDATE producto SET ? WHERE id = ?', [updatedProduct, id]);
    req.flash('success', 'Product Updated Successfully');
    res.redirect('/links');
});

// Agregar producto al carrito
router.post('/cart/add/:id', async (req, res) => {
    const { id } = req.params;
    const producto = await pool.query('SELECT * FROM producto WHERE id = ?', [id]);

    if (producto.length > 0) {
        const item = producto[0];
        if (!req.session.cart) {
            req.session.cart = [];
        }
        req.session.cart.push({ ...item, cartId: Date.now() });
        res.json({ success: true, message: 'Product added to cart successfully!' });
    } else {
        res.json({ success: false, message: 'Product not found' });
    }
});

// Mostrar carrito
router.get('/cart', (req, res) => {
    res.render('links/cart', { cart: req.session.cart });
});

router.post('/cart/delete/:cartId', (req, res) => {
    const { cartId } = req.params;
    const cartIndex = req.session.cart.findIndex(item => item.cartId == cartId);
    if (cartIndex > -1) {
        req.session.cart.splice(cartIndex, 1);
        res.json({ success: true, message: 'El producto ha sido eliminado correctamente.' });
    } else {
        res.status(404).json({ success: false, message: 'Producto no encontrado.' });
    }
});

module.exports = router;
