const express = require('express');
const router = express.Router();
const pool = require('../database');

router.get('/add', (req, res) => {
    res.render('links/add', { script: '' });
});

router.post('/add', async (req, res) => {
    const { codigo, imagen, nombre, descripcion, precio, categoria, disponible } = req.body;

    // Validación de código único
    const existingProduct = await pool.query('SELECT * FROM Producto WHERE codigo = ?', [codigo]);
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

    const newProduct = { codigo, imagen, nombre, descripcion, precio, categoria, disponible };
    await pool.query('INSERT INTO Producto SET ?', [newProduct]);
    const script = `Swal.fire('Éxito', 'Producto guardado exitosamente.', 'success');`;
    res.render('links/add', { script });
});

router.get('/', async (req, res) => {
    const productos = await pool.query('SELECT * FROM Producto');
    res.render('links/list', { productos });
});

router.get('/delete/:Codigo', async (req, res) => {
    const { Codigo } = req.params;
    await pool.query('DELETE FROM producto WHERE Codigo = ?', [Codigo]);
    req.flash('success', 'Product Removed Successfully');
    res.redirect('/links');
});

router.get('/edit/:Codigo', async (req, res) => {
    const { Codigo } = req.params;
    const productos = await pool.query('SELECT * FROM producto WHERE Codigo = ?', [Codigo]);
    res.render('links/edit', { productos: productos[0] });
});

router.post('/edit/:Codigo', async (req, res) => {
    const { Codigo } = req.params;
    const { imagen, nombre, descripcion, precio, categoria, disponible } = req.body;
    const updatedProduct = { imagen, nombre, descripcion, precio, categoria, disponible };
    await pool.query('UPDATE producto SET ? WHERE Codigo = ?', [updatedProduct, Codigo]);
    req.flash('success', 'Product Updated Successfully');
    res.redirect('/links');
});

// Agregar producto al carrito
router.post('/cart/add/:Codigo', async (req, res) => {
    const { Codigo } = req.params;
    const producto = await pool.query('SELECT * FROM producto WHERE Codigo = ?', [Codigo]);

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
